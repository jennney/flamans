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
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/member_join.do", method = RequestMethod.GET)
	public String memberJoin() {
	
	@RequestMapping(value="/member_join.do", method=RequestMethod.GET)
	public String memberJoin(){
		return "member/member_join";
	}

	@RequestMapping(value = "/member_id_check.do", method = RequestMethod.GET)
	public ModelAndView idCheck(@RequestParam("m_id") String m_id) {

		int result = memberDao.idCheck(m_id);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "이미 사용중인 ID입니다." : "사용 가능한 ID입니다.";
		mav.addObject("msg", msg);
		mav.setViewName("member/CheckMsg");

		return mav;
	}

	@RequestMapping(value = "/member_join.do", method = RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto, @RequestParam("number1") String number1,
			@RequestParam("number2") String number2, @RequestParam("kind") String kind,
			@RequestParam("m_id_check") String m_id_check, @RequestParam("m_pwd_check") String m_pwd_check,
			@RequestParam("email_check") String email_check) throws Exception {

		String en_pwd = getEncMD5(dto.getM_pwd());
		dto.setM_pwd(en_pwd);

		String m_tel = kind + number1 + number2;
		dto.setM_tel(m_tel);

		ModelAndView mav = new ModelAndView();

		if (!m_id_check.equals("인증완료")) {
			mav.addObject("msg", "ID를 확인해주세요");
			mav.addObject("url", "member_join.do");
		} else if (!m_pwd_check.equals("인증완료")) {
			mav.addObject("msg", "PWD를 확인해주세요");
			mav.addObject("url", "member_join.do");
		} else if (!email_check.equals("인증완료")) {
			mav.addObject("msg", "Email를 확인해주세요");
			mav.addObject("url", "member_join.do");
		} else {
			int result = memberDao.memberJoin(dto);

			String msg = result > 0 ? "회원가입 성공!" : "회원가입 실패!";
			mav.addObject("msg", msg);
			mav.addObject("url", "member_join.do");
		}

		mav.setViewName("member/memberMsg");

		return mav;

	}

	/** 비밀번호 암호화 */
	public String getEncMD5(String txt) throws Exception {

		StringBuffer sbuf = new StringBuffer();

		MessageDigest mDigest = MessageDigest.getInstance("MD5");
		mDigest.update(txt.getBytes());

		byte[] msgStr = mDigest.digest();

		for (int i = 0; i < msgStr.length; i++) {
			String tmpEncTxt = Integer.toHexString((int) msgStr[i] & 0x00ff);
			sbuf.append(tmpEncTxt);
		}

		return sbuf.toString();
	}

	/** id 찾기 폼 */
	@RequestMapping(value = "/member_find_id.do", method = RequestMethod.GET)
	public String memberFindIdForm() {
		return "member/m_find_id_form";
	}

	/** id 찾기 */
	@RequestMapping(value = "/member_find_id.do", method = RequestMethod.POST)
	public ModelAndView memberFindId(@RequestParam("m_name") String m_name, @RequestParam("m_email") String m_email) {

		MemberDTO dto = memberDao.memberFindId(m_name, m_email);

		ModelAndView mav = new ModelAndView();

		if (dto == null) {
			mav.addObject("msg", "ID가 없습니다.");
			mav.addObject("url", "m_find_id.do");
			mav.setViewName("member/memberMsg");
		} else {
			mav.addObject("dto", dto);
			mav.setViewName("member/member_find_id");
		}

		return mav;

	}

	/** pwd 찾기 폼 */
	@RequestMapping(value = "/member_find_pwd.do", method = RequestMethod.GET)
	public String memberFindPwForm() {
		return "member/m_find_pwd_form";
	}

	/** pwd 찾기 */
	@RequestMapping(value = "/member_find_pwd.do", method = RequestMethod.POST)
	public ModelAndView memberFindPwd(@RequestParam("m_id") String m_id, @RequestParam("m_email") String m_email,
			@RequestParam("email_check") String email_check) {

		ModelAndView mav = new ModelAndView();
		if (email_check.equals("인증완료")) {
			mav.addObject("m_id", m_id);
			mav.addObject("m_email", m_email);
			mav.setViewName("member/member_update_pw");
		} else {
			mav.addObject("msg", "메일인증을 해주세요.");
			mav.addObject("url", "member_find_pwd.do");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}

	/** pwd 변경 폼 */
	@RequestMapping(value = "/member_update_pw.do", method = RequestMethod.GET)
	public String memberPwUpdateForm() {
		return "member/member_update_pw";
	}

	/** 비밀번호 변경 */
	@RequestMapping(value = "/member_update_pw.do", method = RequestMethod.POST)
	public ModelAndView memberPwUpdate(@RequestParam("m_id") String m_id, @RequestParam("m_email") String m_email,
			@RequestParam("m_pwd") String m_pwd, @RequestParam("m_pwd_check") String m_pwd_check) {

		ModelAndView mav = new ModelAndView();

		if (!m_pwd_check.equals("인증완료")) {
			mav.addObject("msg", "비밀번호가 틀립니다.");
			mav.addObject("url", "member_find_pwd.do");
			mav.setViewName("member/memberMsg");

		} else {
			int result = memberDao.memberUpdatePwd(m_id, m_email, m_pwd);
			String msg = result > 0 ? "비밀번호가 변경되었습니다." : "비밀번호 변경 실패하였습니다.";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("member/memberMsg");
		}

		return mav;
	}

	/** 로그인 폼 */
	@RequestMapping(value = "/member_login.do", method = RequestMethod.GET)
	public String memberLogin() {
		return "member/member_login";
	}

	/** 로그인 */
	@RequestMapping(value = "/member_login.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam("m_id") String userid, @RequestParam("m_pwd") String userpwd,
			HttpSession session, @RequestParam(value = "saveid", required = false) String saveid,
			HttpServletResponse resp) {

		ModelAndView mav = new ModelAndView();

		MemberDTO dto = memberDao.memberLogin(userid);

		if (dto == null) {
			mav.addObject("msg", "등록된 ID가 아닙니다.");
			mav.addObject("url", "member_login.do");
			mav.setViewName("member/memberMsg");

		} else if (userpwd.equals(dto.getM_pwd())) {

			Cookie ck = new Cookie("saveid", userid);
			ck.setMaxAge(saveid == null ? 0 : (60 * 60 * 24 * 30));
			resp.addCookie(ck);

			String username = dto.getM_name();
			session.setAttribute("username", username);
			session.setAttribute("userid", userid);
			mav.setViewName("redirect:/index.do");

		} else if (!userpwd.equals(dto.getM_pwd())) {
			mav.addObject("msg", "잘못된 비밀번호입니다. ");
			mav.addObject("url", "member_login.do");
			mav.setViewName("member/memberMsg");

		}

		return mav;

	}

	/** 로그아웃 */
	@RequestMapping("/logout.do")
	public ModelAndView memberLogout(HttpServletRequest req) {

		HttpSession session = req.getSession();
		session.invalidate();

		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:/index.do");

		/*
		 * redirect://index.do : 명령어를 쓴거고 기존에 사용하던 member/memberMsg은 jsp페이지 경로임
		 */

		return mav;

	}

}
