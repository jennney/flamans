package flamans.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDAO;
import flamans.hos_find.model.HospitalDTO;
import flamans.hos_find.model.HospitalPageModule;
import flamans.hot_comment_grade.model.HotCommentGradeDAO;
import flamans.hot_comment_grade.model.HotCommentGradeDTO;
import flamans.hotel_find.model.HotelDAO;
import flamans.hotel_find.model.HotelDTO;
import flamans.member.model.MemberDAO;
import flamans.member.model.MemberDTO;

import flamans.paging.PageModule;
import flamans.user.event.model.EventDAO;
import flamans.user.event.model.EventDTO;

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
	private HotelDAO hotel_info;
	
	@Autowired
	private HotCommentGradeDAO hospital_comment;
	
	@Autowired
	private PageModule paging;
	
	@Autowired
	private HospitalPageModule hospital_pageing;
	
	@Autowired
	private MemberDAO memberdao;
	
	@RequestMapping("/hospital_list.do")
	public ModelAndView hospital_list(){
		
		ModelAndView mav = new ModelAndView();
		
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/hospital_sub_search.do")
	public ModelAndView hospital_sub_search(
			@RequestParam(value="option1",defaultValue="")String option1,@RequestParam(value="option2",defaultValue="")String option2,@RequestParam(value="option3",defaultValue="")String option3,@RequestParam(value="option4",defaultValue="")String option4,@RequestParam(value="option5",defaultValue="")String option5,
			@RequestParam(value="findname", defaultValue="")String findname,
			
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session
			)throws ParseException{
		
		/** 선언부분 */
		//파서 JSON 해독
		JSONParser parser = new JSONParser();
		
		//위시리스트 객체 { [위시리스트 목록] }
		JSONObject hossearchObject1 = new JSONObject();
		JSONObject hossearchObject2 = new JSONObject();
		
		JSONArray hossearchArray1 = new JSONArray();

		ModelAndView mav= new ModelAndView();
		
		String id = (String)session.getAttribute("userid");
		
		if(!(id==null || id.equals("")) && (findname!=null && !findname.equals(""))){
			
			String hospital_name_find = findname.toLowerCase();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("find", hospital_name_find);
			
			List<HospitalDTO> findList = hospital_info.hospital_search_name(map);
			
			if(!findList.isEmpty()){
			
			MemberDTO memberdto = memberdao.memberLogin(id);
			String user_history = memberdto.getM_history();
			
			if(!(user_history == null || user_history.equals(""))){
				hossearchObject1 = (JSONObject)parser.parse(user_history);
				hossearchArray1 = (JSONArray)hossearchObject1.get("hos");
			}
			
			if(hossearchArray1==null){
				hossearchArray1 = new JSONArray();
			}
			
			String hos_img = findList.get(0).getHos_img();
			String write_date = hotel_info.get_date();
			
			hossearchObject2.put("write_date", write_date);
			hossearchObject2.put("find_name", findname);
			hossearchObject2.put("hos_img", hos_img);
			
			if(hossearchArray1.size()>8){
				hossearchArray1.remove(1);
			}

			hossearchArray1.add(hossearchObject2);
			
			hossearchObject1.put("hos", hossearchArray1);
			
			hospital_info.add_memberFind(hossearchObject1.toString(), id);
			}
		}
		
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////멤버에 넣음
///////////////////////////////////////////////////////////
		
		String hospital_name_find = findname.toLowerCase();
		
		String option[] = {option1,option2,option3,option4,option5};
		StringBuffer sb= new StringBuffer();
		
		//플래그 변수들. where_con & z
		
		//where 조건이 한번만 들어가기위해 작성
		int where_con=0;
		
		//첫번째 조건이 들어갈때 조건문을 걸어줘야함
		int z=0;
		
		//한개의조건문을 탈출했을경우 and 값을 넣어줘야하는 플래그변수
		int and_flag =0;
		
		//두번째조건이 들어갈때
		z=0;
		
		for(int i=0; i<option.length; i++){
			if(!option[i].equals("") && z==0){
				
				if(and_flag==1){
					sb.append(" and ");
				}
				
				sb.append(" hos_num in (select hos_num from fm_hospital where hos_special in ('"+option[i]+"'");
				z=1;
				
			}else if(!option[i].equals("") && z==1){
				sb.append(", '"+option[i]+"'");
			}
		}
		if(z==1){
			sb.append("))");
			and_flag=1;
		}
		System.out.println("hospital_name_find="+hospital_name_find);
		System.out.println("sb.toString()="+sb.toString());
		int totalCnt = hospital_info.getSubTotalCnt(sb.toString(), hospital_name_find);
		int listSize = 5;
		int pageSize = 5;

		List<HospitalDTO> list = hospital_info.hospital_sub_search(sb.toString(), hospital_name_find, cp, listSize);
		
		String pageStr1 = hospital_pageing.makePage("hospital_sub_search", totalCnt, listSize, pageSize, cp, option, hospital_name_find);
		ModelAndView mav1 = new ModelAndView("flamansJson","list",list);
		mav1.addObject("pageStr1", pageStr1);
		return mav1;
	}
	
//	@RequestMapping("/hospital_search_name.do")
//	public ModelAndView hospital_search_name(
//		@RequestParam("find_name")String find_name,
//		HttpSession session
//		) throws ParseException{
//	
//		/** 선언부분 */
//		//파서 JSON 해독
//		JSONParser parser = new JSONParser();
//		
//		//위시리스트 객체 { [위시리스트 목록] }
//		JSONObject hossearchObject1 = new JSONObject();
//		JSONObject hossearchObject2 = new JSONObject();
//		JSONObject hossearchObject3 = new JSONObject();
//		
//		JSONArray hossearchArray1 = new JSONArray();
//
//		ModelAndView mav= new ModelAndView();
//		
//		String id = (String)session.getAttribute("userid");
//		
//		if(!(id==null || id.equals(""))){
//			
//			String hospital_name_find = find_name.toLowerCase();
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			map.put("find", hospital_name_find);
//			
//			List<HospitalDTO> findList = hospital_info.hospital_search_name(map);
//			
//			if(findList.isEmpty()){
//				mav.addObject("hospital_info", findList);
//				mav.setViewName("hospital/hospital_list");
//				return mav;
//			}
//			
//			MemberDTO memberdto = memberdao.memberLogin(id);
//			String user_history = memberdto.getM_history();
//			
//			if(!(user_history == null || user_history.equals(""))){
//				hossearchObject1 = (JSONObject)parser.parse(user_history);
//				hossearchArray1 = (JSONArray)hossearchObject1.get("hos");
//			}
//			
//			if(hossearchArray1==null){
//				hossearchArray1 = new JSONArray();
//			}
//			
//			String hos_img = findList.get(0).getHos_img();
//			String write_date = hotel_info.get_date();
//			
//			hossearchObject2.put("write_date", write_date);
//			hossearchObject2.put("find_name", find_name);
//			hossearchObject2.put("hos_img", hos_img);
//			
//			
//			if(hossearchArray1.size()>8){
//				hossearchArray1.remove(1);
//			}
//
//			hossearchArray1.add(hossearchObject2);
//			
//			System.out.println("리스트 사이즈? ="+hossearchArray1.size());
//			hossearchObject1.put("hos", hossearchArray1);
//			System.out.println(hossearchObject1.toJSONString());
//			
//			hospital_info.add_memberFind(hossearchObject1.toString(), id);
//			
//			mav.addObject("hospital_info", findList);
//			mav.setViewName("hospital/hospital_list");
//			return mav;
//			
//		}
//		String hospital_name_find = find_name.toLowerCase();
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("find", hospital_name_find);
//		  
//		List<HospitalDTO> findList = hospital_info.hospital_search_name(map);
//		  
//		mav.addObject("hospital_info", findList);
//		mav.setViewName("hospital/hospital_list");
//		return mav;
//	}
	
	@RequestMapping("/bBook1.do")
	public ModelAndView bBook(DoctorDTO doctordto, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("userid");
		if(id==null || id.equals("")){
			mav.addObject("msg","로그인이 필요합니다!");
			mav.addObject("url","hospital_get_info.do?hos_num="+doctordto.getHos_num());
			mav.setViewName("hospital/hospital_msg");
			return mav;
		}
		
		List<DoctorDTO> list = hospital_info.hospital_docinfo(doctordto.getDoc_num());
		
		mav.addObject("doctor_info",list);
		mav.setViewName("hospital/Bbook");
		return mav;
	}

	@RequestMapping("/hospital_input_comment_grade.do")
	public ModelAndView hospital_input_comment_grade(
			@RequestParam(value="c_number",defaultValue="")String c_number,
			@RequestParam(value="c_grade",defaultValue="")String c_grade,
			@RequestParam(value="c_comment",defaultValue="")String c_comment,
			HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		if(c_comment.equals("") || c_grade.equals("")){
			mav.addObject("msg","내용 또는 평점을 입력해주세요!");
			mav.addObject("url","hospital_get_info.do?hos_num="+c_number);
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
			mav.addObject("url","hospital_get_info.do?hos_num="+c_number);
			mav.setViewName("hotel/hotel_msg");
			return mav;
		}
		
		int count = hospital_comment.hotel_input_comment_grade(commentDTO);
		
		String result = count > 0? "후기 등록 성공!" : "후기 등록 실패!";
		mav.addObject("msg",result);
		mav.addObject("url","hospital_get_info.do?hos_num="+c_number);
		mav.setViewName("hospital/hospital_msg");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/hos_wishlist.do")
	public ModelAndView add_wishlist(
			@RequestParam("hos_num")String num,
			@RequestParam("hospital_link")String link,
			MemberDTO member, 
			HttpSession session){
	
		/** 선언부분 */
		//파서 JSON 해독
		JSONParser parser = new JSONParser();
		
		//위시리스트 객체 { [위시리스트 목록] }
		JSONObject hossearchObject = new JSONObject();
		JSONObject hossearchObject1 = new JSONObject();
		
		JSONArray hossearchArray1 = new JSONArray();
		
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
			mav.addObject("url",link+"?hos_num="+num);
			mav.setViewName("hospital/hospital_msg");
			return mav;
		}
		
		// 유저의 위시리스트 가져오기
		MemberDTO memberdto = memberdao.memberLogin(id);
		String user_wishlist = memberdto.getM_wishlist();
		
		List<HospitalDTO> list = hospital_info.hospital_get_info(num);
		
		//1	
		try {
			
			if(!(user_wishlist == null || user_wishlist.equals("") || user_wishlist.equals("{\"hot\":[]}"))){
				//2 hot와 hos를 분리하기위해서 parser를통해 Object로 변환한다.
				hossearchObject = (JSONObject)parser.parse(user_wishlist);
				//hot가 아닌 hos만을 분리하겠다.
				hossearchArray1 = (JSONArray)hossearchObject.get("hos");
			}
			
			//위시리스트 널값 오류 처리
			if(hossearchArray1 == null || hossearchArray1.equals("")){
				hossearchArray1 = new JSONArray();
			}
			
			// 중복 플래그 변수 z
			int z = 1;
			for(int i = 0; i<hossearchArray1.size(); i++){
				
				// 문자를 쪼개어 번호비교에 임시방편으로 사용 ( hot_num을 비교할수 있는 다른방법을 생각해보자. )
				String[] Array = hossearchArray1.get(i).toString().split("\"");
				
				for(int j=0; j<Array.length; j++){
					if(num.equals(Array[j])){
						hossearchArray1.remove(i);
						z=2;
					}
				}
			}
			
			// 중복검사가되어 삭제되었을때.
			if(z==2){
				hossearchObject.put("hos", hossearchArray1);
				int count = hotel_info.memberUpdateWishlist(hossearchObject.toJSONString(), id);
				
				String result = count>0? "위시리스트 삭제 성공":"위시리스트 삭제 실패";
				
				mav.addObject("msg",result);
				mav.addObject("url",link+"?hos_num="+num);
				mav.setViewName("hospital/hospital_msg");
				return mav;
			}
			
			String wishdate=hotel_info.get_date();
			
			hossearchObject1.put("hos_num",list.get(0).getHos_num());
			hossearchObject1.put("hos_name",list.get(0).getHos_name());
			hossearchObject1.put("hos_addr",list.get(0).getHos_addr());
			hossearchObject1.put("hos_img",list.get(0).getHos_img());
			hossearchObject1.put("hos_content",list.get(0).getHos_content());
			hossearchObject1.put("hos_map_info",list.get(0).getHos_mapinfo());
			hossearchObject1.put("hos_wishdate",wishdate);
			
			if(hossearchArray1.size()>2){
				hossearchArray1.remove(0);
			}
			
			hossearchArray1.add(hossearchObject1);
			
			hossearchObject.put("hos", hossearchArray1);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//5
		/** 위시리스트 새롭게 DB에 추가 */
		int count = hotel_info.memberUpdateWishlist(hossearchObject.toJSONString(), id);
		
		String result = count > 0?"위시리스트 등록 성공":"위시리스트 등록 실패";
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
	
