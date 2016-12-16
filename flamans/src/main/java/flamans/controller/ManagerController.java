package flamans.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import flamans.company.model.CompanyDAO;
import flamans.company.model.CompanyDTO;

@Controller
public class ManagerController {
	
	@Autowired
	private CompanyDAO cDao;

	@RequestMapping("/manager.do")
	public ModelAndView managerPage(HttpSession session){
		String cm_number_s = (String)session.getAttribute("cm_number");
		String cm_id = (String)session.getAttribute("savecoId");
		String cm_number = cm_number_s.substring(0,1);
		session.setAttribute("cm_kind", cm_number);
		System.out.println(session.getAttribute("savecoId"));
		CompanyDTO dto=cDao.companyInfo(cm_id);
		ModelAndView mav=new ModelAndView();
		if(cm_id==null){
			mav.addObject("msg", "로그인이 필요한 메뉴입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("manager/Msg");
		}else if(cm_id.equals("admin")){  
			mav.setViewName("manager/site/memberList");
		}else if(cm_number.equals("B")){
			if(dto.getCm_permit().equals("0")){
				mav.addObject("msg", "승인이 필요합니다.");
				mav.addObject("url","index.do");
				mav.setViewName("manager/Msg");
			}else{
				mav.setViewName("manager/hospital/hospitalBbsList");
			}
		}else if(cm_number.equals("H")){
			if(dto.getCm_permit().equals("0")){
				mav.addObject("msg", "승인이 필요합니다.");
				mav.addObject("url","index.do");
				mav.setViewName("manager/Msg");
			}else{
				mav.setViewName("manager/hotel/hotelBbsList");
			}
		}else{
			mav.addObject("msg", "관리자로그인이 필요한 메뉴입니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("manager/Msg");
		}
		return mav;
	}
}
