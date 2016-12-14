package flamans.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	@RequestMapping("/manager.do")
	public ModelAndView managerPage(HttpSession session){
		String cm_number_s = (String)session.getAttribute("cm_number");
		String cm_id = (String)session.getAttribute("savecoId");
		String cm_number = cm_number_s.substring(0,1);
		session.setAttribute("cm_kind", cm_number);
		System.out.println(session.getAttribute("savecoId"));
		ModelAndView mav=new ModelAndView();
		if(cm_id.equals("admin")){  
			mav.setViewName("manager/site/siteManager");
		}else if(cm_number.equals("B")){
			mav.setViewName("manager/hospital/hospitalManager");
		}else if(cm_number.equals("H")){
			mav.setViewName("manager/hotel/hotelManager");
		}else{
			mav.addObject("msg", "관리자로그인이 필요한 메뉴입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("manager/Msg");
		}
		return mav;
	}
}
