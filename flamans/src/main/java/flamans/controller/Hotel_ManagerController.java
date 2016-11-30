package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import flamans.hotel_find.model.HotelDTO;
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
	
	@RequestMapping("/hotelBbsContent.do")
	public ModelAndView hotelBbsContent(@RequestParam("qna_idx") int qna_idx){
		List<QnaDTO> list=hotmDao.hotelBbsContent(qna_idx);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "삭제된 게시글이거나 잘못된 접근입니다.");
			mav.addObject("url", "hotelBbsList.do");
			mav.setViewName("manager/Msg");
		}else{
			mav.addObject("list", list);
			mav.setViewName("manager/hotel/hotelBbsContent");
		}
		return mav;
	}
	
	@RequestMapping("/hotelBbsDelete.do")
	public ModelAndView hotelBbsDelete(@RequestParam("qna_idx") int qna_idx){
		int result=hotmDao.hotelBbsDelete(qna_idx);
		String msg=result>0?"삭제 성공 !":"삭제에 실패 했습니다 .";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelBbsList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hotelBbsReWrite.do",method=RequestMethod.GET)
	public ModelAndView hotelBbsReWriteForm(@RequestParam("qna_idx") int qna_idx){
		ModelAndView mav=new ModelAndView();
		QnaDTO dto=hotmDao.hotelBbsReWriteForm(qna_idx);
		mav.addObject("dto", dto);
		mav.setViewName("manager/hotel/hotelBbsReWrite");
		return mav;
	}
	
	@RequestMapping(value="/hotelBbsReWrite.do",method=RequestMethod.POST)
	public ModelAndView hotelBbsReWrite(QnaDTO dto){
		int result=hotmDao.hotelBbsReWrite(dto);
		String msg=result>0?"등록 성공":"등록 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelBbsList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	@RequestMapping("/hotelContent.do")
	public ModelAndView hotelContent(HttpSession session){
		List<HotelDTO> list=hotmDao.hotelContent((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/hotel/hotelContent");
		return mav;
	}
	
	@RequestMapping(value="/hotelAdd.do",method=RequestMethod.GET)
	public String hotelAddForm(){
		return "manager/hotel/hotelAdd";
	}
	
	public void copyinto(String writer,MultipartFile upload){
		try {
			byte bytes[]=upload.getBytes();
			File newFile=new File("/flamans/img/"+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/hotelAdd.do",method=RequestMethod.POST)
	public ModelAndView hotelAdd(@RequestParam("upload") MultipartFile upload,HotelDTO dto,HttpSession session){
		copyinto(dto.getHot_num(),upload);
		String img=upload.getOriginalFilename();
		dto.setHot_img(img);
		int result=hotmDao.hotelAdd(dto);
		String msg=result>0?"등록 성공":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg	);
		mav.addObject("url", "hotelContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hotelUpdate.do",method=RequestMethod.GET)
	public ModelAndView hotelUpdateForm(@RequestParam("hot_num") String hot_num){
		HotelDTO dto=hotmDao.hotelUpdateForm(hot_num);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<select name='hot_grade'>");
		for(int i=1;i<6;i++){
			sb.append("<option value='");
			sb.append(i);
			if(dto.getHot_grade()==i){
				sb.append("' selected='selected'>");
			}else{
				sb.append("' >");
			}
			sb.append(i);
			sb.append("성 </option>");
		}
		sb.append("</select>");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("option", sb.toString());
		mav.setViewName("manager/hotel/hotelUpdate");
		return mav;
	}
	
	@RequestMapping(value="/hotelUpdate.do", method=RequestMethod.POST)
	public ModelAndView hotelUpdate(HotelDTO dto,@RequestParam("upload") MultipartFile upload,HttpSession session){
		copyinto(dto.getHot_num(), upload);
		dto.setHot_img(upload.getOriginalFilename());
		int result=hotmDao.hotelUpdate(dto);
		String msg=result>0?"수정 성공ㅋ":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelDelete.do")
	public ModelAndView hotelDelet(@RequestParam("hot_num") String hot_num,HttpSession session){
		int result=hotmDao.hotelDelete(hot_num);
		String msg=result>0?"삭제성공ㅋ":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelContent.do?cm_number="+session.getAttribute("cm_number"));
		mav.setViewName("manager/Msg");
		return mav;
	}
	
}
