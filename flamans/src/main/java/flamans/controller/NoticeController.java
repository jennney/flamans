package flamans.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import flamans.notice.model.NoticeDAO;
import flamans.notice.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@RequestMapping("/no_List.do")
	public ModelAndView noList(){
		List<NoticeDTO> noList = noticeDao.noList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("noList", noList);
		mav.setViewName("service/Notice/no_List");
		return mav;
	}

}
