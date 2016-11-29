package flamans.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flamans.notice.model.NoticeDAO;
import flamans.notice.model.NoticeDTO;
import flamans.paging.PageModule;
import flamans.paging.PageModule1;

@Controller
public class NoticeController {

	@Autowired
	private PageModule1 paging1;

	@Autowired
	private NoticeDAO noticeDao;

	@RequestMapping("/no_List.do")
	public ModelAndView noList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "findKey", required = false, defaultValue = "") String findKey,
			@RequestParam(value = "findValue", required = false, defaultValue = "") String findValue) {
		int totalCnt = noticeDao.noTotal(findKey, findValue);
		int listSize = 5;
		int pageSize = 5;
		String no_page = paging1.makePage("no_List.do", totalCnt, listSize, pageSize, cp, findKey, findValue);
		List<NoticeDTO> noList = noticeDao.noList(cp, listSize, findKey, findValue);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noList", noList);
		mav.addObject("no_page", no_page);
		mav.addObject("findValue", findValue);
		mav.addObject("findKey", findKey);
		mav.setViewName("service/Notice/no_List");
		return mav;
	}

	@RequestMapping(value = "/no_Write.do", method = RequestMethod.GET)
	public String noWriteForm() {
		return "service/Notice/no_Write";
	}

	private void copyInto(MultipartFile upload) {
		try {
			byte bytes[] = upload.getBytes();
			File newFile = new File(
					"C:/Users/socls/git/flamans/flamans/src/main/webapp/WEB-INF/views/service/Notice/upload/"
							+ upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/notice_Uplaod.do")
	public void notice_Uplaod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();
		String filePath = request.getRealPath("service_upload/notice_upload");
		String uploadPath = filePath + "/" + fileName;
		System.out.println(filePath);
		try {
			byte bytes[] = upload.getBytes();
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();
		String fileUrl = "service_upload/notice_upload/" + fileName;
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
				+ "','이미지를 업로드 했습니다.')</script>");
		printWriter.flush();
	}

	@RequestMapping(value = "/no_Write.do", method = RequestMethod.POST)
	public ModelAndView noWrite(NoticeDTO ndto, @RequestParam("upload") List<MultipartFile> upload,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		String filePath = request.getRealPath("service_upload/notice_upload");
		try {
			if (!upload.isEmpty()) {
				for (int i = 0; i < upload.size(); i++) {
					byte bytes[] = upload.get(i).getBytes();
					File newFile = new File(filePath + "/" + upload.get(i).getOriginalFilename());
					FileOutputStream fos = new FileOutputStream(newFile);
					fos.write(bytes);
					fos.close();
				}
				ndto.setNo_file1(upload.get(0).getOriginalFilename());
				ndto.setNo_file2(upload.get(1).getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		int result = noticeDao.noWrite(ndto);
		String msg = result > 0 ? "글쓰기가 완료되었습니다." : "글쓰기가 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "no_List.do");
		mav.setViewName("/service/Notice/no_Msg");
		return mav;
	}

	@RequestMapping("/no_Content.do")
	public ModelAndView noContent(@RequestParam(value = "idx", defaultValue = "0") int no_idx) {
		NoticeDTO ndto = noticeDao.noContent(no_idx);
		int count = noticeDao.noReadnum(no_idx);
		ModelAndView mav = new ModelAndView();
		if (ndto == null) {
			mav.addObject("msg", "삭제되었거나 잘못된 접근입니다.");
			mav.addObject("url", "no_List.do");
			mav.setViewName("/service/Notice/no_Msg");
			return mav;
		} else {
			ndto.setNo_content(ndto.getNo_content().replaceAll("\n", "<br>"));
			mav.addObject("ndto", ndto);
			mav.setViewName("service/Notice/no_Content");
			return mav;
		}
	}

	@RequestMapping("no_Delete.do")
	public ModelAndView noDelete(@RequestParam("idx") int no_idx) {
		int result = noticeDao.noDelete(no_idx);
		String msg = result > 0 ? "삭제가 완료되었습니다." : "삭제가 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "no_List.do");
		mav.setViewName("service/Notice/no_Msg");
		return mav;
	}

	@RequestMapping(value = "/no_Update.do", method = RequestMethod.GET)
	public ModelAndView noUpdateForm(@RequestParam("idx") int no_idx) {
		NoticeDTO ndto = noticeDao.noContent(no_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ndto", ndto);
		mav.setViewName("service/Notice/no_Update");
		return mav;
	}

	@RequestMapping(value = "/no_Update.do", method = RequestMethod.POST)
	public ModelAndView noUpdate(NoticeDTO ndto) {
		int result = noticeDao.noUpdate(ndto);
		String msg = result > 0 ? "수정이 완료되었습니다." : "수정이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "no_List.do");
		mav.setViewName("service/Notice/no_Msg");
		return mav;
	}

	@RequestMapping("no_down.do")
	public ModelAndView noDown(@RequestParam("no_file") String filename, HttpServletRequest request) {
		String filePath = request.getRealPath("service_upload/notice_upload");
		File f = new File(filePath + "/" + filename);
		ModelAndView mav = new ModelAndView("down", "downloadFile", f);
		return mav;
	}

}
