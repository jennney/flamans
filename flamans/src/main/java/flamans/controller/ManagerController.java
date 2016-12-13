package flamans.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	@RequestMapping("/manager.do")
	public ModelAndView managerPage(HttpSession session){
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("savecoId")!=null && session.getAttribute("savecoId").equals("admin")){
			mav.setViewName("manager/site/siteManager");
		}else{
			mav.addObject("msg", "관리자로그인이 필요한 메뉴입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("manager/Msg");
		}
		return mav;
	}
}
