package flamans.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.hot_comment_grade.model.HotCommentGradeDAO;
import flamans.hot_comment_grade.model.HotCommentGradeDTO;
import flamans.hotel_find.model.HotelDAO;
import flamans.hotel_find.model.HotelDTO;

@Controller
public class HotFindController{
	
	@Autowired
	private HotelDAO hotel_info;
	
	@Autowired
	private HotCommentGradeDAO hotel_comment;
	
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
		mav.setViewName("hotel/hotel_comment_Msg");
		return mav;
	}
}
