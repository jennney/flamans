package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import flamans.page.model.PageDAO;
import flamans.page.model.PageDTO;

@Controller
public class PageController {

	@Autowired
	private PageDAO pageDao;

	@RequestMapping("/page_Write.do")
	public String page_WriteForm() {
		return "service/Page/page_Write";
	}

	@RequestMapping("/page1_Write.do")
	public ModelAndView page1_Write(@RequestParam("upload") MultipartFile upload, PageDTO pdto,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		String filepath = request.getRealPath("service_upload/page_upload");
		try {
			byte bytes[] = upload.getBytes();
			File newFile = new File(filepath + "/" + upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pdto.setPm_img(upload.getOriginalFilename());
		int result = pageDao.pageWrite(pdto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "사진이 변경되었습니다.");
		mav.addObject("url", "page_Write.do");
		mav.setViewName("service/Page/page_Msg");
		return mav;
	}

	@RequestMapping("/page2_Write.do")
	public ModelAndView page2_Write(@RequestParam("upload") MultipartFile upload, PageDTO pdto,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		String filepath = request.getRealPath("service_upload/page_upload");
		try {
			byte bytes[] = upload.getBytes();
			File newFile = new File(filepath + "/" + upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pdto.setPm_img(upload.getOriginalFilename());
		int result = pageDao.pageWrite(pdto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "사진이 변경되었습니다.");
		mav.addObject("url", "page_Write.do");
		mav.setViewName("service/Page/page_Msg");
		return mav;
	}

	@RequestMapping("/page_List.do")
	public ModelAndView pageList(@RequestParam("pm_item") String pm_item) {
		PageDTO pdto = pageDao.pageList(pm_item);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pdto", pdto);
		mav.setViewName("service/Page/page_List");
		return mav;
	}
}
