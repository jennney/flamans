package flamans.controller;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import flamans.hot.book.model.Hot_bookDAO;
import flamans.hot.book.model.Hot_bookDTO;
import flamans.hotel_find.model.HotelRoomDTO;

import flamans.member.model.MemberDTO;

@Controller
public class HotController {

	@Autowired
	private Hot_bookDAO Hot_bookDao;

	@RequestMapping(value="/booking_hot.do",method=RequestMethod.GET)
	public ModelAndView booking_hotForm(HttpSession session,@RequestParam("hot_num")String hot_num) {
		ModelAndView mav = new ModelAndView();
		String m_id = (String)session.getAttribute("userid");
		if(m_id==null||m_id.equals("")){
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("url", "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
		}else{
			MemberDTO mdto = Hot_bookDao.booking_info(m_id);
			List<HotelRoomDTO> hotelroom = Hot_bookDao.hotelroom(hot_num);
			mav.addObject("mdto",mdto);
			mav.addObject("hot_num",hot_num);
			mav.addObject("hotelroom",hotelroom);
			mav.setViewName("hotel_book/booking_hot");
		}
		
		return mav;

	}
	@RequestMapping(value="/booking_hot.do",method=RequestMethod.POST)
	public ModelAndView booking_hot(Hot_bookDTO bdto){
		ModelAndView mav = new ModelAndView();
	
		int result = Hot_bookDao.booking_hot1(bdto);
		String msg = result>0?"예약되었습니다.":"예약 실패되었습니다.";
		mav.addObject("msg",msg);
		mav.addObject("url","hotel_list.do");
		mav.setViewName("hotel_book/booking_msg");
		return mav;
	}

}
