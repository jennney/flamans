package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;
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

	private Date e_start;
	
	//이벤트(고객)
	@RequestMapping("/event_user_list.do")
	public ModelAndView eventUserList(
		@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="e_item",required=false)int e_item){
		/*오늘 날짜 비교 캘린더 받아와서 비교
		  if() 기존 데이터랑 비교해서 날짜가 이전이면 
		   e_item 2 로 업데이트*/
			
			Calendar now = Calendar.getInstance();
			int m = now.get(Calendar.MONTH)+1;
			int y = now.get(Calendar.YEAR);
			int d = now.get(Calendar.DATE);
			
			String nowDate_s = y+"-"+m+"-"+d;
			
			String nowDate = nowDate_s.replace("-", "");
			int nowDate1 = Integer.parseInt(nowDate);
			int totalCnt=eventDao.getTotalCnt();
			int listSize=5;
			int pageSize=5;
			ModelAndView mav=new ModelAndView();
			String pageStr=paging.makePage("event_user_list.do",totalCnt,listSize,pageSize,cp);
			List<EventDTO> list=eventDao.event_user_list(cp,listSize, e_item);
			for(int i=0;i<list.size();i++){
				String endDate_s = list.get(i).getE_end();
				String endDate_s1 = endDate_s.substring(0, 10);
				String endDate = endDate_s1.replace("-", "");
				int endDate1 = Integer.parseInt(endDate);
				int e_idx = list.get(i).getE_idx();
				if(nowDate1 > endDate1){
					int result = eventDao.event_Date(e_idx);
				}
			}
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("event/event_user_list");
			return mav;
		}
	
	//이벤트 상세보기(고객)
	@RequestMapping("/event_user_content.do")
	public ModelAndView event_user_content(@RequestParam(value="e_idx",defaultValue="0")int e_idx){
		Object list=eventDao.event_user_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("event/event_user_content");
		return mav;
	}
			
	//관리자페이지-글쓰기
	@RequestMapping(value="/event_add.do",method=RequestMethod.GET)
	public String event_addForm(){
		return "event/event_add";
	}
	
	//관리자페이지-파일업로드
	private void copyInto(MultipartFile uploadimg){

	      try {
	         byte bytes[] = uploadimg.getBytes();
	         File newFile = new File("C:/Users/지나/git/flamans/flamans/src/main/webapp/img/" + uploadimg.getOriginalFilename());
	         
	         FileOutputStream fos = new FileOutputStream(newFile);
	         fos.write(bytes);
	         fos.close();
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }
	
	//관리자페이지-글쓰기
	@RequestMapping(value="/event_add.do",method=RequestMethod.POST)
	public ModelAndView event_add(EventDTO dto,@RequestParam("uploadimg")MultipartFile uploadimg){
	copyInto(uploadimg);
	dto.setE_img(uploadimg.getOriginalFilename());
	int result=eventDao.event_add(dto);
	String msg=result>0?"이벤트 성공":"이벤트 실패";
	ModelAndView mav=new ModelAndView();
	mav.addObject("msg",msg);
	mav.addObject("url","event_user_list.do?e_item="+dto.getE_item());
	mav.setViewName("event/event_msg");
	return mav;
}
	//관리자페이지-이벤트 리스트
	@RequestMapping("/event_list.do")
	public ModelAndView eventList(
		@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt=eventDao.getTotalCnt();
			int listSize=5;
			int pageSize=5;
			String pageStr=paging.makePage("event_list.do",totalCnt,listSize,pageSize,cp);
			List<EventDTO> list=eventDao.event_list(cp,listSize);
			ModelAndView mav=new ModelAndView();
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("event/event_list");
			return mav;
		}
	
	//관리자페이지-이벤트 상세보기
	@RequestMapping("/event_content.do")
	public ModelAndView event_content(@RequestParam(value="e_idx",defaultValue="0")int e_idx){
		Object list=eventDao.event_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("event/event_content");
		return mav;
	}
	
	//관리자페이지-이벤트 수정
	@RequestMapping(value="/event_update.do",method=RequestMethod.GET)  
	public ModelAndView event_updateForm(@RequestParam(value="e_idx",required=false)int e_idx){ 
		Object list=eventDao.event_content(e_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("event_update",list); 
		mav.setViewName("event/event_update");
		return mav;
	}
	
	//관리자페이지-이벤트 수정
	@RequestMapping(value="/event_update.do",method=RequestMethod.POST)
	public ModelAndView event_update(@RequestParam("e_idx")int e_idx,
			@RequestParam("e_subject")String e_subject,@RequestParam("e_start")String e_start,
			@RequestParam("e_end")String e_end,@RequestParam("uploadimg")MultipartFile uploadimg) {
		copyInto(uploadimg);
		String e_img = uploadimg.getOriginalFilename();
		
		int result = eventDao.event_update(e_idx,e_subject,e_start,e_end,e_img);
		String msg = result>0?"수정성공":"수정실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url", "event_list.do");
		mav.setViewName("event/event_msg");
		return mav;
	}
	
	//관리자페이지-이벤트 삭제
	@RequestMapping("/event_delete.do")
	public ModelAndView event_delete(@RequestParam("e_idx")int e_idx){
	int result=eventDao.event_delete(e_idx);
	String msg=result>0?"이벤트 삭제 성공!":"이벤트 삭제 실패!";
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("msg",msg);
	mav.addObject("url","event_list.do");
	mav.setViewName("event/event_msg");
	return mav;
	}
	
	//호텔 이벤트 관리 리스트
	@RequestMapping("/event_hot_list.do")
	public ModelAndView event_hot_list(
		@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="hot_num",required=false)int hot_num){
			int totalCnt=eventDao.getTotalCnt();
			int listSize=5;
			int pageSize=5;
			String pageStr=paging.makePage("event_list.do",totalCnt,listSize,pageSize,cp);
			List<EventDTO> list=eventDao.event_hot_list(cp,listSize);
			ModelAndView mav=new ModelAndView();
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("event/event_hot_list");
			return mav;
		}
	
	//병원 이벤트 관리 리스트
	@RequestMapping("/event_hos_list.do")
	public ModelAndView event_hos_list(
		@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt=eventDao.getTotalCnt();
			int listSize=5;
			int pageSize=5 ;
			String pageStr=paging.makePage("event_hos_list.do", totalCnt, listSize, pageSize, cp);
			List<EventDTO> list=eventDao.event_hos_list(cp, listSize);
			ModelAndView mav=new ModelAndView();
			mav.addObject("list",list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("event/event_hos_list");
			return mav;
		}
		
   }

