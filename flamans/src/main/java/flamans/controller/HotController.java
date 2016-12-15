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
	public ModelAndView bBbook_refuse(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hot_num=(String)session.getAttribute("cm_number");
		if(hot_num==null||hot_num.equals("")){
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			int result=Hot_bookDao.Hbook_refuse(hot_num, bookingnum);
			String msg=result>0?"예약이 삭제되었습니다.":"예약 삭제 실패했습니다.";
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
	
	/**관계자 - 예약내용수정 폼
	@RequestMapping("/BbookreWrite.do")
	public ModelAndView BbookreWrite(
			HttpSession session, 
			@RequestParam("bookingnum")int bookingnum,
			@RequestParam(value="doc_num", required=false, defaultValue="0")int doc_num){
	
		String hos_number=(String)session.getAttribute("cm_number");
		String hos_Bid=(String)session.getAttribute("userid");
				
		ModelAndView mav=new ModelAndView();
		BbookDTO dto=Bdao.bBook_content(bookingnum);
		List<DoctorDTO> doc=Bdao.docAll(hos_number);
	
		if(doc_num!=0){
			for(int i=0; i<doc.size(); i++){
				if(doc.get(i).getDoc_num()==doc_num){
					dto.setDoc_num(doc_num);
					dto.setDoc_name(doc.get(i).getDoc_name());
					dto.setDoc_img(doc.get(i).getDoc_img());
					dto.setDoc_career(doc.get(i).getDoc_career());
				}
			}
		}
	
		if(hos_number!=null){
			if(hos_number.equals(dto.getHos_num())){
				mav.addObject("dto", dto);
				mav.addObject("doc", doc);
				mav.setViewName("hos_book/reBbook");
			}
		}else if(hos_Bid!=null){
			if(hos_Bid.equals(dto.getHos_Bid())){
				mav.addObject("dto", dto);
				mav.addObject("doc", doc);
				mav.setViewName("hos_book/reBbook");
			}
		}else{
			mav.addObject("msg", "잘못된 경로입니다.");
			mav.setViewName("hos_book/Bbook");
		}
		return mav;
	}
	
	*//**병원관계자 - 예약 수정*//*
	@RequestMapping(value="/bBook_reWrite.do", method=RequestMethod.POST)
	public ModelAndView Bbook_reWrite(HttpSession session, BbookDTO dto, @RequestParam("B_time")String B_time){
		
		String hos_num=(String)session.getAttribute("cm_number");
		dto.setHos_num(hos_num);
		
		String temp= String.valueOf(dto.getBookingdate())+"/"+B_time;
		dto.setBookingdate(temp);
		
		ModelAndView mav= new ModelAndView();
		int result=Bdao.bBook_reWrite(dto, hos_num);
		String msg=result>0?"예약 변경되었습니다.":"예약 변경 실패했습니다";
		mav.addObject("msg", msg);
		mav.setViewName("hos_book/hos_bookMsg");
		return mav;
	}
	*/
	
}
