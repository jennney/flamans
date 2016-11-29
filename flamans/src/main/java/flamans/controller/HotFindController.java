package flamans.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.hot_comment_grade.model.HotCommentGradeDAO;
import flamans.hot_comment_grade.model.HotCommentGradeDTO;
import flamans.hotel_find.model.HotelDAO;
import flamans.hotel_find.model.HotelDTO;
import flamans.member.model.MemberDAO;
import flamans.member.model.MemberDTO;

@Controller
public class HotFindController{
	
	/** 선언부분 */
	//파서 JSON 해독
	JSONParser parser = new JSONParser();
	
	//위시리스트 객체 { [위시리스트 목록] }
	JSONObject wishObject = new JSONObject();
	JSONArray wishArray = new JSONArray();
	
	@Autowired
	private HotelDAO hotel_info;
	
	@Autowired
	private HotCommentGradeDAO hotel_comment;
	
	@Autowired
	private MemberDAO memberdao;
	
	@RequestMapping("/hotel_list.do")
	public ModelAndView hotel_list(@RequestParam(value="list", defaultValue="")String state){
		
		List<HotelDTO> list = null;
		
		if(state.equals("")){
			list = hotel_info.hotel_list();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hotel_info",list);
		mav.setViewName("hotel/hotel_list");
		return mav;
	}
	
	@RequestMapping("/hotel_get_info.do")
	public ModelAndView hotel_get_info(@RequestParam(value="hot_num", defaultValue="")String num){
		
		ModelAndView mav = new ModelAndView();
		
		List<HotelDTO> list = null;
		List<HotCommentGradeDTO> list2 = null;
		
		list = hotel_info.hotel_get_info(num);
		mav.addObject("hotel_info",list);
		
		list2 = hotel_comment.hotel_get_opnion(num);
		mav.addObject("hotel_comment",list2);
	
		mav.setViewName("hotel/hotel_info");
		return mav;
	}
	
	@RequestMapping("/hotel_search_name.do")
	public ModelAndView hotel_search_name(@RequestParam("hotel_name")String find){
		  
	      String hotel_name_Find = find.toLowerCase();
	      
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("find", hotel_name_Find);
	      
	      List<HotelDTO> findList = hotel_info.hotel_search_name(map);
	      
	      ModelAndView mav= new ModelAndView();
	      
	      mav.addObject("hotel_info", findList);
	      mav.setViewName("hotel/hotel_list");
	      return mav;
		  
	}
	
	@RequestMapping("/hotel_input_comment_grade.do")
	public ModelAndView hotel_input_comment_grade(HotCommentGradeDTO commentDTO){
		
		ModelAndView mav = new ModelAndView();
		
		int count = hotel_comment.hotel_input_comment_grade(commentDTO);
		String result = count > 0 ? "후기 등록 성공!":"후기 등록 실패!";
		mav.addObject("msg",result);
		mav.addObject("c_number",commentDTO.getC_number());
		mav.setViewName("hotel/hotel_Msg");
		return mav;
	}
	
	@RequestMapping("/hot_wishlist.do")
	public ModelAndView add_wishlist(
				@RequestParam("hot_num")String num,
				@RequestParam("hotel_link")String link,
				MemberDTO member, 
				HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		//1. 기존의 위시리스트 유효성 검사.
		//2. 호텔의 위시리스트를 파싱하여 가져오기. 
		//3. 병원의 정보만 있는경우 호텔의 위시리스트 추가.
		//4. 그것이 아니라면, 호텔의 중복검사 후 통과되면 위시리스트 추가.
		
		//5. 중복검사 및 새롭게 추가되었으므로 DB에 추가.
		
		/** 세션에 저장되어 있는 아이디의 정보값을 가져오기(위시리스트 가져오기위해서) */
		String id = (String)session.getAttribute("userid");
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url",link+"?hos_num="+num);
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		MemberDTO memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		//1
		if(user_wishlist == null || user_wishlist.equals("")){
			user_wishlist ="nowishlist";
		}
		
		try {
			//2
			wishObject = (JSONObject)parser.parse(user_wishlist);
			wishArray = (JSONArray)wishObject.get("hot");
			
			//병원의 위시리스트가 있지만, 호텔의 위시리스트가 없다면 호텔의 위시리스트를 추가한다.
			
			//3
			if(wishArray == null){
				wishArray = new JSONArray();
				wishArray.add(num);
				wishObject.put("hot", wishArray);
			
			//4
			}else{
				
				for(int i =0; i<wishArray.size(); i++){
					if(num.equals(wishArray.get(i).toString())){
						wishArray.remove(i);
						wishObject.put("hot", wishArray);
						int count = memberdao.memberUpdateWishlist(wishObject.toJSONString(), id);
						String result = count>0?"위시리스트 삭제 성공":"위시리스트 삭제 실패";
						mav.addObject("msg",result);
						mav.addObject("url",link+"?hot_num="+num);
						mav.setViewName("hotel/hotel_msg");
						return mav;
					}
				}
				
				wishArray.add(num);
				wishObject.put("hot", wishArray);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//5
		/** 위시리스트 새롭게 DB에 추가 */
		int count = memberdao.memberUpdateWishlist(wishObject.toJSONString(), id);
		String result = count>0?"위시리스트 등록 성공!":"위시리스트 등록 실패!";
		mav.addObject("msg",result);
		mav.addObject("url",link+"?hot_num="+num);
		mav.setViewName("hotel/hotel_msg");
		
		return mav;
	}
}
