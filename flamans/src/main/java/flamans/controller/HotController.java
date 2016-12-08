package flamans.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import flamans.hot.book.model.Hot_bookDAO;
import flamans.hot.book.model.Hot_bookDTO;

@Controller
public class HotController {

	@Autowired
	private Hot_bookDAO Hot_bookDao;

	@RequestMapping(value="/booking_hot.do",method=RequestMethod.GET)
	public ModelAndView booking_hotForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel_book/booking_hot");
		return mav;

	}
	@RequestMapping(value="/booking_hot.do",method=RequestMethod.POST)
	public ModelAndView booking_hot(@ModelAttribute("dto") Hot_bookDTO command){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel_book/booking_hot_info");
		return mav;
	}
	
	@RequestMapping("/booking_hot_info.do")
	public ModelAndView booking_hot_infoForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel_book/booking_hot_info");
		return mav;
	}
}
