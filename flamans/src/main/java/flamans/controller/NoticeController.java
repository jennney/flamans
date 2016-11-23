package flamans.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.SybaseCallMetaDataProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import flamans.notice.model.NoticeDAO;
import flamans.notice.model.NoticeDTO;
import flamans.paging.PageModule;

@Controller
public class NoticeController {
	
	@Autowired
	private PageModule paging;
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@RequestMapping("/no_List.do")
	public ModelAndView noList(@RequestParam(value="cp",required=false)String cp_s){
		if(cp_s==null || cp_s.equals("")){
			cp_s = "1";
		}
		int cp = Integer.parseInt(cp_s);
		int totalCnt = noticeDao.noTotal();
		int listSize = 5;
		int pageSize = 5;
		String no_page = paging.makePage("no_List.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> noList = noticeDao.noList(cp,listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noList", noList);
		mav.addObject("no_page", no_page);
		mav.setViewName("service/Notice/no_List");
		return mav;
	}
	
	@RequestMapping(value="/no_Write.do",method=RequestMethod.GET)
	public String noWriteForm(){
		return "service/Notice/no_Write";
	}
	
	private void copyInto(MultipartFile upload){
		try {
			byte bytes[] = upload.getBytes();
			File newFile = new File("C:/Users/socls/git/flamans/flamans/src/main/webapp/WEB-INF/views/service/Notice/upload/"+upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/no_Write.do",method=RequestMethod.POST)
	public ModelAndView noWrite(NoticeDTO ndto, @RequestParam("upload")List<MultipartFile> upload){
		for(int i=0;i<upload.size();i++){
			copyInto(upload.get(i));
		}
		ndto.setNo_file1(upload.get(0).getOriginalFilename());
		ndto.setNo_file2(upload.get(1).getOriginalFilename());
		int result = noticeDao.noWrite(ndto);
		String msg = result>0?"글쓰기가 완료되었습니다.":"글쓰기가 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","no_List.do");
		mav.setViewName("/service/Notice/no_Msg");
		return mav;
	}
	
	@RequestMapping("/no_Content.do")
	public ModelAndView noContent(@RequestParam(value="idx",required=false)String idx_s){
		if(idx_s==null || idx_s.equals("")){
			idx_s="0";
		}
		int no_idx = Integer.parseInt(idx_s);
		NoticeDTO ndto = noticeDao.noContent(no_idx);
		int count = noticeDao.noReadnum(no_idx);
		ModelAndView mav = new ModelAndView();
		if(ndto==null){
			mav.addObject("msg","삭제되었거나 잘못된 접근입니다.");
			mav.addObject("url","no_List.do");
			mav.setViewName("/service/Notice/no_Msg");
			return mav;
		}else{
			ndto.setNo_content(ndto.getNo_content().replaceAll("\n", "<br>")); 
			mav.addObject("ndto",ndto);
			mav.setViewName("service/Notice/no_Content");
			return mav;
		}
	}
	
	@RequestMapping("no_Delete.do")
	public ModelAndView noDelete(@RequestParam("idx")int no_idx){
		int result = noticeDao.noDelete(no_idx);
		String msg = result>0?"삭제가 완료되었습니다.":"삭제가 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","no_List.do");
		mav.setViewName("service/Notice/no_Msg");
		return mav;
	}
	
	@RequestMapping(value="/no_Update.do",method=RequestMethod.GET)
	public ModelAndView noUpdateForm(@RequestParam("idx")int no_idx){
		NoticeDTO ndto = noticeDao.noContent(no_idx);
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("ndto",ndto);
		mav.setViewName("service/Notice/no_Update");
		return mav;
	}
	
	@RequestMapping(value="/no_Update.do",method=RequestMethod.POST)
	public ModelAndView noUpdate(NoticeDTO ndto){
		int result = noticeDao.noUpdate(ndto);
		String msg = result>0?"수정이 완료되었습니다.":"수정이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","no_List.do");
		mav.setViewName("service/Notice/no_Msg");
		return mav;
	}
	
	@RequestMapping("no_down.do")
	public ModelAndView noDown(@RequestParam("no_file")String filename){
		File f = new File("C:/Users/socls/git/flamans/flamans/src/main/webapp/WEB-INF/views/service/Notice/upload/"+filename);
		ModelAndView mav = new ModelAndView("down","downloadFile",f);
		return mav;
	}

}
