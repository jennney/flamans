package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.faq.model.FaqDAO;
import flamans.faq.model.FaqDTO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqDAO faqDao;
	
	@RequestMapping("/faq_List.do")
	public ModelAndView faqList(@RequestParam(value="faq_item",required=false)String faq_item){
		List<FaqDTO> list = faqDao.faqList(faq_item);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("faq_item",faq_item);
		mav.setViewName("service/FAQ/faq_List");
		return mav;		
	}

	@RequestMapping(value="/faq_Write.do",method=RequestMethod.GET)
	public String faqWriteForm(){
		return "service/FAQ/faq_Write";
	}
	
	@RequestMapping(value="/faq_Write.do",method=RequestMethod.POST)
	public ModelAndView faqWrite(FaqDTO fdto){
		System.out.println(fdto.getFaq_item());
		if(fdto.getFaq_checked()==null || fdto.getFaq_checked().equals("")){
			fdto.setFaq_checked("");
		}
		int result = faqDao.faqWrite(fdto);
		String msg = result>0?"자주하는질문이 등록되었습니다.":"잘주하는질문등록이 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","faq_List.do");
		mav.setViewName("service/FAQ/faq_Msg");
		return mav;
	}
	
}
