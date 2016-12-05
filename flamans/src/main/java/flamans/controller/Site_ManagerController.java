package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.company.model.CompanyDTO;
import flamans.manager.model.Site_ManagerDAO;
import flamans.member.model.MemberDTO;

@Controller
public class Site_ManagerController {
	
	@Autowired
	private Site_ManagerDAO siteDao;

	@RequestMapping("/memberList.do")
	public ModelAndView memberList(@RequestParam(value = "cp", defaultValue = "1") int cp){
		int totalMemberCnt=siteDao.totalMemberCnt();
		int pageSize=5;
		int ls=10;
		String memberPage=flamans.paging.PageModule.makePage("memberList.do", totalMemberCnt, ls, pageSize, cp);
		List<MemberDTO> list=siteDao.memberList(cp, ls);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("memberPage", memberPage);
		mav.setViewName("manager/site/memberList");
		return mav;
	}
	
	@RequestMapping("/memberKick.do")
	public ModelAndView memberKick(@RequestParam("m_id") String m_id){
		int result=siteDao.memberKick(m_id);
		String msg=result>0?"잘가 안녕 ":"추방에 실패 했습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "memberList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelInfo.do")
	public ModelAndView hotelInfo(){
		List<CompanyDTO> list=siteDao.permittedComany();
		List<CompanyDTO> unlist=siteDao.unpermitComany();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("unlist", unlist);
		mav.setViewName("manager/site/hotelInfo");
		return mav;
	}
					
	@RequestMapping("/permittedHotel.do")
	public ModelAndView permittedHotel(){
		List<CompanyDTO> list=siteDao.permittedComany();
		ModelAndView mav=new ModelAndView("flamansJson", "list", list);
		return mav;
	}
	
	@RequestMapping("/unpermitHotel.do")
	public ModelAndView unpermitHotel(){
		List<CompanyDTO> list=siteDao.unpermitComany();
		ModelAndView mav=new ModelAndView("flamansJson", "list", list);
		return mav;
	}
	
	@RequestMapping("/permitOk.do")
	public ModelAndView permitOk(@RequestParam("cm_number") String cm_number){
		int result=siteDao.permit(cm_number);
		String msg=result>0?"승인 성공 ! ":"알수없는 이유로 인해 승인이 되지 않았습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelInfo.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelOut.do")
	public ModelAndView hotelOut(@RequestParam("cm_number") String cm_number){
		int result=siteDao.comanyOut(cm_number);
		String msg=result>0?"해당 호텔과의 제휴가 종료 되었습니다.":"알수없는 이유로 인해 제휴 종료가 되지 않았습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelInfo.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hospitalInfo.do")
	public ModelAndView hospitalInfo(){
		List<CompanyDTO> list=siteDao.permittedComany();
		List<CompanyDTO> unlist=siteDao.unpermitComany();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("unlist", unlist);
		mav.setViewName("manager/site/hospitalInfo");
		return mav;
	}
	
	@RequestMapping("/hospitalOut.do")
	public ModelAndView hospitalOut(@RequestParam("cm_number") String cm_number){
		int result=siteDao.comanyOut(cm_number);
		String msg=result>0?"해당 병원과의 제휴가 종료 되었습니다.":"알수없는 이유로 인해 제휴 종료가 되지 않았습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalInfo.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
}
