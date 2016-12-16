package flamans.controller;

import java.io.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import flamans.hos_find.model.HospitalDTO;
import flamans.hotel_find.model.HotelDTO;
import flamans.paging.PageModule1;
import flamans.qna.model.QnaDAO;
import flamans.qna.model.QnaDTO;

@Controller
public class QnaController {


	@Autowired
	private PageModule1 paging1;

	@Autowired
	private QnaDAO qnaDao;
	
	public static String decode(String arg, String compare, String replace, String delimiter)
	{	
		String[] sp_compare = compare.split("["+delimiter+"]");
		String[] sp_replace = replace.split("["+delimiter+"]");
		
		for(int inx = 0, max = sp_compare.length; inx < max; inx++)
		{
			if(arg.equals(sp_compare[inx]))
			{
				return sp_replace[inx];
			}
		}
		
		return arg;
	}

	@RequestMapping("/qna_List.do")
	public ModelAndView qnaList(@RequestParam("qna_kind") String qna_kind,
			@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "qna_item", required = false, defaultValue = "") String qna_item,
			@RequestParam(value = "findKey", required = false, defaultValue = "") String findKey,
			@RequestParam(value = "findValue", required = false, defaultValue = "") String findValue) {
		int totalCnt = qnaDao.qnaTotal(qna_kind, qna_item,findKey,findValue);
		int listSize = 10;
		int pageSize = 5;
		String qna_page = paging1.makePage("qna_List.do", totalCnt, listSize, pageSize, cp, findKey, findValue,qna_kind);
		List<QnaDTO> qnaList = qnaDao.qnaList(qna_kind, cp, listSize, qna_item,findKey, findValue);
		for(int i=0;i<qnaList.size();i++){
			qnaList.get(i).setQna_item(decode(qnaList.get(i).getQna_item(), "meminfo|memgroup|tieup|cosmetic|hosbooking|hotbooking|room|etc","회원정보|단체회원|제휴문의|성형문의|예약문의|예약문의|룸문의|기타","|"));
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		mav.addObject("qna_kind", qna_kind);
		mav.addObject("qna_page", qna_page);
		mav.addObject("qna_item",qna_item);
		mav.addObject("findKey", findKey);
		mav.addObject("findValue", findValue);
		mav.setViewName("service/QNA/qna_List");
		return mav;
	}
	
	@RequestMapping("/qna_List_admin.do")
	public ModelAndView qnaListAdmin(@RequestParam("qna_kind") String qna_kind,
			@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "qna_item", required = false, defaultValue = "") String qna_item,
			@RequestParam(value = "findKey", required = false, defaultValue = "") String findKey,
			@RequestParam(value = "findValue", required = false, defaultValue = "") String findValue) {
		int totalCnt = qnaDao.qnaTotal(qna_kind, qna_item,findKey,findValue);
		int listSize = 10;
		int pageSize = 5;
		String qna_page = paging1.makePage("qna_List_admin.do", totalCnt, listSize, pageSize, cp, findKey, findValue,qna_kind);
		List<QnaDTO> qnaList = qnaDao.qnaList(qna_kind, cp, listSize, qna_item,findKey, findValue);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		mav.addObject("qna_kind", qna_kind);
		mav.addObject("qna_page", qna_page);
		mav.addObject("qna_item",qna_item);
		mav.addObject("findKey", findKey);
		mav.addObject("findValue", findValue);
		mav.setViewName("service/QNA/qna_List_admin");
		return mav;
	}

	@RequestMapping(value = "/qna_Write.do", method = RequestMethod.GET)
	public ModelAndView qnaWriteForm(@RequestParam("qna_kind") String qna_kind) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna_kind", qna_kind);
		mav.setViewName("service/QNA/qna_Write");
		return mav;
	}

	@RequestMapping(value = "/qna_Write.do", method = RequestMethod.POST)
	public ModelAndView qnaWrite(QnaDTO qdto, @RequestParam("qna_kind") String qna_kind) {

		int maxref = qnaDao.qnaMaxref();
		qdto.setRef(maxref + 1);
		int result = qnaDao.qnaWrite(qdto);
		String msg = result > 0 ? "질문이 등록되었습니다." : "질문등록이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "qna_List.do?qna_kind=" + qna_kind);
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}

	@RequestMapping("/qna_Content.do")
	public ModelAndView qnaContent(@RequestParam("qna_idx") int qna_idx) {
		QnaDTO qdto = qnaDao.qnaContent(qna_idx);
		int count = qnaDao.qnaReadnum(qna_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto", qdto);
		mav.setViewName("service/QNA/qna_Content");
		return mav;
	}
	
	@RequestMapping("/qna_Content_admin.do")
	public ModelAndView qnaContentAdmin(@RequestParam("qna_idx") int qna_idx) {
		QnaDTO qdto = qnaDao.qnaContent(qna_idx);
		int count = qnaDao.qnaReadnum(qna_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto", qdto);
		mav.setViewName("service/QNA/qna_Content_admin");
		return mav;
	}

	@RequestMapping(value = "/qna_PwdContent.do", method = RequestMethod.GET)
	public ModelAndView qnaPwdContentForm(@RequestParam("qna_idx") int qna_idx,
			@RequestParam("qna_kind") String qna_kind) {
		String dbpwd = qnaDao.qnaPwd(qna_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna_idx", qna_idx);
		mav.addObject("qna_kind", qna_kind);
		mav.addObject("dbpwd", dbpwd);
		mav.setViewName("service/QNA/qna_PwdContent");
		return mav;
	}

	@RequestMapping(value = "/qna_PwdContent.do", method = RequestMethod.POST)
	public ModelAndView qnaPwdContent(@RequestParam("qna_idx") int qna_idx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "등록된 질문으로 넘어갑니다.");
		mav.addObject("url", "qna_Content.do?qna_idx=" + qna_idx);
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}

	@RequestMapping(value = "/qna_Update.do", method = RequestMethod.GET)
	public ModelAndView qnaUpdateForm(@RequestParam(value = "qna_idx") int qna_idx) {
		QnaDTO qdto = qnaDao.qnaContent(qna_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto", qdto);
		mav.setViewName("service/QNA/qna_Update");
		return mav;
	}

	@RequestMapping(value = "/qna_Update.do", method = RequestMethod.POST)
	public ModelAndView qnaUpdate(QnaDTO qdto, @RequestParam("qna_kind") String qna_kind) {
		int result = qnaDao.qnaUpdate(qdto);
		String msg = result > 0 ? "질문수정이 완료되었습니다." : "질문수정이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "qna_List.do?qna_kind=" + qna_kind);
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}

	@RequestMapping("/qna_Uplaod.do")
	public void qna_Uplaod(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();
		String filePath = request.getRealPath("service_upload/qna_upload");
		String uploadPath = filePath + "/" + fileName;
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
		String fileUrl = "service_upload/qna_upload/" + fileName;
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
				+ "','이미지를 업로드 했습니다.')</script>");
		printWriter.flush();
	}

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String qna_SearchForm() {
		return "service/QNA/qna_search";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.POST)
	public ModelAndView qna_Search(@RequestParam("name")String name) {
		ModelAndView mav = new ModelAndView();
		List<HotelDTO> list = qnaDao.hot_Search(name);
		mav.addObject("hot_list",list);
		mav.setViewName("service/QNA/qna_search");
		return mav;
	}
	@RequestMapping(value = "/search_hos.do", method = RequestMethod.GET)
	public String qna_Search_hosForm() {
		return "service/QNA/qna_search_hos";
	}
	
	@RequestMapping(value = "/search_hos.do", method = RequestMethod.POST)
	public ModelAndView qna_Searchhos(@RequestParam("name")String name) {
		ModelAndView mav = new ModelAndView();
		List<HospitalDTO> list = qnaDao.hos_Search(name);
		mav.addObject("hos_list",list);
		mav.setViewName("service/QNA/qna_search_hos");
		return mav;
	}

	@RequestMapping("/qna_ReWrite.do")
	public ModelAndView qna_ReWrite(QnaDTO qdto) {
		int lev = qdto.getLev() + 1;
		int sunbun = qdto.getSunbun() + 1;
		int ref = qdto.getRef();
		qdto.setLev(lev);
		qdto.setSunbun(sunbun);
		int count = qnaDao.qnaSunbun(ref, sunbun);
		int result = qnaDao.qnaReWrite(qdto);
		String msg = result > 0 ? "답변 등록이 완료되었습니다." : "답변 등록이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "qna_List_admin.do?qna_kind=" + qdto.getQna_kind());
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}

	@RequestMapping("/qna_Delete.do")
	public ModelAndView qna_Delete(@RequestParam("qna_idx") int qna_idx, @RequestParam("qna_kind") String qna_kind) {
		int result = qnaDao.qnaDelete(qna_idx);
		String msg = result > 0 ? "질문이 삭제되었습니다." : "질문삭제가 실패하였습니다";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "qna_List_admin.do?qna_kind=" + qna_kind);
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}
}
