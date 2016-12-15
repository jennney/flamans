package flamans.controller;


import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.Bbook.model.BbookDTO;
import flamans.Bbook.model.DoctorDTO;
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
	public ModelAndView booking_hot(Hot_bookDTO bdto,@RequestParam("cardco")String cardco,@RequestParam("cardnum")String cardnum){
		ModelAndView mav = new ModelAndView();
		String card = cardco+" "+cardnum;
		bdto.setCard(card);
		int result = Hot_bookDao.booking_hot1(bdto);
		int roomcount = Hot_bookDao.fm_hotroomnum(bdto.getRoom_idx(),bdto.getRoomselect());
		String msg = result>0?"예약되었습니다.":"예약 실패되었습니다.";
		mav.addObject("msg",msg);
		mav.addObject("url","hotel_list.do");
		mav.setViewName("hotel_book/booking_msg");
		return mav;
	}
	
	/**관리자계정-호텔예약 관리 페이지*/
	@RequestMapping(value="/Hbook_list.do", method=RequestMethod.GET)
	public ModelAndView bBbook_CList(HttpSession session){
		String hot_num=(String)session.getAttribute("cm_number");
		ModelAndView mav= new ModelAndView();
		if(hot_num==null||hot_num.equals("")){
			
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");			
		}else{
			mav.setViewName("hotel_book/hot_admin");
		}
		return mav;
	}
	
	
	/**관리자계정-호텔예약리스트*/
	@RequestMapping(value="/Hbook_list.do", method=RequestMethod.POST)
	public ModelAndView HBbook_AList(HttpSession session, @RequestParam("checkin")String checkin){
		String hot_num=(String)session.getAttribute("cm_number");
		if(hot_num==null||hot_num.equals("")){
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			List<HotelRoomDTO> Hlist = Hot_bookDao.Hbook_List(hot_num, checkin);
			ModelAndView mav=new ModelAndView("flamansJson", "Hlist", Hlist);
			return mav;
		}
		
	}
	
	/**관리자계정-호텔예약 삭제*/
	@RequestMapping(value="/HBbook_refuse.do", method=RequestMethod.POST)
	public ModelAndView bBbook_refuse(HttpSession session, @RequestParam("bookingnum")int bookingnum,
			@RequestParam("room_idx")int room_idx){
		
		String hot_num=(String)session.getAttribute("cm_number");
		if(hot_num==null||hot_num.equals("")){
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			int result=Hot_bookDao.Hbook_refuse(hot_num, bookingnum);
			int count=Hot_bookDao.checkout(room_idx);
			String msg=result>0?"예약이 삭제되었습니다.":"예약 삭제 실패했습니다.";
			ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
			return mav;
		}
	}
	
	/**관리자계정-호텔 체크아웃*/
	@RequestMapping(value="/hCheckout.do", method=RequestMethod.POST)
	public ModelAndView hCheckout(HttpSession session, @RequestParam("room_idx")int room_idx){
		String hot_num=(String)session.getAttribute("cm_number");	
		if(hot_num==null||hot_num.equals("")){	
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			int count=Hot_bookDao.checkout(room_idx);
			String msg=count>0?"체크아웃 되었습니다.":"체크아웃 실패하였습니다.";
			ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
			return mav;
		}
	}
	
	/**관리자계정-호텔예약수락*/
	@RequestMapping(value="/HBook_permit.do", method=RequestMethod.POST)
	public ModelAndView bBbook_permit(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hot_num=(String)session.getAttribute("cm_number");
		if(hot_num==null||hot_num.equals("")){
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			int result=Hot_bookDao.Hbook_permit(hot_num, bookingnum);
			String msg=result>0?"예약요청을 수락하셨습니다.":"예약요청을 수락하지 못하였습니다.";
			ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
			
			return mav;		
		}		
	}	
	
	/**(공통) - 예약 내용 확인*/
	@RequestMapping("/Hbookcontent.do")
	public ModelAndView BbookreWrite(HttpSession session, @RequestParam("bookingnum")int bookingnum){
	
		String hot_num=(String)session.getAttribute("cm_number");
		String name=(String)session.getAttribute("userid");
				
		ModelAndView mav=new ModelAndView();
		Hot_bookDTO Hdto=Hot_bookDao.HBook_content(bookingnum);
	
		if(hot_num!=null){
			if(hot_num.equals(Hdto.getHot_num())){
				mav.addObject("Hdto", Hdto);
				mav.setViewName("hotel_book/hotBook_content");
			}
		}else if(name!=null){
			if(name.equals(Hdto.getName())){
				mav.addObject("Hdto", Hdto);
				mav.setViewName("hotel_book/hotBook_content");
			}
		}else{
			mav.addObject("msg", "잘못된 경로입니다.");
			mav.setViewName("member_login.do");
		}
		return mav;
	}
	
	/**호텔관계자 - 예약 수정 폼*/
	@RequestMapping(value="/HBook_reWrite.do", method=RequestMethod.GET)
	public ModelAndView Bbook_reWrite(HttpSession session, BbookDTO dto, 
			@RequestParam("bookingnum")int bookingnum){
	/*	@RequestParam("name")String name,*/
		String hot_num=(String)session.getAttribute("cm_number");
		ModelAndView mav= new ModelAndView();
		if(hot_num==null||hot_num.equals("")){		
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			Hot_bookDTO Hdto=Hot_bookDao.HBook_content(bookingnum);
			String name=Hdto.getName();
			MemberDTO mdto = Hot_bookDao.booking_info(name);
			List<HotelRoomDTO> hotelroom = Hot_bookDao.hotelroom(hot_num);
			mav.addObject("mdto",mdto);
			mav.addObject("hot_num",hot_num);
			mav.addObject("hotelroom",hotelroom);
			mav.addObject("Hdto", Hdto);
			mav.setViewName("hotel_book/hot_reWrite");
			
		}
		return mav;
	}
	
	/**호텔관계자 - 예약 수정*/
	@RequestMapping(value="/HBook_reWrite.do", method=RequestMethod.POST)
	public ModelAndView Bbook_reWrite(Hot_bookDTO bdto,@RequestParam("cardco")String cardco,
			@RequestParam("cardnum")String cardnum, HttpSession session){
		
		String hot_num=(String)session.getAttribute("cm_number");
		ModelAndView mav= new ModelAndView();
		if(hot_num==null||hot_num.equals("")){		
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");			
		}else{
			String card = cardco+" "+cardnum;
			bdto.setCard(card);
			int result = Hot_bookDao.HreWrite(bdto);
			String msg=result>0?"예약 변경되었습니다.":"예약 변경 실패했습니다";
			mav.addObject("msg", msg);
			mav.setViewName("hos_book/hos_bookMsg");
		}
			return mav;
		
	}
	
	
	
}
