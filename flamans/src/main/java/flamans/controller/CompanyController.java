package flamans.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		mav.addObject("url",url);
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
	
///////////////////////////////////////////////////////////////////////////////////////////////
	/**로그인 폼*/
	@RequestMapping(value="/company_login.do", method=RequestMethod.GET)
	public String companyLogin(){
		return "company/company_login";
	}


	/**병원관계자 로그인*/
	@RequestMapping(value="/company_Blogin.do", method=RequestMethod.POST)
	public ModelAndView CompanyBloginCheck(@RequestParam("B_id")String userBid, @RequestParam("B_pwd")String userBpwd,
	HttpSession session, @RequestParam(value="saveBid", required=false)String saveBid,
	@RequestParam("b_number1")String b_number1, @RequestParam("b_number2")String b_number2, 
	@RequestParam("b_number3")String b_number3, HttpServletResponse resp, HttpServletRequest req
	){
	
		ModelAndView mav= new ModelAndView();
		
		String cm_number="B"+b_number1+"-"+b_number2+"-"+b_number3;
		if(session.getAttribute("userid") != null || session.getAttribute("userHid") != null ){
			mav.addObject("msg", "로그아웃 후 이용해주세요.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
		}else if(session.getAttribute("userid") == null && session.getAttribute("userHid") == null){
			CompanyDTO dto=companyDao.companyLogin(userBid);
			
			if(dto==null){		
			mav.addObject("msg", "등록된 ID가 아닙니다.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
			
			}else if(userBid.equals(dto.getCm_id())){
				if(!userBpwd.equals(dto.getCm_pwd())){		
					mav.addObject("msg", "잘못된 비밀번호입니다. ");
					mav.addObject("url", "company_login.do");
					mav.setViewName("company/company_msg");
				}else if(!cm_number.equals(dto.getCm_number())){
					mav.addObject("msg", "사업자 번호를 확인해주세요. ");
					mav.addObject("url", "company_login.do");
					mav.setViewName("company/company_msg");
				}else{
					Cookie ck= new Cookie("saveBid", userBid);
					ck.setMaxAge(saveBid==null?0:(60*60*24*30));
					resp.addCookie(ck);
					
					String cm_name=dto.getCm_name();
					session.setAttribute("cm_name", cm_name);
					session.setAttribute("userBid", userBid);
					mav.setViewName("redirect:/index.do");
				}
			}
		}

	return mav;
	}

	/**호텔관계자 로그인*/
	@RequestMapping(value="/company_Hlogin.do", method=RequestMethod.POST)
	public ModelAndView CompanyHloginCheck(@RequestParam("H_id")String userHid, @RequestParam("H_pwd")String userHpwd,
	HttpSession session, @RequestParam(value="saveHid", required=false)String saveHid,
	@RequestParam("h_number1")String h_number1, @RequestParam("h_number2")String h_number2, 
	@RequestParam("h_number3")String h_number3, HttpServletResponse resp
	){
			
		ModelAndView mav= new ModelAndView();
		
		String cm_number="H"+h_number1+"-"+h_number2+"-"+h_number3;
		
		if(session.getAttribute("userid") != null || session.getAttribute("userBid") != null ){
			mav.addObject("msg", "로그아웃 후 이용해주세요.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
		}else if(session.getAttribute("userid") == null && session.getAttribute("userBid") == null){
			CompanyDTO dto=companyDao.companyLogin(userHid);
			
			if(dto==null){		
			mav.addObject("msg", "등록된 ID가 아닙니다.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
			
			}else if(userHid.equals(dto.getCm_id())){
				if(!userHpwd.equals(dto.getCm_pwd())){		
					mav.addObject("msg", "잘못된 비밀번호입니다. ");
					mav.addObject("url", "company_login.do");
					mav.setViewName("company/company_msg");
				}else if(!cm_number.equals(dto.getCm_number())){
					mav.addObject("msg", "사업자 번호를 확인해주세요. ");
					mav.addObject("url", "company_login.do");
					mav.setViewName("company/company_msg");
				}else{
					Cookie ck= new Cookie("saveHid", userHid);
					ck.setMaxAge(saveHid==null?0:(60*60*24*30));
					resp.addCookie(ck);
					
					session.removeAttribute(userHid);
					
					String cm_name=dto.getCm_name();
					session.setAttribute("cm_name", cm_name);
					session.setAttribute("userBid", userHid);
					mav.setViewName("redirect:/index.do");
				}

			}
		
		}

	return mav;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
