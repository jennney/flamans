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

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDTO;
import flamans.manager.model.Hospital_ManagerDAO;
import flamans.qna.model.*;


@Controller
public class Hospital_ManagerController {
	
	
	@Autowired
	private Hospital_ManagerDAO hosmDao;
	
	@RequestMapping("/hospitalBbsList.do")
	public ModelAndView hospitalBbsList(HttpSession session){
		
		List<QnaDTO> list=hosmDao.hospitalBbsList((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/hospital/hospitalBbsList");
		return mav;
	}
	
	@RequestMapping("/hospitalBbsContent.do")
	public ModelAndView hospitalBbsContent(@RequestParam("qna_idx") int qna_idx){
		List<QnaDTO> list=hosmDao.hospitalBbsContent(qna_idx);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg","삭제된 게시글이거나 잘못된 접근입니다.");
			mav.addObject("url", "hosptalBbsList.do");
			mav.setViewName("manager/Msg");
			return mav;
		}else{
			mav.addObject("list", list);
			mav.setViewName("manager/hospital/hospitalBbsContent");
			return mav;
		}
	}
	
	@RequestMapping("/hospitalBbsDelete")
	public ModelAndView hospitalBbsDelete(int qna_idx){
		int result=hosmDao.hospitalBbsDelete(qna_idx);
		String msg=result>0?"삭제 성공":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg	);
		mav.addObject("url", "hospitalBbsList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hospitalBbsReWrite.do", method=RequestMethod.GET)
	public ModelAndView hospitalBbsReWriteForm(@RequestParam("cm_number") String cm_number,@RequestParam("qna_idx") int qna_idx){
		QnaDTO dto=hosmDao.hospitalBbsReWriteForm(cm_number, qna_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("manager/hospital/hospitalBbsReWrite");
		return mav;
	}
	
	@RequestMapping(value="/hospitalBbsReWrite.do",method=RequestMethod.POST)
	public ModelAndView hospitalBbsReWrite(QnaDTO dto){
		int result=hosmDao.hospitalBbsReWrite(dto);
		String msg=result>0?"일단 등록 성공":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalBbsLIst.do");
		mav.setViewName("manager/Msg");
		return mav;
		
	}

	@RequestMapping("/hospitalContent.do")
	public ModelAndView hospitalContent(HttpSession session){
		List<HospitalDTO> list=hosmDao.hospitalContent((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/hospital/hospitalContent");
		return mav;
	}
	
	@RequestMapping(value="/hospitalAdd.do",method=RequestMethod.GET)
	public String hospitalAddForm(){
		return "manager/hospital/hospitalAdd";
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
	
	@RequestMapping(value="/hospitalAdd.do",method=RequestMethod.POST)
	public ModelAndView hospitalAdd(HospitalDTO dto,@RequestParam("upload") MultipartFile upload){
		copyinto(dto.getHos_num(), upload);
		dto.setHos_img(upload.getOriginalFilename());
		int result=hosmDao.hospitalAdd(dto);
		String msg=result>0?"등록 성공":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hospitalDelete.do")
	public ModelAndView hospitalDelete(String hos_num){
		int result=hosmDao.hospitalDelete(hos_num);
		String msg=result>0?"삭제성공":"ㅋㅋㅋㅋㅋㅋㅋ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/doctorList.do")
	public ModelAndView doctorList(HttpSession session){
		List<DoctorDTO> list=hosmDao.doctorList((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("manager/hospital/doctorList");
		return mav;
	}
	
	@RequestMapping(value="/doctorAdd.do",method=RequestMethod.GET)
	public String doctorAddForm(){
		return "manager/hospital/doctorAdd";
	}
	
	@RequestMapping(value="/doctorAdd.do",method=RequestMethod.POST)
	public ModelAndView doctorAdd(DoctorDTO dto,@RequestParam("upload") MultipartFile upload){
		copyinto(dto.getHos_num(), upload);
		dto.setDoc_img(upload.getOriginalFilename());
		int result=hosmDao.doctorAdd(dto);
		String msg=result>0?"등록 성공":"등록 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "doctorList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/doctorContent.do")
	public ModelAndView doctorContent(@RequestParam("doc_name") String doc_name,@RequestParam("hos_num") String hos_num){
		List<DoctorDTO> list=hosmDao.doctorContent(doc_name, hos_num);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "삭제된 의사 정보 이거나 잘못된 접근입니다.");
			mav.addObject("url", "doctorList.do");
			mav.setViewName("manager/Msg");
		}else{
			mav.addObject("list", list);
			mav.setViewName("manager/hospital/doctorContent");
		}
		return mav;
	}
	
	@RequestMapping(value="/doctorUpdate.do",method=RequestMethod.GET)
	public ModelAndView doctorUpdateForm(@RequestParam("doc_name") String doc_name,@RequestParam("hos_num") String hos_num){
		DoctorDTO dto=hosmDao.doctorUpdateForm(doc_name, hos_num);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("manager/hospital/doctorUpdate");
		return mav;
	}
	
	@RequestMapping(value="/doctorUpdate.do",method=RequestMethod.POST)
	public ModelAndView doctorUpdate(DoctorDTO dto,@RequestParam("upload") MultipartFile upload){
		if(upload.getOriginalFilename()!=null){
			copyinto(dto.getHos_num(), upload);
			dto.setDoc_img(upload.getOriginalFilename());
		}
		int result=hosmDao.doctorUpdate(dto);
		String msg=result>0?"수정 성공":"수정 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "doctorList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/doctorDelete.do")
	public ModelAndView doctorDelete(@RequestParam("doc_name") String doc_name,@RequestParam("hos_num") String hos_num){
		int result=hosmDao.doctorDelete(doc_name, hos_num);
		String msg=result>0?"삭제 성공":"삭제 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "doctorList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
}
