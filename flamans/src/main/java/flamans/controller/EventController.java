package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import flamans.paging.PageModule;
import flamans.paging.PageModule2;
import flamans.user.event.model.EventDAO;
import flamans.user.event.model.EventDTO;

@Controller
public class EventController {

	@Autowired
	private PageModule2 paging2;

	@Autowired
	private EventDAO eventDao;

	private Date e_start;

	// 이벤트(고객)
	@RequestMapping("/event_user_list.do")
	public ModelAndView eventUserList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "e_item", required = false) int e_item) {
		
		/*
		 * 오늘 날짜 비교 캘린더 받아와서 비교 if() 기존 데이터랑 비교해서 날짜가 이전이면 e_item 2 로 업데이트
		 */

		Calendar now = Calendar.getInstance();
		int m = now.get(Calendar.MONTH) + 1;
		int y = now.get(Calendar.YEAR);
		int d = now.get(Calendar.DATE);

		String nowDate_s = y + "-" + m + "-" + d;

		String nowDate = nowDate_s.replace("-", "");
		int nowDate1 = Integer.parseInt(nowDate);
		int totalCnt = eventDao.getTotalCnt("", e_item);
		int listSize = 5;
		int pageSize = 5;
		ModelAndView mav = new ModelAndView();
		String pageStr = PageModule.makePage("event_user_list.do", totalCnt, listSize, pageSize, cp);
		List<EventDTO> list = eventDao.event_user_list(cp, listSize, e_item);
		for (int i = 0; i < list.size(); i++) {
			String endDate_s = list.get(i).getE_end();
			String endDate_s1 = endDate_s.substring(0, 10);
			String endDate = endDate_s1.replace("-", "");
			int endDate1 = Integer.parseInt(endDate);
			int e_idx = list.get(i).getE_idx();
			if (nowDate1 > endDate1) {
				int result = eventDao.event_Date(e_idx);
			}
		}
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("event/event_user_list");
		return mav;
	}

	// 이벤트 상세보기(고객)
	@RequestMapping("/event_user_content.do")
	public ModelAndView event_user_content(@RequestParam(value = "e_idx", defaultValue = "0") int e_idx) {
		Object list = eventDao.event_user_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("event/event_user_content");
		return mav;
	}

	// 사이트관리자페이지-글쓰기
	@RequestMapping(value = "/event_add.do", method = RequestMethod.GET)
	public String event_addForm() {
		return "event/event_add";
	}

	// 사이트관리자페이지-글쓰기
	@RequestMapping(value = "/event_add.do", method = RequestMethod.POST)
	public ModelAndView event_add(EventDTO dto, @RequestParam("uploadimg") MultipartFile uploadimg,HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img/img");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		try {
			byte bytes[] = uploadimg.getBytes();
			File newFile = new File(path+"/"+uploadimg.getOriginalFilename());

			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
			dto.setE_img(uploadimg.getOriginalFilename());

		} catch (IOException e) {
			e.printStackTrace();
		}
		int result = eventDao.event_add(dto);
		String msg = result > 0 ? "이벤트 성공" : "이벤트 실패";
		System.out.println(dto.getE_name());
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "event_co_list.do?e_name=" + dto.getE_name());
		mav.setViewName("event/event_msg");
		return mav;
	}

	// 사이트관리자페이지-이벤트 리스트
	@RequestMapping("/event_list.do")
	public ModelAndView eventList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = eventDao.getTotalCnt("", 0);
		int listSize = 5;
		int pageSize = 5;
		String pageStr = PageModule.makePage("event_list.do", totalCnt, listSize, pageSize, cp);
		List<EventDTO> list = eventDao.event_list(cp, listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("event/event_list");
		return mav;
	}

	// 사이트관리자페이지-이벤트 상세보기
	@RequestMapping("/event_content.do")
	public ModelAndView event_content(@RequestParam(value = "e_idx", defaultValue = "0") int e_idx) {
		Object list = eventDao.event_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("event/event_content");
		return mav;
	}

	// 사이트관리자페이지-이벤트 수정
	@RequestMapping(value = "/event_update.do", method = RequestMethod.GET)
	public ModelAndView event_updateForm(@RequestParam(value = "e_idx", required = false) int e_idx) {
		Object list = eventDao.event_content(e_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("event_update", list);
		mav.setViewName("event/event_update");
		return mav;
	}

	// 사이트관리자페이지-이벤트 수정
	@RequestMapping(value = "/event_update.do", method = RequestMethod.POST)
	public ModelAndView event_update(@RequestParam("e_idx") int e_idx, @RequestParam("e_subject") String e_subject,
			@RequestParam("e_start") String e_start, @RequestParam("e_end") String e_end,
			@RequestParam("uploadimg") MultipartFile uploadimg,HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		String path = request.getRealPath("img/img");
		try {
			byte bytes[] = uploadimg.getBytes();
			File newFile = new File(path+"/"+uploadimg.getOriginalFilename());

			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		String e_img = uploadimg.getOriginalFilename();

		int result = eventDao.event_update(e_idx, e_subject, e_start, e_end, e_img);
		String msg = result > 0 ? "수정성공" : "수정실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "event_list.do");
		mav.setViewName("event/event_msg");
		return mav;
	}

	// 사이트관리자페이지-이벤트 삭제
	@RequestMapping("/event_delete.do")
	public ModelAndView event_delete(@RequestParam("e_idx") int e_idx) {
		int result = eventDao.event_delete(e_idx);
		String msg = result > 0 ? "이벤트 삭제 성공!" : "이벤트 삭제 실패!";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "event_list.do");
		mav.setViewName("event/event_msg");
		return mav;

	}

	// 호텔,병원관리자-리스트
	@RequestMapping("/event_co_list.do")
	public ModelAndView event_hot_list(@RequestParam(value = "e_name", defaultValue = "") String e_name,
			@RequestParam(value = "cp", defaultValue = "1", required = false) int cp,HttpSession session) {
		int totalCnt = eventDao.getTotalCnt(e_name, 0);
		int listSize = 5;
		int pageSize = 5;
		String pageStr = PageModule2.makePage("event_co_list.do", totalCnt, listSize, pageSize, cp,e_name);
		List<EventDTO> list = eventDao.event_co_list(cp, listSize, e_name);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("event/event_co_list");
		return mav; 
	}

	// 호텔,병원관리자-상세보기
	@RequestMapping("/event_co_content.do")
	public ModelAndView event_co_content(@RequestParam(value = "e_idx", defaultValue = "0") int e_idx) {
		Object list = eventDao.event_content(e_idx);
		int count = eventDao.e_readnum(e_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("event/event_co_content");
		return mav;
	}

	// 호텔,병원관리자-수정
	@RequestMapping(value = "/event_co_update.do", method = RequestMethod.GET)
	public ModelAndView event_co_updateForm(@RequestParam(value = "e_idx", required = false) int e_idx) {
		Object list = eventDao.event_co_content(e_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("event_co_update", list);
		mav.setViewName("event/event_co_update");
		return mav;
	}

	// 호텔,병원관리자-수정
	@RequestMapping(value = "/event_co_update.do", method = RequestMethod.POST)
	public ModelAndView event_co_update(@RequestParam("e_idx") int e_idx, @RequestParam("e_subject") String e_subject,
			@RequestParam("e_start") String e_start, @RequestParam("e_end") String e_end,
			@RequestParam("uploadimg") MultipartFile uploadimg,@RequestParam("e_name")String e_name,HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img/img");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		try {
			byte bytes[] = uploadimg.getBytes();
			File newFile = new File(path+"/"+uploadimg.getOriginalFilename());

			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String e_img = uploadimg.getOriginalFilename();

		int result = eventDao.event_co_update(e_idx, e_subject, e_start, e_end, e_img);
		String msg = result > 0 ? "수정성공" : "수정실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "event_co_list.do?e_name="+e_name);
		mav.setViewName("event/event_msg");
		return mav;
	}

	// 호텔,병원 관리자-삭제
	@RequestMapping("/event_co_delete.do")
	public ModelAndView event_co_delete(@RequestParam("e_idx") int e_idx,@RequestParam("e_name")String e_name) {
		int result = eventDao.event_co_delete(e_idx);
		String msg = result > 0 ? "이벤트 삭제 성공!" : "이벤트 삭제 실패!";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "event_co_list.do?e_name="+e_name);
		mav.setViewName("event/event_msg");
		return mav;

	}

}
