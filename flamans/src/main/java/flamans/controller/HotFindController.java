package flamans.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import flamans.hot_comment_grade.model.HotCommentGradeDAO;
import flamans.hot_comment_grade.model.HotCommentGradeDTO;
import flamans.hotel_find.model.HotelDAO;
import flamans.hotel_find.model.HotelDTO;
import flamans.hotel_find.model.HotelPageModule;
import flamans.member.model.MemberDAO;
import flamans.member.model.MemberDTO;
import flamans.paging.PageModule;

@Controller
public class HotFindController{
	
	@Autowired
	private HotelDAO hotel_info;
	
	@Autowired
	private HotCommentGradeDAO hotel_comment;
	
	@Autowired
	private PageModule paging;
	
	@Autowired
	private MemberDAO memberdao;
	
	@Autowired
	private HotelPageModule hotel_paging;
	
	@RequestMapping("/hotel_list.do")
	public ModelAndView hotel_list(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="list", defaultValue="")String state){
		ModelAndView mav = new ModelAndView();
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
	
//	public ModelAndView hotel_roominfo(
//			){
//		
//		JSONParser parser = new JSONParser();
//		
//		JSONObject hotsearchObject1 = new JSONObject();
//		JSONObject hotsearchObject2 = new JSONObject();
//		
//		JSONArray hotsearchArray1 = new JSONArray();
//		
//		ModelAndView mav= new ModelAndView();
//		
//		
//		
//		return mav;
//	}
	
	
//	@SuppressWarnings("unchecked")
//	@RequestMapping("/hotel_search_name.do")
//	public ModelAndView hotel_search_name(
//		@RequestParam("find_name")String find_name,
//		@RequestParam("checkin")String checkin,
//		@RequestParam("checkout")String checkout,
//		@RequestParam("room_info")String room_info,
//		HttpSession session
//		) throws ParseException{
//	
//		/** 선언부분 */
//		//파서 JSON 해독
//		JSONParser parser = new JSONParser();
//		
//		JSONObject hotsearchObject1 = new JSONObject();
//		JSONObject hotsearchObject2 = new JSONObject();
//		
//		JSONArray hotsearchArray1 = new JSONArray();
//
//		ModelAndView mav = new ModelAndView();
//		
//		String id = (String)session.getAttribute("userid");
//		
//		if(!(id==null || id.equals(""))){
//			
//			String hotel_name_find = find_name.toLowerCase();
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			map.put("find", hotel_name_find);
//			List<HotelDTO> findList = hotel_info.hotel_search_name(map);
//			
//			if(findList.isEmpty()){
//				mav.addObject("hotel_info", findList);
//				mav.setViewName("hotel/hotel_list");
//				return mav;
//			}
//			
//			MemberDTO memberdto = memberdao.memberLogin(id);
//			String user_history = memberdto.getM_history();
//			
//			//검색결과가 있을경우 !=
//			if(!(user_history == null || user_history.equals(""))){
//				hotsearchObject1 = (JSONObject)parser.parse(user_history);
//				hotsearchArray1 = (JSONArray)hotsearchObject1.get("hot");
//			}
//			
//			//검색 결과가 있지만, hot의 검색리스트가 없을경우 hotsearchArray == null 이므로 재정의.
//			if(hotsearchArray1==null){
//				hotsearchArray1 = new JSONArray();
//			}
//			
//			String hot_img = findList.get(0).getHot_img();
//			String write_date = hotel_info.get_date();
//			
//			hotsearchObject2.put("write_date", write_date);
//			hotsearchObject2.put("find_name", find_name);
//			hotsearchObject2.put("checkin", checkin);
//			hotsearchObject2.put("checkout", checkout);
//			hotsearchObject2.put("room_info", room_info);
//			hotsearchObject2.put("hot_img", hot_img);
//
//			if(hotsearchArray1.size()>8){
//				hotsearchArray1.remove(1);
//			}
//			
//			hotsearchArray1.add(hotsearchObject2);
//			System.out.println("리스트 사이즈? ="+hotsearchArray1.size());
//			hotsearchObject1.put("hot", hotsearchArray1);
//			System.out.println(hotsearchObject1.toJSONString());
//			
//			hotel_info.add_memberFind(hotsearchObject1.toString(), id);
//			
//			mav.addObject("hotel_info", findList);
//			mav.setViewName("hotel/hotel_list");
//			return mav;
//			
//		}
//		String hotel_name_Find = find_name.toLowerCase();
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("find", hotel_name_Find);
//		
//		List<HotelDTO> findList = hotel_info.hotel_search_name(map);
//		
//		mav.addObject("hotel_info", findList);
//		mav.setViewName("hotel/hotel_list");
//		return mav;
//	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/hotel_sub_search.do")
	public ModelAndView hotel_sub_search(
		@RequestParam(value="grade1",defaultValue="0")int grade1,@RequestParam(value="grade2",defaultValue="0")int grade2,@RequestParam(value="grade3",defaultValue="0")int grade3,@RequestParam(value="grade4",defaultValue="0")int grade4,@RequestParam(value="grade5",defaultValue="0")int grade5,
		@RequestParam(value="option1",defaultValue="0")String option1,@RequestParam(value="option2",defaultValue="0")String option2,@RequestParam(value="option3",defaultValue="0")String option3,@RequestParam(value="option4",defaultValue="0")String option4,@RequestParam(value="option5",defaultValue="0")String option5,
		@RequestParam(value="star1",defaultValue="0")int star1,@RequestParam(value="star2",defaultValue="0")int star2,@RequestParam(value="star3",defaultValue="0")int star3,@RequestParam(value="star4",defaultValue="0")int star4,@RequestParam(value="star5",defaultValue="0")int star5,
		@RequestParam(value="price",defaultValue="200000")int price,
		@RequestParam(value="findname", defaultValue="")String findname,
		@RequestParam(value="checkin", defaultValue="")String checkin,
		@RequestParam(value="checkout", defaultValue="")String checkout,
		@RequestParam(value="room_info", defaultValue="")String room_info,
		
		HttpSession session,
		@RequestParam(value="cp",defaultValue="1")int cp
		) throws ParseException{
			
			/** 선언부분 */
			//파서 JSON 해독
			JSONParser parser = new JSONParser();
			
			//JSONObject
			JSONObject hotsearchObject1 = new JSONObject();
			JSONObject hotsearchObject2 = new JSONObject();
			
			JSONArray  hotsearchArray1  = new JSONArray();
			
			String id = (String)session.getAttribute("userid");
			
			if(!(id==null || id.equals("")) && (findname!=null && !findname.equals(""))){
				
				String hotel_name_find = findname.toLowerCase();
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("find", hotel_name_find);
				
				List<HotelDTO> findList = hotel_info.hotel_search_name(map);
				
				if(!findList.isEmpty()){
				
				MemberDTO memberdto = memberdao.memberLogin(id);
				String user_history = memberdto.getM_history();
				
				//검색결과가 있을경우 !=
				if(!(user_history == null || user_history.equals(""))){
					hotsearchObject1 = (JSONObject)parser.parse(user_history);
					hotsearchArray1 = (JSONArray)hotsearchObject1.get("hot");
				}
				
				//검색 결과가 있지만, hot의 검색리스트가 없을경우 hotsearchArray == null 이므로 재정의.
				if(hotsearchArray1==null){
					hotsearchArray1 = new JSONArray();
				}
				
				String hot_img = findList.get(0).getHot_img();
				String write_date = hotel_info.get_date();
				
				hotsearchObject2.put("write_date", write_date);
				hotsearchObject2.put("find_name", findname);
				hotsearchObject2.put("checkin", checkin);
				hotsearchObject2.put("checkout", checkout);
				hotsearchObject2.put("room_info", room_info);
				hotsearchObject2.put("hot_img", hot_img);

				if(hotsearchArray1.size()>8){
					hotsearchArray1.remove(1);
				}
				
				hotsearchArray1.add(hotsearchObject2);
				hotsearchObject1.put("hot", hotsearchArray1);
				
				hotel_info.add_memberFind(hotsearchObject1.toString(), id);				
			}
		}
		
		/** 선언부분 */
		
		String hotel_name_find = findname.toLowerCase();
		
		int grade[] = {grade1,grade2,grade3,grade4,grade5};
		String option[] = {option1,option2,option3,option4,option5};
		int star[] = {star1,star2,star3,star4,star5};
		
		StringBuffer sb= new StringBuffer();
		
		//플래그 변수들. where_con & z
		
		//첫번째 조건이 들어갈때 조건문을 걸어줘야함
		int z=0;
		
		//한개의조건문을 탈출했을경우 and 값을 넣어줘야하는 플래그변수
		int and_flag =0;
		
		for(int i=0; i<grade.length; i++){
			if(grade[i]!=0 && z==0){
				
				if(and_flag==1){
					sb.append(" and ");
				}
				
				sb.append("hot_grade in ("+grade[i]);
				z=1;
			}else if(grade[i]!=0 && z==1){
				sb.append(","+grade[i]);
			}
		}
		
		if(z==1){
			sb.append(")");
			and_flag=1;
		}
		
		//두번째조건이 들어갈때
		z=0;
		for(int i=0; i<option.length; i++){
			if(!option[i].equals("0") && z==0){
				
				if(and_flag==1){
					sb.append(" and ");
				}
				
				sb.append(" hot_num in (select hot_num from fm_hotroom where room_option in ('"+option[i]+"'");
				z=1;
				
			}else if(!option[i].equals("0") && z==1){
				sb.append(", '"+option[i]+"'");
			}
		}
		if(z==1){
			sb.append("))");
			and_flag=1;
		}
		
		//가격조건이 들어갈때
		z=0;
		if(price!=0 && z==0){
			
			if(and_flag==1){
				sb.append(" and ");
			}
			
			sb.append(" hot_num in (select hot_num from fm_hotroom where roomprice <= "+price);
			
			z=1;
			
		}
		if(z==1){
			sb.append(")");
			and_flag=1;
		}
		
		//세번째조건이 들어갈때
		z=0;
		for(int i=0; i<star.length; i++){
			if(star[i]!=0 && z==0){
				
				if(and_flag==1){
					sb.append(" and ");
				}
				
				sb.append("hot_star in ("+star[i]);
				z=1;
				
			}else if(star[i]!=0 && z==1){
				sb.append(", "+star[i]);
			}
		}
		if(z==1){
			sb.append(")");
			and_flag=1;
		}

		
		System.out.println("sb.toString="+sb.toString());
		
		int totalCnt = hotel_info.getSubTotalCnt(sb.toString(), hotel_name_find);
		int listSize = 5;
		int pageSize = 5;
		
		List<HotelDTO> list = hotel_info.hotel_sub_search(sb.toString(),hotel_name_find, cp, listSize);
//		List<HotelDTO> list1 = hotel_info.hotel_sub_search(sb.toString(),hotel_name_find, cp, 50);
//		List<HotelDTO> list2 = new ArrayList<HotelDTO>();
		
//		for(int i=5*(cp-1); i<(5*cp)-1; i++){
//		for(int i=0; i<list1.size(); i++){
//			if(i==list1.size())break;
//			JSONObject roomJsonObject = (JSONObject)parser.parse(list1.get(i).getHot_roominfo().toString());
//			
//			//호텔의 방정보키값(room)만을 뽑아냄
//			JSONArray roomJsonArray = (JSONArray)roomJsonObject.get("room");
//			
//			//싱글룸의 정보
//			JSONObject singleRoomObject = (JSONObject)parser.parse(roomJsonArray.get(0).toString());
//			
//			//싱글룸의 정보중 첫번째키값 price Value
//			if(price>Integer.parseInt(singleRoomObject.get("price").toString())){
//				System.out.println("singleRoomObject.get"+(i+1)+"번쨰 방의 싱글룸값="+singleRoomObject.get("price"));
//				list2.add(list1.get(i));
//			}
//		}
		
		
		
		String pageStr1 = hotel_paging.makePage("hotel_sub_search", totalCnt, listSize, pageSize, cp, grade, option, hotel_name_find, price);
		
//		System.out.println("list.get(0).getHot_roominfo() = "+list.get(0).getHot_roominfo());
//		
//		JSONObject search_result_object = (JSONObject)parser.parse(list.get(0).getHot_roominfo());
//		System.out.println("search_result_object = "+search_result_object);
//		
//		JSONArray search_result_array = (JSONArray)search_result_object.get("room");
//		System.out.println("search_result_array.get(0).toArray() ="+search_result_array.toString());
//		if(price!=0 && z==0){
//			if(where_con==0){
//				sb.append("where ");
//				where_con=1;
//			}
//			
//			if(and_flag==1){
//				sb.append(" and ");
//			}
//			
//			sb.append("price = "+price);
//			z=1;
//		}
		
		ModelAndView mav = new ModelAndView("flamansJson","list",list);
		mav.addObject("pageStr1", pageStr1);
		return mav;
	}
	
	@RequestMapping("/wishlist_compare.do")
	public ModelAndView wishlist_compare(
			HttpSession session
			){
		ModelAndView mav= new ModelAndView();
		
		String id = (String)session.getAttribute("userid");
		
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","index.do");
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		mav.setViewName("hotel/hotel_compare");
		return mav;
	}
	
	@RequestMapping("/member_find.do")
	public ModelAndView member_find(
			HttpSession session
			){
		ModelAndView mav= new ModelAndView();
		
		String id = (String)session.getAttribute("userid");
		
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","index.do");
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		mav.setViewName("hotel/member_find");
		return mav;
	}
	
	@RequestMapping("/member_find_list.do")
	public ModelAndView member_find_list(
			HttpSession session
			) throws ParseException{
		
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("userid");
		
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","index.do");
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		MemberDTO memberdto = memberdao.memberLogin(id);
		String member_find_list = memberdto.getM_history();
		
		if(member_find_list == null || member_find_list.equals("")){
			member_find_list ="";
		}
		
		ModelAndView mav1 = new ModelAndView("flamansJson","list", member_find_list);
		
		return mav1;
	}
	
	@RequestMapping("/member_wish_hlist.do")
	public ModelAndView member_wish_hlist(
			HttpSession session
			) throws ParseException{
		
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("userid");
		
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","index.do");
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		MemberDTO memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		// 1
		if(user_wishlist == null || user_wishlist.equals("")){
			user_wishlist ="nowishlist";
		}
		
		ModelAndView mav1 = new ModelAndView("flamansJson","list",user_wishlist);
		
		return mav1;
	}
	
	@RequestMapping("/hotel_input_comment_grade.do")
	public ModelAndView hotel_input_comment_grade(
			@RequestParam(value="c_number",defaultValue="")String c_number,
			@RequestParam(value="c_grade",defaultValue="")String c_grade,
			@RequestParam(value="c_comment",defaultValue="")String c_comment,
			HttpSession session){
		
		
		
		ModelAndView mav = new ModelAndView();
		
		if(c_comment.equals("") || c_grade.equals("")){
			mav.addObject("msg","내용 또는 평점을 입력해주세요!");
			mav.addObject("url","hotel_get_info.do?hot_num="+c_number);
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		String username = (String)session.getAttribute("username");
		int c_grade1 = Integer.parseInt(c_grade);
		
		HotCommentGradeDTO commentDTO = null;
		commentDTO.setC_comment(c_comment);
		commentDTO.setC_grade(c_grade1);
		commentDTO.setC_number(c_number);
		commentDTO.setC_writer(username);
		
		if(username==null || username.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","hotel_get_info.do?hot_num="+commentDTO.getC_number());
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		int count = hotel_comment.hotel_input_comment_grade(commentDTO);
		String result = count > 0 ? "후기 등록 성공!":"후기 등록 실패!";
		mav.addObject("msg",result);
		mav.addObject("url","hotel_get_info.do?hot_num="+commentDTO.getC_number());
		mav.setViewName("hotel/hotel_msg");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/hot_wishlist.do")
	public ModelAndView add_wishlist(
				@RequestParam("hot_num")String num,
				@RequestParam("hotel_link")String link,
				MemberDTO member,
				HttpSession session){
		
		/** 선언부분 */
		//파서 JSON 해독
		JSONParser parser = new JSONParser();
		
		//위시리스트 객체 { [위시리스트 목록] }
		JSONObject hotsearchObject = new JSONObject();
		JSONObject hotsearchObject1 = new JSONObject();
		
		JSONArray hotsearchArray1 = new JSONArray();
		
		//1. 기존의 위시리스트 유효성 검사.
		//2. 호텔의 위시리스트를 파싱하여 가져오기. 
		//3. 병원의 정보만 있는경우 호텔의 위시리스트 추가.
		//4. 그것이 아니라면, 호텔의 중복검사 후 통과되면 위시리스트 추가.
		//5. 중복검사 및 새롭게 추가되었으므로 DB에 추가.
		
		ModelAndView mav = new ModelAndView();
		
		/** 세션에 저장되어 있는 아이디의 정보값을 가져오기(위시리스트 가져오기위해서) */
		String id = (String)session.getAttribute("userid");
		
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url",link+"?hot_num="+num);
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		// 유저의 위시리스트 가져오기
		MemberDTO memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		List<HotelDTO> list = hotel_info.hotel_get_info(num);
		
		//1
		try {
			
			if(!(user_wishlist == null || user_wishlist.equals("") || user_wishlist.equals("{\"hot\":[]}"))){
				//2 hot와 hos를 분리하기위해서 parser를통해 Object로 변환한다.
				hotsearchObject = (JSONObject)parser.parse(user_wishlist);
				//hos가 아닌 hot만을 분리하겠다.
				hotsearchArray1 = (JSONArray)hotsearchObject.get("hot");
			}
			
			//위시리스트 널값 오류 처리
			if(hotsearchArray1 == null || hotsearchArray1.equals("")){
				hotsearchArray1 = new JSONArray();
			}
			
			//중복 플래그 변수 z
			int z = 1;
			for(int i = 0; i<hotsearchArray1.size(); i++){
				
				// 문자를 쪼개어 번호비교에 임시방편으로 사용 ( hot_num을 비교할수 있는 다른방법을 생각해보자. )
				String[] Array = hotsearchArray1.get(i).toString().split("\"");
				
				for(int j=0; j<Array.length; j++){
					if(num.equals(Array[j])){
						hotsearchArray1.remove(i);
						z=2;
					}
				}
			}
			
			// 중복검사가되어 삭제되었을때.
			if(z==2){
				hotsearchObject.put("hot", hotsearchArray1);
				int count = hotel_info.memberUpdateWishlist(hotsearchObject.toJSONString(), id);
				
				String result = count>0? "위시리스트 삭제 성공":"위시리스트 삭제 실패";
				
				mav.addObject("msg",result);
				mav.addObject("url",link+"?hot_num="+num);
				mav.setViewName("hotel/hotel_msg");
				return mav;
			}
			
			String wishdate=hotel_info.get_date();
			
			hotsearchObject1.put("hot_num",list.get(0).getHot_num());
			hotsearchObject1.put("hot_name",list.get(0).getHot_name());
			hotsearchObject1.put("hot_addr",list.get(0).getHot_addr());
			hotsearchObject1.put("hot_img",list.get(0).getHot_img());
			hotsearchObject1.put("hot_content",list.get(0).getHot_content());
			hotsearchObject1.put("hot_map_info",list.get(0).getHot_mapinfo());
			hotsearchObject1.put("hot_grade",list.get(0).getHot_grade());
			hotsearchObject1.put("hot_roominfo",list.get(0).getHot_roominfo());
			hotsearchObject1.put("hot_option",list.get(0).getHot_option());
			hotsearchObject1.put("hot_etc",list.get(0).getHot_etc());
			hotsearchObject1.put("hot_wishdate",wishdate);
			
			if(hotsearchArray1.size()>2){
				hotsearchArray1.remove(0);
			}
			
			hotsearchArray1.add(hotsearchObject1);
			
			hotsearchObject.put("hot", hotsearchArray1);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//5
		/** 위시리스트 새롭게 DB에 추가 */
		int count = hotel_info.memberUpdateWishlist(hotsearchObject.toJSONString(), id);
		
		String result = count > 0?"위시리스트 등록 성공":"위시리스트 등록 실패";
		mav.addObject("msg",result);
		mav.addObject("url",link+"?hot_num="+num);
		mav.setViewName("hotel/hotel_msg");
		return mav;
	}
}
