package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
}
