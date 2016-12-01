package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.hotel_find.model.HotelDTO;
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
		List<HotelDTO> list=siteDao.premittedHotel();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/site/hotelInfo");
		return mav;
	}
}
