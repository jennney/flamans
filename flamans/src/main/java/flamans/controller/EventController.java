package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.paging.PageModule;
import flamans.user.event.model.EventDAO;
import flamans.user.event.model.EventDTO;

@Controller 
public class EventController {
	
	@Autowired
	private PageModule paging;
	
	@Autowired
	private EventDAO eventDao;
	
	@RequestMapping("/event_user_startlist.do")
	public ModelAndView eventUserStrtList(
		@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt=eventDao.getTotalCnt();
			int listSize=5;
			int pageSize=5;
			String pageStr=paging.makePage("event_user_startlist.do",totalCnt,listSize,pageSize,cp);
			List<EventDTO> list=eventDao.event_user_startlist(cp,listSize);
			ModelAndView mav=new ModelAndView();
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("event/event_user_startlist");
			return mav;
		}
	
	
	@RequestMapping("/event_user_content.do")
	public ModelAndView event_user_content(@RequestParam(value="e_idx",defaultValue="0")int e_idx){
		Object list=eventDao.event_user_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		System.out.println(count);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("event/event_user_content");
		return mav;
	}
	
	@RequestMapping("/event_user_endlist.do")
	public ModelAndView eventUserEndList(
			@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt=eventDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=paging.makePage("event_user_endlist.do",totalCnt,listSize,pageSize,cp);
			List<EventDTO> list=eventDao.event_user_endlist(cp,listSize);
			ModelAndView mav=new ModelAndView();
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("event/event_user_endlist");
			return mav;
		}
	
	@RequestMapping(value="/event_add.do",method=RequestMethod.GET)
	public ModelAndView event_add(){
		
	
	ModelAndView mav=new ModelAndView();
	
	mav.setViewName("event/event_add");
	
	return mav;
}
	
	@RequestMapping(value="/event_add.do",method=RequestMethod.POST)
	public ModelAndView event_add(EventDTO dto){
		
	int result=eventDao.event_add(dto);
	String msg=result>0?"글쓰기 성공":"글쓰기 실패";
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("msg",msg);
	mav.setViewName("event/eventMsg");
	return mav;
}
   }

