package flamans.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import flamans.manager.model.Hotel_ManagerDAO;
import flamans.qna.model.QnaDTO;

@Controller
public class Hotel_ManagerController {

	@Autowired
	private Hotel_ManagerDAO hotmDao;
	
	@RequestMapping("/hotelBbsList.do")
	public ModelAndView hotelBbsList(HttpSession session){
		List<QnaDTO> list=hotmDao.hotelBbsList((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/hotel/hotelBbsList");
		return mav;
	}
}
