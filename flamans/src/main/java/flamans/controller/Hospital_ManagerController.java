package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
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
	public ModelAndView hospitalBbsList(HttpSession session,@RequestParam(value = "cp", defaultValue = "1") int cp){
		String cm_number=(String)session.getAttribute("cm_number");
		int totalCnt=hosmDao.hospitalBbsCnt(cm_number);
		int listSize=10;
		int pageSize=5;
		String hosBbsPage=flamans.paging.PageModule.makePage("hospitalBbsList.do", totalCnt, listSize, pageSize, cp);
		List<QnaDTO> list=hosmDao.hospitalBbsList(cm_number, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("hosBbsPage", hosBbsPage);
		mav.setViewName("manager/hospital/hospitalBbsList");
		return mav;
	}
	
	
	@RequestMapping("/hospitalBbsContent.do")
	public ModelAndView hospitalBbsContent(@RequestParam("qna_idx") int qna_idx){
		List<QnaDTO> list=hosmDao.hospitalBbsContent(qna_idx);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "삭제된 게시글이거나 잘못된 접근입니다.");
			mav.addObject("url","hospitalBbsList.do");
			mav.setViewName("manager/Msg");
		}else{
			list.get(0).setQna_content(list.get(0).getQna_content().replaceAll("\n", "<br>"));
			mav.addObject("list", list);
			mav.setViewName("manager/hospital/hospitalBbsContent");
		}
		return mav;
	}
	
	@RequestMapping("/hospitalBbsDelete.do")
	public ModelAndView hospitalBbsDelete(int qna_idx){
		int result=hosmDao.hospitalBbsDelete(qna_idx);
		String msg=result>0?"삭제 성공":"삭제 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalBbsList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hospitalBbsReWrite.do", method=RequestMethod.GET)
	public ModelAndView hospitalBbsReWriteForm(@RequestParam("qna_idx") int qna_idx){
		QnaDTO dto=hosmDao.hospitalBbsReWriteForm(qna_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("manager/hospital/hospitalBbsReWrite");
		return mav;
	}
	
	@RequestMapping(value="/hospitalBbsReWrite.do",method=RequestMethod.POST)
	public ModelAndView hospitalBbsReWrite(QnaDTO dto){
		hosmDao.updateSun(dto.getRef(), dto.getSunbun()+1);
		int result=hosmDao.hospitalBbsReWrite(dto);
		String msg=result>0?"등록 성공":"등록 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalBbsList.do");
		mav.setViewName("manager/Msg");
		return mav;
		
	}

	@RequestMapping("/hospitalContent.do")
	public ModelAndView hospitalContent(HttpSession session){
		List<HospitalDTO> list=hosmDao.hospitalContent((String)session.getAttribute("cm_number"));
		ModelAndView mav=new ModelAndView();
		if(list!=null&&list.size()!=0){
			list.get(0).setHos_content(list.get(0).getHos_content().replaceAll("\n", "<br>"));
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("face", "안면윤곽");
			map.put("bimaxillary", "양약수술");
			map.put("eyes", "눈 성형");
			map.put("nose", "코 성형");
			map.put("man", "남성 성형");
			
			
			mav.addObject("list", list);
			mav.addObject("sp", map.get(list.get(0).getHos_special()));
		}
		mav.setViewName("manager/hospital/hospitalContent");
		return mav;
	}
	
	@RequestMapping(value="/hospitalAdd.do",method=RequestMethod.GET)
	public String hospitalAddForm(){
		return "manager/hospital/hospitalAdd";
	}
	
	public void copyinto(String writer,MultipartFile upload,int i,String path){
		try {
			byte bytes[]=upload.getBytes();
			File newFile=new File(path+"/"+writer);
			if(!newFile.exists()){
				newFile.mkdirs();
			}
			
			if(i==1){
				newFile=new File(path+"/"+writer+"/"+upload.getOriginalFilename());
			}else if(i==2){
			
				newFile=new File(path+"/"+writer+"/doctor/");
				if(!newFile.exists()){
					newFile.mkdirs();
				}
				newFile=new File(path+"/"+writer+"/doctor/"+upload.getOriginalFilename());
			}
			FileOutputStream fos=new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/hospitalAdd.do",method=RequestMethod.POST)
	public ModelAndView hospitalAdd(HospitalDTO dto,@RequestParam("upload") MultipartFile upload,HttpSession session){
		String path=session.getServletContext().getRealPath("img/hospital");
		copyinto(dto.getHos_num(), upload,1,path);
		dto.setHos_img(upload.getOriginalFilename());
		int result=hosmDao.hospitalAdd(dto);
		String msg=result>0?"등록 성공":"등록 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hospitalUpdate.do",method=RequestMethod.GET)
	public ModelAndView hospitalUpdateForm(HttpSession session){
		String cm_number=(String)session.getAttribute("cm_number");
		HospitalDTO dto=hosmDao.hospitalUpdateForm(cm_number);
		StringBuffer sb=new StringBuffer();
		String special[]={"face","bimaxillary","eyes","nose","man"};
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("face", "안면윤곽");
		map.put("bimaxillary", "양약수술");
		map.put("eyes", "눈 성형");
		map.put("nose", "코 성형");
		map.put("man", "남성 성형");
		String sp=dto.getHos_special();
		sb.append("<select name='hos_special'>");
		for(int i=0;i<special.length;i++){
			sb.append("<option value='");
			sb.append(special[i]);
			sb.append("'");
			if(special[i].equals(sp)){
				sb.append(" selected='selected'");
			}
			sb.append(">");
			sb.append(map.get(special[i]));
		}
		sb.append("</select>");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("sp", sb.toString());
		mav.setViewName("manager/hospital/hospitalUpdate");
		return mav;
	}
	
	@RequestMapping(value="/hospitalUpdate.do",method=RequestMethod.POST)
	public ModelAndView hospitalUpdate(@RequestParam("upload") MultipartFile upload,HospitalDTO dto,HttpSession session){
		if(!upload.getOriginalFilename().equals("")){
			String path=session.getServletContext().getRealPath("img/hospital");
			copyinto(dto.getHos_num(), upload,1,path);
			dto.setHos_img(upload.getOriginalFilename());
		}
		int result=hosmDao.hospitalUpdate(dto);
		String msg=result>0?"수정 성공":"수정 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hospitalContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hospitalDelete.do")
	public ModelAndView hospitalDelete(String hos_num){
		List<DoctorDTO> list=hosmDao.doctorList(hos_num);
		String msg="";
		if(list==null||list.size()==0){
			int result=hosmDao.hospitalDelete(hos_num);
			msg=result>0?"삭제성공":"ㅋㅋㅋㅋㅋㅋㅋ";
		}else{
			msg="의사 정보를 먼저 삭제 해야합니다.";
		}
		
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
	public ModelAndView doctorAddForm(HttpSession session){
		String cm_number=(String)session.getAttribute("cm_number");
		List<HospitalDTO> list=hosmDao.hospitalContent(cm_number);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "병원 정보를 우선 등록해야 합니다.");
			mav.addObject("url", "doctorList.do");
			mav.setViewName("manager/Msg");
		}else{
			mav.setViewName("manager/hospital/doctorAdd");
		}
		return mav;
	}
	
	@RequestMapping(value="/doctorAdd.do",method=RequestMethod.POST)
	public ModelAndView doctorAdd(DoctorDTO dto,@RequestParam("upload") MultipartFile upload,HttpSession session){
		String path=session.getServletContext().getRealPath("img/hospital");
		copyinto(dto.getHos_num(), upload,2,path);
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
	public ModelAndView doctorContent(@RequestParam("doc_num") int doc_num){
		List<DoctorDTO> list=hosmDao.doctorContent(doc_num);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "삭제된 의사 정보 이거나 잘못된 접근입니다.");
			mav.addObject("url", "doctorList.do");
			mav.setViewName("manager/Msg");
		}else{
			list.get(0).setDoc_career(list.get(0).getDoc_career().replaceAll("\n", "<br>"));
			mav.addObject("list", list);
			mav.setViewName("manager/hospital/doctorContent");
		}
		return mav;
	}
	
	@RequestMapping(value="/doctorUpdate.do",method=RequestMethod.GET)
	public ModelAndView doctorUpdateForm(@RequestParam("doc_num") int doc_num){
		DoctorDTO dto=hosmDao.doctorUpdateForm(doc_num);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("manager/hospital/doctorUpdate");
		return mav;
	}
	
	@RequestMapping(value="/doctorUpdate.do",method=RequestMethod.POST)
	public ModelAndView doctorUpdate(DoctorDTO dto,@RequestParam("upload") MultipartFile upload,HttpSession session){
		if(upload.getOriginalFilename()!=null){
			String path=session.getServletContext().getRealPath("img/hospital");
			copyinto(dto.getHos_num(), upload,2,path);
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
	public ModelAndView doctorDelete(@RequestParam("doc_num") int doc_num){
		int result=hosmDao.doctorDelete(doc_num);
		String msg=result>0?"삭제 성공":"삭제 실패 ㅠ";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "doctorList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/addrFind.do")
	public String addrFindForm(){
		return "manager/hospital/addrFind";
	}
}
