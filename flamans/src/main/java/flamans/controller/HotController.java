package flamans.controller;


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
	public ModelAndView booking_hot(Hot_bookDTO bdto){
		ModelAndView mav = new ModelAndView();
	
		int result = Hot_bookDao.booking_hot1(bdto);
		String msg = result>0?"예약되었습니다.":"예약 실패되었습니다.";
		mav.addObject("msg",msg);
		mav.addObject("url","hotel_list.do");
		mav.setViewName("hotel_book/booking_msg");
		return mav;
	}
	
/*	*//**관리자계정-병원예약요청*//*
	@RequestMapping(value="/bBbook_list.do", method=RequestMethod.GET)
	public String bBbook_CList(){
		return "hos_book/admin_confirm";
	}
	
	
	*//**관리자계정-병원예약리스트*//*
	@RequestMapping(value="/bBbook_list.do", method=RequestMethod.POST)
	public ModelAndView bBbook_AList(HttpSession session, @RequestParam("bookingdate")String bookingdate){
		String cm_number=(String)session.getAttribute("cm_number");
		List<BbookDTO> list = Bdao.bBbook_List(cm_number, bookingdate);
		ModelAndView mav=new ModelAndView("flamansJson", "list", list);
		return mav;
	}
	
	*//**관리자계정-병원예약 삭제*//*
	@RequestMapping(value="/bBbook_refuse.do", method=RequestMethod.POST)
	public ModelAndView bBbook_refuse(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hos_number=(String)session.getAttribute("cm_number");

		int result=Bdao.bBbook_refuse(hos_number, bookingnum);
		String msg=result>0?"예약이 삭제되었습니다.":"예약 삭제 실패했습니다.";
		ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
		return mav;
	}
	
	*//**관리자계정-예약수락*//*
	@RequestMapping(value="/bBook_permit.do", method=RequestMethod.POST)
	public ModelAndView bBbook_permit(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hos_num=(String)session.getAttribute("cm_number");
		int result=Bdao.bBbook_permit(hos_num, bookingnum);
		String msg=result>0?"예약요청을 수락하셨습니다.":"예약요청을 수락하지 못하였습니다.";
		ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
		
		return mav;		
				
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
	
	*//**병원관계자 - 달력표시*//*
	@RequestMapping(value="/companyCal.do", method=RequestMethod.POST)
	public ModelAndView calendar(HttpSession session, @RequestParam("date")String date,
			@RequestParam(value="hos_num", required=false)String hos_num){
		
		if(hos_num==null){
			hos_num=(String)session.getAttribute("cm_number");
		}		
		List<BbookDTO> cal=Bdao.calendar(hos_num, date);
		ModelAndView mav=new ModelAndView("flamansJson", "cal", cal);
		return mav;
		
	}
	*/
	

}
