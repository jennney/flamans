package flamans.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.company.model.CompanyDAO;
import flamans.company.model.CompanyDTO;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyDAO companyDao;

	@RequestMapping(value="/company_join.do",method=RequestMethod.GET)
	public ModelAndView company_joinForm(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("company/company_join");
		return mav;
	}
	@RequestMapping(value="/company_join.do",method=RequestMethod.POST)
	public ModelAndView company_join(CompanyDTO dto,
			@RequestParam("kind")String kind,
			@RequestParam("number1")String number1,@RequestParam("number2")String number2,@RequestParam("number3")String number3,
			@RequestParam("email1")String email1,
										@RequestParam("email2")String email2){
		String kind1="";
		if(kind.equals("병원")){
			kind1 = "A";
		}else if(kind.equals("호텔"))
		{
			kind1 = "B";
		}
		String number = kind1+number1+number2+number3;
		String email = email1+"@"+email2;
		dto.setCm_number(number);
		dto.setCm_email(email);
		int result = companyDao.company_join(dto);
		String msg = result>0?"회원가입 성공":"회원가입 실패";
		String url="company_join.do";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","company_join.do");
		mav.setViewName("company/company_msg");
		return mav;
		
	}
	
	@RequestMapping("/company_id_check.do")
	public ModelAndView companyIdCheck(@RequestParam(value="cm_id",required=false)String cm_id){
		String id = companyDao.company_id_check(cm_id);
		ModelAndView mav = new ModelAndView();
		System.out.println(cm_id);
		String msg = id!=null?"중복된 아이디입니다.":"사용가능한 아이디 입니다.";
		mav.addObject("msg", msg);
		mav.setViewName("company/idCheckOk");
		return mav;
		
	}
}
