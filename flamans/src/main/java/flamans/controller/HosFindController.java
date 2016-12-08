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

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDAO;
import flamans.hos_find.model.HospitalDTO;
import flamans.hot_comment_grade.model.HotCommentGradeDAO;
import flamans.hot_comment_grade.model.HotCommentGradeDTO;
import flamans.member.model.MemberDAO;
import flamans.member.model.MemberDTO;

@Controller
public class HosFindController {
	
	/** 선언부분 */
	//파서 JSON 해독
	JSONParser parser = new JSONParser();
	
	//위시리스트 객체 { [위시리스트 목록] }
	JSONObject wishObject = new JSONObject();
	JSONArray wishArray = new JSONArray();
	
	@Autowired
	private HospitalDAO hospital_info;
	
	@Autowired
	private HotCommentGradeDAO hospital_comment;
	
	@Autowired
	private MemberDAO memberdao;
	
	@RequestMapping("/hospital_list.do")
	public ModelAndView hospital_list(@RequestParam(value="list", defaultValue="")String state){
		
		List<HospitalDTO> list = null;
		
		if(state.equals("")){
			list = hospital_info.hospital_list();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hospital_info",list);
		mav.setViewName("hospital/hospital_list");
		return mav;
	}
	
	@RequestMapping("/hospital_get_info.do")
	public ModelAndView hospital_get_info(@RequestParam(value="hos_num", defaultValue="")String num){
		
		ModelAndView mav = new ModelAndView();
		
		List<HospitalDTO> list = null;
		List<HotCommentGradeDTO> c_list = null;
		List<DoctorDTO> doc_list = null;
		
		list = hospital_info.hospital_get_info(num);	
		mav.addObject("hospital_info",list);
		
		c_list = hospital_comment.hotel_get_opnion(num);
		mav.addObject("hospital_comment",c_list);
		
		doc_list = hospital_info.hospital_doclist(num);
		mav.addObject("hospital_doclist" , doc_list);
		
		mav.setViewName("hospital/hospital_info");
		return mav;
	}
	
	@RequestMapping("/hospital_search_name.do")
	public ModelAndView hospital_search_name(@RequestParam("hospital_name")String find){
		String hospital_name_Find = find.toLowerCase();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("find", hospital_name_Find);
		
		List<HospitalDTO> findList = hospital_info.hospital_search_name(map);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("hospital_info",findList);
		mav.setViewName("hospital/hospital_list");
		return mav;
	}
	
	@RequestMapping("/hospital_input_comment_grade.do")
	public ModelAndView hospital_input_comment_grade(HotCommentGradeDTO commentDTO){
		
		ModelAndView mav = new ModelAndView();
		
		int count = hospital_comment.hotel_input_comment_grade(commentDTO);
		
		String result = count > 0? "후기 등록 성공!" : "후기 등록 실패!";
		mav.addObject("msg",result);
		mav.addObject("url","hospital_info.do?hos_num="+commentDTO.getC_number());
		mav.setViewName("hospital/hospital_msg");
		return mav;
	}
	
	@RequestMapping("/hos_wishlist.do")
	public ModelAndView add_wishlist(
			@RequestParam("hos_num")String num, 
			@RequestParam("hospital_link")String link,
			MemberDTO memberdto, 
			HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		//1. 기존의 위시리스트 유효성 검사.
		//2. 호텔의 위시리스트를 파싱하여 가져오기. 
		//3. 호텔의 정보만 있는경우 병원의 위시리스트 추가.
		//4. 호텔의 위시리스트 중복검사 후 통과되면 위시리스트 추가. 통과되지 않으면 삭제후 DB에 업데이트.
		
		//5. 중복검사 및 새롭게 추가되었으므로 DB에 추가.
		
		/** 세션에 저장되어 있는 아이디의 정보값을 가져오기(위시리스트 가져오기) */
		String id = (String)session.getAttribute("userid");
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url",link+"?hos_num="+num);
			mav.setViewName("hospital/hospital_msg");
			return mav;
		}
		memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		//1
		if(user_wishlist == null || user_wishlist.equals("")){
			user_wishlist ="nowishlist";
		}
		
		try {
			//2
			wishObject = (JSONObject)parser.parse(user_wishlist);
			wishArray = (JSONArray)wishObject.get("hos");
			
			//병원의 위시리스트가 있지만, 호텔의 위시리스트가 없다면 호텔의 위시리스트를 추가한다.
			
			//3
			if(wishArray == null){
				wishArray = new JSONArray();
				wishArray.add(num);
				wishObject.put("hos", wishArray);
			
			//4
			}else{
				
				for(int i =0; i<wishArray.size(); i++){
					if(num.equals(wishArray.get(i).toString())){
						wishArray.remove(i);
						wishObject.put("hos", wishArray);
						int count = memberdao.memberUpdateWishlist(wishObject.toJSONString(), id);
						String result = count>0?"위시리스트 삭제 성공":"위시리스트 삭제 실패";
						mav.addObject("msg",result);
						mav.addObject("url",link+"?hos_num="+num);
						mav.setViewName("hospital/hospital_msg");
						return mav;
					}
				}
				
				wishArray.add(num);
				wishObject.put("hos", wishArray);
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
		mav.addObject("url",link+"?hos_num="+num);
		mav.setViewName("hospital/hospital_msg");
		
		return mav;
	}
	
	@RequestMapping("/wishlist_view.do")
	public ModelAndView view_wishlist(
			MemberDTO memberdto, 
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("userid");
		if(id==null || id.equals("")){
			mav.addObject("msg","<h4>【 위시리스트 】</h4><hr><h4> 로그인 후 <br/> 확인 가능합니다.</h4>");
			mav.setViewName("hospital/wishlistMsg");
			return mav;
		}
		
		memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		if(user_wishlist == null || user_wishlist.equals("")){
			mav.addObject("msg","<h4>【 위시리스트 】</h4><hr><h4> 위시리스트가 없습니다. 추가해보세요 </h4>");
			mav.setViewName("hospital/wishlistMsg");
			return mav;
		}
		
		mav.addObject("msg",user_wishlist);
		mav.setViewName("hospital/wishlistMsg");
		return mav;
	}
	
	@RequestMapping("/hos_dto_wishlist.do")
	public ModelAndView hoswish_dto(@RequestParam(value="hos_num", defaultValue="")String num){
		ModelAndView mav = new ModelAndView();
		List<HospitalDTO> list = hospital_info.hospital_get_info(num);
		if(list==null || list.equals("")){
			mav.addObject("msg", "해당 병원이 없습니다.");
			mav.addObject("url", "hospital/hospital_list");
			mav.setViewName("hospital_msg");
			return mav;
		}
		
		mav.addObject("msg",list);
		mav.setViewName("hospital/wishlistMsg");
		return mav;
	}
}
	
