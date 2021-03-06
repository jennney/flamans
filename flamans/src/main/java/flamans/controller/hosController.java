package flamans.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.Bbook.model.*;
import java.sql.*;

@Controller
public class hosController {

	@Autowired
	private BbookDAO Bdao;
	
	/**예약페이지 */
	@RequestMapping(value="/bBook.do", method=RequestMethod.GET)
	public ModelAndView bBook(@RequestParam("hos_num")String hos_num, @RequestParam("doc_num")int doc_num,
			HttpSession session){
		
		ModelAndView mav= new ModelAndView();
		
		String userid=(String)session.getAttribute("userid");
		DoctorDTO Ddto=Bdao.doctorView(hos_num, doc_num, userid);
		System.out.println("hos_num"+hos_num+"doc_num="+doc_num+"userid"+userid+"Ddto="+Ddto);
		List<DoctorDTO> doc=Bdao.docAll(hos_num);
		System.out.println("hos_num"+hos_num+"doc="+doc);

		if(Ddto==null){
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("member/memberMsg");
			
		}else if(doc==null){
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("member/memberMsg");
			
		}else{
			
			mav.addObject("Ddto", Ddto);
			mav.addObject("doc", doc);
			/*mav.addObject("doc_num", doc_num);*/
			mav.setViewName("hos_book/Bbook");
		}
		
		return mav;
	}
	
	/**의사 선택 정보*/
	@RequestMapping(value="/docInfo.do", method=RequestMethod.GET)
	public ModelAndView docInfo(
			@RequestParam("doc_num")int doc_num, 
			@RequestParam("hos_num")String hos_num, 
			@RequestParam("what")String what){
	
		
		ModelAndView mav=new ModelAndView();
		
		DoctorDTO dto=Bdao.docInfo(hos_num, doc_num);
		
		mav.addObject("dto", dto);
		mav.addObject("what", what);
		mav.setViewName("hos_book/docInfo");
		return mav;
	}
	
	/**의사 선택 정보 수정*/
	@RequestMapping(value="/re_docInfo.do", method=RequestMethod.GET)
	public ModelAndView re_docInfo(
			@RequestParam("doc_num")int doc_num, 
			@RequestParam("hos_num")String hos_num, 
			@RequestParam("what")String what, 
			@RequestParam("bookingnum")String bookingnum){
	
		
		ModelAndView mav=new ModelAndView();
		
		DoctorDTO dto=Bdao.docInfo(hos_num, doc_num);
		
		mav.addObject("dto", dto);
		mav.addObject("what", what);
		mav.addObject("bookingnum", bookingnum);
		mav.setViewName("hos_book/docInfo");
		return mav;
	}
	
	
	/**유저계정-병원예약*/
	@RequestMapping(value="/bBook.do", method=RequestMethod.POST)
	public ModelAndView bBook(BbookDTO dto, @RequestParam(value="B_time", required=false)String B_time,
			HttpSession session){
		
		String temp= String.valueOf(dto.getBookingdate())+"/"+B_time;
		dto.setBookingdate(temp);
			
		String hos_Bid=(String)session.getAttribute("userid");
		dto.setHos_Bid(hos_Bid);
		
		ModelAndView mav= new ModelAndView();
		
		String ddate[]=dto.getBookingdate().split("/");
		
		if(ddate[0]==null||ddate[0].equals("")){
			mav.addObject("msg", "예약시간을 입력해주세요");
			mav.addObject("url", "bBook.do?hos_num="+dto.getHos_num()+"&doc_num="+dto.getDoc_num());
			mav.setViewName("member/memberMsg");
		}else if(B_time==null){
			mav.addObject("msg", "예약일자를 입력해주세요");
			mav.addObject("url", "bBook.do?hos_num="+dto.getHos_num()+"&doc_num="+dto.getDoc_num());
			mav.setViewName("member/memberMsg");		
		}else{
			int result=Bdao.bBook(dto);
			String msg=result>0?"병원이 예약되었습니다.":"병원 예약 실패하였습니다.";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("member/memberMsg");
			
		}
		return mav;
	}
	
	/**관리자계정-병원예약요청*/
	@RequestMapping(value="/bBbook_list.do", method=RequestMethod.GET)
	public ModelAndView bBbook_CList(HttpSession session){
		String cm_number=(String)session.getAttribute("cm_number");
		ModelAndView mav= new ModelAndView();
		if(cm_number==null||cm_number.equals("")){		
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;
			
		}else{
			mav.setViewName("hos_book/admin_confirm");
			return mav;
		}
	}
	
	/**관리자계정-병원예약리스트*/
	@RequestMapping(value="/bBbook_list.do", method=RequestMethod.POST)
	public ModelAndView bBbook_AList(HttpSession session, @RequestParam("bookingdate")String bookingdate){
		String cm_number=(String)session.getAttribute("cm_number");
		if(cm_number==null||cm_number.equals("")){		
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;		
		}else{
			List<BbookDTO> list = Bdao.bBbook_List(cm_number, bookingdate);
			ModelAndView mav=new ModelAndView("flamansJson", "list", list);
			return mav;
		}
	}
	
	/**관리자계정-병원예약 삭제*/
	@RequestMapping(value="/bBbook_refuse.do", method=RequestMethod.POST)
	public ModelAndView bBbook_refuse(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hos_number=(String)session.getAttribute("cm_number");
		if(hos_number==null||hos_number.equals("")){		
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;		
		}else{
			int result=Bdao.bBbook_refuse(hos_number, bookingnum);
			String msg=result>0?"예약이 삭제되었습니다.":"예약 삭제 실패했습니다.";
			ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
			return mav;
		}
	}
	
	/**관리자계정-예약수락*/
	@RequestMapping(value="/bBook_permit.do", method=RequestMethod.POST)
	public ModelAndView bBbook_permit(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hos_num=(String)session.getAttribute("cm_number");
		if(hos_num==null||hos_num.equals("")){		
			ModelAndView mav= new ModelAndView();
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;		
		}else{
			int result=Bdao.bBbook_permit(hos_num, bookingnum);
			String msg=result>0?"예약요청을 수락하셨습니다.":"예약요청을 수락하지 못하였습니다.";
			ModelAndView mav=new ModelAndView("flamansJson", "msg", msg);
		
			return mav;		
		}
				
	}	
	
	
	/**(공통)예약내용확인*/
	@RequestMapping("/bBook_content.do")
	public ModelAndView BbookContent(HttpSession session, @RequestParam("bookingnum")int bookingnum){
		
		String hos_number=(String)session.getAttribute("cm_number");
		String hos_Bid=(String)session.getAttribute("userid");
		
		ModelAndView mav=new ModelAndView();
		BbookDTO dto=Bdao.bBook_content(bookingnum);
		List<DoctorDTO> doc=Bdao.docAll(hos_number);
		
		if(hos_number!=null){
			if(hos_number.equals(dto.getHos_num())){
				mav.addObject("dto", dto);
				mav.addObject("doc", doc);
				mav.setViewName("hos_book/BbookContent");
			}
		}else if(hos_Bid!=null){
			if(hos_Bid.equals(dto.getHos_Bid())){
				mav.addObject("dto", dto);
				mav.addObject("doc", doc);
				mav.setViewName("hos_book/BbookContent");
			}
		}else{
			mav.addObject("msg", "잘못된 경로입니다.");
			mav.setViewName("hos_book/Bbook");
		}
		return mav;
	}
	
	/**관계자 - 예약내용수정 폼*/
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
	
	/**병원관계자 - 예약 수정*/
	@RequestMapping(value="/bBook_reWrite.do", method=RequestMethod.POST)
	public ModelAndView Bbook_reWrite(HttpSession session, BbookDTO dto, @RequestParam("B_time")String B_time){
		
		String hos_num=(String)session.getAttribute("cm_number");
		ModelAndView mav= new ModelAndView();
		if(hos_num==null||hos_num.equals("")){			
			mav.addObject("msg", "로그인 후 이용 가능합니다. ");
			mav.addObject("url",  "member_login.do");
			mav.setViewName("hotel_book/booking_msg");
			return mav;		
		}else{
		
			dto.setHos_num(hos_num);
			
			String temp= String.valueOf(dto.getBookingdate())+"/"+B_time;
			dto.setBookingdate(temp);

			int result=Bdao.bBook_reWrite(dto, hos_num);
			String msg=result>0?"예약 변경되었습니다.":"예약 변경 실패했습니다";
			mav.addObject("msg", msg);
			mav.setViewName("hos_book/hos_bookMsg");
			return mav;
		}
	}
	
	/**병원관계자 - 달력표시*/
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
}
