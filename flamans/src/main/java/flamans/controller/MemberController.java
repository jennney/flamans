package flamans.controller;

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

import flamans.member.model.*;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDao;
	
	
	@RequestMapping("/index.do")
	public String index(){
		return "index";
	}
		
	
	
	@RequestMapping(value="/member_join.do", method=RequestMethod.GET)
	public String memberJoin(){
		return "member/member_join";
	}
	
	
	@RequestMapping(value="/member_id_check.do", method=RequestMethod.GET)
	public ModelAndView idCheck(@RequestParam("m_id")String m_id){
		
		int result=memberDao.idCheck(m_id);
		
		ModelAndView mav = new ModelAndView();	
	
		String msg=result>0?"이미 사용중인 ID입니다.":"사용 가능한 ID입니다..";
		mav.addObject("msg", msg);
		mav.setViewName("member/CheckMsg");
		
		return mav;
	}
	
	@RequestMapping(value="/member_join.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto, @RequestParam("number1")String number1,
			@RequestParam("number2")String number2, @RequestParam("kind")String kind,
			@RequestParam("m_id_check")String m_id_check, @RequestParam("m_pwd_check")String m_pwd_check,
			@RequestParam("email_check")String email_check
			) throws Exception{
		
		String en_pwd= getEncMD5(dto.getM_pwd());
		dto.setM_pwd(en_pwd);
		
		String m_tel = kind+number1+number2;
		dto.setM_tel(m_tel);
		
		ModelAndView mav = new ModelAndView();
		
		if(!m_id_check.equals("인증완료")){
			mav.addObject("msg", "ID를 확인해주세요");
			mav.addObject("url", "member_join.do");
		}else if(!m_pwd_check.equals("인증완료")){
			mav.addObject("msg", "PWD를 확인해주세요");
			mav.addObject("url", "member_join.do");
		}else if(!email_check.equals("인증완료")){
			mav.addObject("msg", "Email를 확인해주세요");
			mav.addObject("url", "member_join.do");
		}else{
			int result=memberDao.memberJoin(dto);

			String msg=result>0?"회원가입 성공!":"회원가입 실패!";
			mav.addObject("msg", msg);
			mav.addObject("url", "member_join.do");
		}
		
		mav.setViewName("member/memberMsg");
		
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
	
	@RequestMapping(value="/member_login.do", method=RequestMethod.GET)
	public String memberLogin(){
		return "member/member_login";
	}

	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam("id")String userid, @RequestParam("pwd")String userpwd,
			HttpSession session, @RequestParam(value="saveid", required=false)String saveid,
			HttpServletResponse resp
			){
		
		ModelAndView mav= new ModelAndView();
		
		int result=memberDao.logInCheck(userid, userpwd);
		
		if(result==memberDao.LOGIN_OK){
			
			Cookie ck= new Cookie("saveid", userid);
			ck.setMaxAge(saveid==null?0:(60*60*24*30));
			resp.addCookie(ck);
			
			String username=memberDao.getUserInfo(userid);
			session.setAttribute("username", username);
			session.setAttribute("userid", userid);
			mav.setViewName("member/loginOk");//클로즈를 시켜야 하기 때문에 닫는 기능을 실행시키기 위해 새로운 페이지를 만들어 넘김
			
		}else if(result==memberDao.NOT_ID){
			
			mav.addObject("msg", "등록된 ID가 아닙니다. ");
			mav.addObject("url", "memberLogin.do");
			mav.setViewName("member/memberMsg");
			
		}else if(result==memberDao.NOT_PWD){
			
			mav.addObject("msg", "잘못된 비밀번호입니다. ");
			mav.addObject("url", "memberLogin.do");
			mav.setViewName("member/memberMsg");
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest req){
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		ModelAndView mav= new ModelAndView();
	/*	mav.addObject("msg", "로그아웃 되었습니다!");
		mav.addObject("url", "index.do");
		mav.setViewName("member/memberMsg");*/
		mav.setViewName("redirect://index.do"); 
		
		/*redirect://index.do : 명령어를 쓴거고
		 * 기존에 사용하던 member/memberMsg은 jsp페이지 경로임
		 * */
		
		return mav;
		
	}
	
}
