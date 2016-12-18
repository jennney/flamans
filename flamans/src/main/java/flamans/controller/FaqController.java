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
import flamans.paging.PageModule1;

@Controller
public class FaqController {
	
	@Autowired
	private PageModule1 paging1;
	
	@Autowired
	private FaqDAO faqDao;
	
	@RequestMapping("/faq_List.do")
	public ModelAndView faqList(){
		List<FaqDTO> list = faqDao.faqList();
		List<FaqDTO> bestList = faqDao.faqBestList();
		List<FaqDTO> memList = faqDao.faqmemList();
		List<FaqDTO> hosList = faqDao.faqhosList();
		List<FaqDTO> hotList = faqDao.faqhotList();
		List<FaqDTO> etcList = faqDao.faqetc();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("bestList", bestList);
		mav.addObject("memList", memList);
		mav.addObject("hosList", hosList);
		mav.addObject("hotList", hotList);
		mav.addObject("etcList", etcList);
		mav.setViewName("service/FAQ/faq_List");
		return mav;		
	}
	
	@RequestMapping("/faq_List_admin.do")
	public ModelAndView faqListAdmin(){
		List<FaqDTO> list = faqDao.faqList();
		List<FaqDTO> bestList = faqDao.faqBestList();
		List<FaqDTO> memList = faqDao.faqmemList();
		List<FaqDTO> hosList = faqDao.faqhosList();
		List<FaqDTO> hotList = faqDao.faqhotList();
		List<FaqDTO> etcList = faqDao.faqetc();
		ModelAndView mav = new ModelAndView();
		mav.addObject("shap","#");
		mav.addObject("list", list);
		mav.addObject("bestList", bestList);
		mav.addObject("memList", memList);
		mav.addObject("hosList", hosList);
		mav.addObject("hotList", hotList);
		mav.addObject("etcList", etcList);
		mav.setViewName("service/FAQ/faq_List_admin");
		return mav;		
	}

	@RequestMapping(value="/faq_Write.do",method=RequestMethod.GET)
	public String faqWriteForm(){
		return "service/FAQ/faq_Write";
	}
	
	@RequestMapping(value="/faq_Write.do",method=RequestMethod.POST)
	public ModelAndView faqWrite(FaqDTO fdto){
		if(fdto.getFaq_checked()==null || fdto.getFaq_checked().equals("")){
			fdto.setFaq_checked("");
		}
		int result = faqDao.faqWrite(fdto);
		String msg = result>0?"자주하는질문이 등록되었습니다.":"잘주하는질문등록이 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","faq_List_admin.do");
		mav.setViewName("service/FAQ/faq_Msg");
		return mav;
	}
	
	@RequestMapping("/faq_Delete.do")
	public ModelAndView faqDelete(@RequestParam("faq_idx")int faq_idx){
		int result = faqDao.faqDelete(faq_idx);
		String msg = result>0?"삭제 완료 되었습니다.":"삭제가 실패 되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url","faq_List_admin.do");
		mav.setViewName("service/FAQ/faq_Msg");
		return mav;
	}
	
	@RequestMapping(value="/faq_Update.do",method=RequestMethod.GET)
	public ModelAndView faqUpdateForm(@RequestParam("faq_idx")int faq_idx){
		FaqDTO fdto = faqDao.faqContent(faq_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("fdto",fdto);
		mav.setViewName("service/FAQ/faq_Update");
		return mav;
	}
	
	@RequestMapping(value="/faq_Update.do",method=RequestMethod.POST)
	public ModelAndView faqUpdate(FaqDTO fdto){
		if(fdto.getFaq_checked()==null || fdto.getFaq_checked().equals("")){
			fdto.setFaq_checked("");
		}
		int result = faqDao.faqUpdate(fdto);
		String msg = result>0?"수정이 완료되었습니다.":"수정이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","faq_List_admin.do");
		mav.setViewName("service/FAQ/faq_Msg");
		return mav;
	}
	
	@RequestMapping(value="/faq_Find.do")
	public ModelAndView faqFind(@RequestParam("findValue")String findValue,@RequestParam(value = "cp", defaultValue = "1") int cp){
		List<FaqDTO> list = faqDao.faqFind(findValue);
		int totalCnt = faqDao.faqTotal(findValue);
		int listSize = 5;
		int pageSize = 5;
		String faq_page = paging1.makePage("faq_Find.do", totalCnt, listSize, pageSize, cp,"all", findValue,"");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("count",totalCnt);
		mav.addObject("findValue",findValue);
		mav.addObject("page",faq_page);
		mav.setViewName("service/FAQ/faq_Find");
		return mav;
	}
	
	@RequestMapping(value="/faq_Find_admin.do")
	public ModelAndView faqFindAdmin(@RequestParam("findValue")String findValue,@RequestParam(value = "cp", defaultValue = "1") int cp){
		List<FaqDTO> list = faqDao.faqFind(findValue);
		int totalCnt = faqDao.faqTotal(findValue);
		int listSize = 5;
		int pageSize = 5;
		String faq_page = paging1.makePage("faq_Find_admin.do", totalCnt, listSize, pageSize, cp,"all", findValue,"");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("count",totalCnt);
		mav.addObject("findValue",findValue);
		mav.addObject("page",faq_page);
		mav.setViewName("service/FAQ/faq_Find_admin");
		return mav;
	}
}
