package flamans.controller;

import static org.junit.Assert.fail;

import java.security.MessageDigest;

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
			kind1 = "B";
		}else if(kind.equals("호텔"))
		{
			kind1 = "H";
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
	public ModelAndView company_id_check(@RequestParam(value="cm_id",required=false)String cm_id){
		String id = companyDao.company_id_check(cm_id);
		ModelAndView mav = new ModelAndView();
		System.out.println(cm_id);
		String msg = id!=null?"중복된 아이디입니다.":"사용가능한 아이디 입니다.";
		mav.addObject("msg", msg);
		mav.setViewName("company/idCheckOk");
		return mav;
		
	}
	
	/**비밀번호 암호화*/
	public String getEncMD5(String txt) throws Exception {

		StringBuffer sbuf = new StringBuffer();

		MessageDigest mDigest = MessageDigest.getInstance("MD5");
		mDigest.update(txt.getBytes());
	
		byte[] msgStr = mDigest.digest() ;
		
		for(int i=0; i < msgStr.length; i++){
			String tmpEncTxt = Integer.toHexString((int)msgStr[i] & 0x00ff) ;
			sbuf.append(tmpEncTxt) ;
		}
		
		return sbuf.toString() ;
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////
	/**로그인 폼*/
	@RequestMapping(value="/company_login.do", method=RequestMethod.GET)
	public String companyLogin(){
		return "company/company_login";
	}
	
	@RequestMapping(value="/company_login.do",method=RequestMethod.POST)
	public ModelAndView companyLoginCheck(CompanyDTO pdto,@RequestParam(value="savecoId",required=false)String savecoId,HttpSession session,
			HttpServletResponse resp, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("userid") != null){
			mav.addObject("msg", "로그아웃 후 이용해주세요.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
		}else if(session.getAttribute("userid") == null){
			CompanyDTO dto=companyDao.companyLogin(pdto.getCm_id());
			
			if(dto==null){		
			mav.addObject("msg", "등록된 ID가 아닙니다.");
			mav.addObject("url", "company_login.do");
			mav.setViewName("company/company_msg");
			
			}else if(pdto.getCm_id().equals(dto.getCm_id())){
				if(!pdto.getCm_pwd().equals(dto.getCm_pwd())){		
					mav.addObject("msg", "잘못된 비밀번호입니다. ");
					mav.addObject("url", "company_login.do");
					mav.setViewName("company/company_msg");
				}else{
					Cookie ck= new Cookie("savecoId",savecoId);
					ck.setMaxAge(savecoId==null?0:(60*60*24*30));
					resp.addCookie(ck);
					String cm_name=dto.getCm_name();
					session.setAttribute("cm_name", cm_name);
					session.setAttribute("savecoId",dto.getCm_id());
					session.setAttribute("permit", dto.getCm_permit());
					mav.setViewName("redirect:/index.do");
				}
			}
		}
		return mav;
	}

	/**병원관계자 로그인*/
	@RequestMapping(value="/company_Blogin.do", method=RequestMethod.POST)
	public ModelAndView CompanyBloginCheck(@RequestParam("B_id")String userBid, @RequestParam("B_pwd")String userBpwd,
	HttpSession session, @RequestParam(value="saveBid", required=false)String saveBid,
	@RequestParam("b_number1")String b_number1, @RequestParam("b_number2")String b_number2, 
	@RequestParam("b_number3")String b_number3, HttpServletResponse resp, HttpServletRequest req
	){
	
		ModelAndView mav= new ModelAndView();
		
		String cm_number="B"+b_number1+b_number2+b_number3;
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
					session.setAttribute("cm_number", cm_number);
					session.setAttribute("permit", dto.getCm_permit());
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
		
		String cm_number="H"+h_number1+h_number2+h_number3;
		
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
					session.setAttribute("userHid", userHid);
					session.setAttribute("cm_number", cm_number);
					session.setAttribute("permit", dto.getCm_permit());
					mav.setViewName("redirect:/index.do");
				}

			}
		
		}

	return mav;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////
	/**id 찾기 폼*/
	@RequestMapping(value="/company_find_id.do", method=RequestMethod.GET)
	public String company_find_id_form(){
		return "company/company_find_id_form";
	}
	
	/**id 찾기*/
	@RequestMapping(value="/company_find_id.do", method=RequestMethod.POST)
	public ModelAndView company_find_id(@RequestParam("cm_name")String cm_name,@RequestParam("cm_email")String cm_email){
		
		CompanyDTO dto=companyDao.company_find_id(cm_name, cm_email);
		
		ModelAndView mav = new ModelAndView();
			
		if(dto==null){
			mav.addObject("msg", "ID가 없습니다.");
			mav.addObject("url", "company_find_id.do");
			mav.setViewName("company/company_msg");
		}else{
			mav.addObject("dto", dto);
			mav.setViewName("company/company_find_id");
		}

		return mav;
		
	}
	
	/**pwd 찾기 폼*/
	@RequestMapping(value="/company_find_pwd.do", method=RequestMethod.GET)
	public String company_find_pwd_form(){
		return "company/company_find_pwd_form";
	}
	
	/**pwd 찾기*/
	@RequestMapping(value="/company_find_pwd.do", method=RequestMethod.POST)
	public ModelAndView company_find_pwd(@RequestParam("cm_id")String cm_id, @RequestParam("cm_email")String cm_email, 
			@RequestParam("email_check")String email_check){
		
		ModelAndView mav = new ModelAndView();
		if(email_check.equals("인증완료")){
			mav.addObject("cm_id", cm_id);
			mav.addObject("cm_email", cm_email);
			mav.setViewName("company/company_update_pw");
		}else{
			mav.addObject("msg", "메일인증을 해주세요.");
			mav.addObject("url", "company_find_pwd.do");
			mav.setViewName("company/company_msg");
		}
		return mav;
	}
	
	/**pwd 변경 폼*/
	@RequestMapping(value="/company_update_pw.do", method=RequestMethod.GET)
	public String company_update_pw(){
		return "company/company_update_pw";
	}
	
	
	/**비밀번호 변경*/
	@RequestMapping(value="/company_update_pw.do", method=RequestMethod.POST)
	public ModelAndView company_update_pw(@RequestParam("cm_id")String cm_id, @RequestParam("cm_email")String cm_email,
			@RequestParam("cm_pwd")String cm_pwd, @RequestParam("cm_pwd_check")String cm_pwd_check)throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		if(!cm_pwd_check.equals("인증완료")){
			mav.addObject("msg", "비밀번호가 틀립니다.");
			mav.addObject("url", "company_find_pwd.do");
			mav.setViewName("company/company_msg");
			
		}else{
			cm_pwd= getEncMD5(cm_pwd);
					
			int result=companyDao.company_update_pw(cm_id, cm_email, cm_pwd);
			System.out.println("컨트롤");
			System.out.println(cm_email);
			System.out.println(cm_id);
			String msg=result>0?"비밀번호가 변경되었습니다.":"비밀번호 변경 실패하였습니다.";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("company/company_msg");
		}

		return mav;
	}
	
	// 회원정보 수정 폼
	@RequestMapping(value = "/company_update.do", method = RequestMethod.GET)
	public String company_updateForm() {
		return "company/company_update";
	}
	
	/**회원정보 수정*/
	@RequestMapping(value="/company_update.do", method=RequestMethod.POST)
	public ModelAndView company_update(CompanyDTO dto, @RequestParam("number1")String number1,
			@RequestParam("number2")String number2, @RequestParam("kind")String kind,
			@RequestParam("email_check")String email_check, @RequestParam("cm_email")String cm_email,
			HttpSession session){
		
		String cm_id=(String)session.getAttribute("userid");
		dto.setCm_id(cm_id);
		String cm_tel = kind+"-"+number1+"-"+number2;
		dto.setCm_tel(cm_tel);	
	
		ModelAndView mav= new ModelAndView();
		
		if(email_check.equals("인증완료")){
			int result=companyDao.company_update(dto);
			
			String msg=result>0?"회원정보 수정 성공!":"회원정보 수정 실패!";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
		
			mav.setViewName("company/company_msg");
		}else{
			mav.addObject("msg", "이메일 인증을 해주세요.");
			mav.addObject("url", "member_page.do");
		
			mav.setViewName("company/company_msg");
		}
				
		return mav;
	}
	
	
}