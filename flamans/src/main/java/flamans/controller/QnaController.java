package flamans.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flamans.paging.PageModule;
import flamans.qna.model.QnaDAO;
import flamans.qna.model.QnaDTO;

@Controller
public class QnaController {
	
	@Autowired
	private PageModule paging;
	
	@Autowired
	private QnaDAO qnaDao;
	
	@RequestMapping("/qna_List.do")
	public ModelAndView qnaList(@RequestParam("qna_kind")String qna_kind){
		List<QnaDTO> qnaList = qnaDao.qnaList(qna_kind);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		mav.setViewName("service/QNA/qna_List");
		return mav;
	}
	
	@RequestMapping(value="/qna_Write.do",method=RequestMethod.GET)
	public ModelAndView qnaWriteForm(@RequestParam("qna_kind")String qna_kind){
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna_kind",qna_kind);
		mav.setViewName("service/QNA/qna_Write");
		return mav;
	}
	
	@RequestMapping(value="/qna_Write.do",method=RequestMethod.POST)
	public ModelAndView qnaWrite(QnaDTO qdto){
		int result = qnaDao.qnaWrite(qdto);
		String msg = result>0?"질문이 등록되었습니다.":"질문등록이 실패되었습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","qna_List.do");
		mav.setViewName("service/QNA/qna_Msg");
		return mav;
	}
	
}
