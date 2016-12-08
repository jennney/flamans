package flamans.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {

	public String authNum = "";

	@RequestMapping("/emailForm.do")
	public String emailForm(){
		return "mail/emailForm";
	}
	
	@RequestMapping(value="/emailCheck.do",method=RequestMethod.GET)
	public String emailCheckForm(@RequestParam(value="email",defaultValue="")String email
			,Model model){
		model.addAttribute("email", email);
		return "mail/emailCheckForm";
	}
	
	@RequestMapping(value="/m_emailCheck.do",method=RequestMethod.GET)
	public ModelAndView emailCheckOk(@RequestParam(value="email",defaultValue="")String email,
			HttpServletResponse resp,HttpServletRequest req,Model model){
		
		
		authNum = randomNum();
		
		sendEmail(email, authNum);
		
		model.addAttribute("email", email);
		model.addAttribute("authNum", authNum);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("authNum", authNum);
		mav.setViewName("member/numtest");
		
		return mav;
	}
	
	public String randomNum(){
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0; i<7; i++){
			int temp = (int)(Math.random()*10);
			buffer.append(temp);
		}
		return buffer.toString();
	}
	
	public void sendEmail(String email,String randomNum){

		try {
			String host = "smtp.naver.com"; 
			String subject = "flamans 인증메일입니다"; 
			String fromName = "Flamans"; 
			String from = "dnjsdldidi@naver.com";
			String to = email; 
			
			String content = "인증번호는 ["+randomNum+"] 입니다."; 
			
			Properties prop = new Properties();
//				prop.put("mail.smtp.starttls.enable", "true");
//				prop.put("mail.transport.protocol", "smtp");
//				prop.put("mail.smtp.port", "465");
//				prop.put("mail.smtp.auth", "true");
//				/////////////////////////
			
			prop.put("mail.smtp.host", host);
			prop.put("mail.smtp.user", from);
			
			
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.debug", "true");
			prop.put("mail.smtp.socketFactory.port", "465");
			prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			prop.put("mail.smtp.socketFactory.fallback", "false");
			
			Session mailSession = Session.getInstance(prop,new SMTPAuthenticator()); 
			
			Message msg = new MimeMessage(mailSession);
			
			
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "b")));
			
			
			InternetAddress[] address = {new InternetAddress(to)};
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date()); 
			msg.setContent(content,"text/html;charset=UTF-8");
			
			Transport.send(msg); 
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public class SMTPAuthenticator extends javax.mail.Authenticator{
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			 
	        return new PasswordAuthentication("dnjsdldidi@naver.com", "123qwe!@#"); 
	        
		}
	}
	
}

	
	
	
