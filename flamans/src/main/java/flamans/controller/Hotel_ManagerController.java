package flamans.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import flamans.hotel_find.model.HotelDTO;
import flamans.hotel_find.model.HotelRoomDTO;
import flamans.manager.model.Hotel_ManagerDAO;
import flamans.qna.model.QnaDTO;

@Controller
public class Hotel_ManagerController {

	@Autowired
	private Hotel_ManagerDAO hotmDao;
	
	@RequestMapping("/hotelBbsList.do")
	public ModelAndView hotelBbsList(HttpSession session,@RequestParam(value="cp",defaultValue="1") int cp){
		String cm_number=(String)session.getAttribute("cm_number");
		int totalCnt=hotmDao.hotelBbsCnt(cm_number);
		int listSize=10;
		int pageSize=5;
		List<QnaDTO> list=hotmDao.hotelBbsList(cm_number, cp, listSize);
		String hotBbsPage=flamans.paging.PageModule.makePage("hotelBbsList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("hotBbsPage", hotBbsPage);
		mav.setViewName("manager/hotel/hotelBbsList");
		return mav;
	}
	
	@RequestMapping("/hotelBbsContent.do")
	public ModelAndView hotelBbsContent(@RequestParam("qna_idx") int qna_idx){
		List<QnaDTO> list=hotmDao.hotelBbsContent(qna_idx);
		list.get(0).setQna_content(list.get(0).getQna_content().replaceAll("\n", "<br>"));
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
		hotmDao.updateSun(dto.getRef(), dto.getSunbun()+1);
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
		if(list!=null&&list.size()!=0){
			list.get(0).setHot_content(list.get(0).getHot_content().replaceAll("\n", "<br>"));
			String etc[]={"wifi","parking","restaurant","pool","fitness","laundry"};
			String result[]=list.get(0).getHot_etc().split(",");
			StringBuffer sb1=new StringBuffer();
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("wifi", "무료 와이파이");
			map.put("parking", "무료 주차장");
			map.put("restaurant", "레스토랑");
			map.put("pool", "실내 수영장");
			map.put("fitness", "피트니스");
			map.put("laundry", "세탁 서비스");
			for(int j=0;j<etc.length;j++){
				sb1.append("<input type='checkbox' name='hot_etc' value='");
				sb1.append(etc[j]);
				sb1.append("'");
				for(int k=0;k<result.length;k++){
					if(etc[j].equals(result[k])){
						sb1.append(" checked='checked'");
					}
				}
				sb1.append(">");
				sb1.append(map.get(etc[j]));
			}
			mav.addObject("etcs", sb1.toString());
		}
		
		mav.addObject("list", list);
		
		mav.setViewName("manager/hotel/hotelContent");
		return mav;
	}
	
	@RequestMapping(value="/hotelAdd.do",method=RequestMethod.GET)
	public String hotelAddForm(){
		return "manager/hotel/hotelAdd";
	}
	
	public void copyinto(String writer,MultipartFile upload, String path){
		try {
			
			byte bytes[]=upload.getBytes();
			File newFile=new File(path);
			if(!newFile.exists()){
				newFile.mkdirs();
			}
			newFile=new File(path+"/"+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/hotelAdd.do",method=RequestMethod.POST)
	public ModelAndView hotelAdd(@RequestParam("upload") MultipartFile upload,HotelDTO dto,HttpSession session){
		
		String path=session.getServletContext().getRealPath("img/hotel");
		copyinto(dto.getHot_num(),upload,path);
		String img=upload.getOriginalFilename();
		dto.setHot_img(img);
		int result=hotmDao.hotelAdd(dto);
		String msg=result>0?"등록 성공":"등록 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping(value="/hotelUpdate.do",method=RequestMethod.GET)
	public ModelAndView hotelUpdateForm(@RequestParam("hot_num") String hot_num){
		HotelDTO dto=hotmDao.hotelUpdateForm(hot_num);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<select name='hot_grade' class='form-control'>");
		for(int i=1;i<6;i++){
			sb.append("<option value='");
			sb.append(i);
			if(dto.getHot_grade()==i){
				sb.append("' selected='selected'>");
			}else{
				sb.append("' >");
			}
			sb.append(i);
			sb.append("등급 </option>");
		}
		sb.append("</select>");
		
		String etc[]={"wifi","parking","restaurant","pool","fitness","laundry"};
		String result[]=dto.getHot_etc().split(",");
		StringBuffer sb1=new StringBuffer();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("wifi", "무료 와이파이");
		map.put("parking", "무료 주차장");
		map.put("restaurant", "레스토랑");
		map.put("pool", "실내 수영장");
		map.put("fitness", "피트니스");
		map.put("laundry", "세탁 서비스");
		for(int j=0;j<etc.length;j++){
			sb1.append("<input type='checkbox' name='hot_etc' value='");
			sb1.append(etc[j]);
			sb1.append("'");
			for(int k=0;k<result.length;k++){
				if(etc[j].equals(result[k])){
					sb1.append(" checked='checked'");
				}
			}
			sb1.append(">");
			sb1.append(map.get(etc[j]));
		}

		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("grade", sb.toString());
		mav.addObject("etcs", sb1.toString());
		mav.setViewName("manager/hotel/hotelUpdate");
		return mav;
	}
	
	@RequestMapping(value="/hotelUpdate.do", method=RequestMethod.POST)
	public ModelAndView hotelUpdate(HotelDTO dto,@RequestParam("upload") MultipartFile upload,HttpSession session){
		if(!upload.getOriginalFilename().equals("")){
			String path=session.getServletContext().getRealPath("img/hotel");
			copyinto(dto.getHot_num(), upload,path);
			dto.setHot_img(upload.getOriginalFilename());
		}
		int result=hotmDao.hotelUpdate(dto);
		String msg=result>0?"수정 성공":"수정 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelContent.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelDelete.do")
	public ModelAndView hotelDelet(@RequestParam("hot_num") String hot_num,HttpSession session){
		int result=hotmDao.hotelDelete(hot_num);
		String msg=result>0?"삭제성공":"삭제 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelContent.do?cm_number="+session.getAttribute("cm_number"));
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotAddrFind.do")
	public String hotelAddrFind(){
		return "manager/hotel/hotelAddrFind";
	}
	
	@RequestMapping("/hotelRoomList.do")
	public ModelAndView hotelRoomList(HttpSession session,@RequestParam(value="cp",defaultValue="1") int cp){
		String cm_number=(String)session.getAttribute("cm_number");
		int totalCnt=hotmDao.hotelRoomCnt(cm_number);
		int listSize=10;
		int pageSize=5;
		List<HotelRoomDTO> list=hotmDao.hotelRoomList(cm_number, cp, listSize);
		String hotelRoomPage=flamans.paging.PageModule.makePage("hotelRoomList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("hotelRoomPage", hotelRoomPage);
		mav.setViewName("manager/hotel/hotelRoomList");
		return mav;
	}
	
	@RequestMapping(value="/hotelRoomAdd.do",method=RequestMethod.GET)
	public String hotelRoomAddForm(HttpSession session){
		return "manager/hotel/hotelRoomAdd";
	}
	
	@RequestMapping(value="/hotelRoomAdd.do",method=RequestMethod.POST)
	public ModelAndView hotelRoomAdd(HotelRoomDTO dto){
		int result=hotmDao.hotelRoomAdd(dto);
		String msg=result>0?"등록 성공":"등록 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelRoomList.do");
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelRoomContent.do")
	public ModelAndView hotelRoomContent(int room_idx){
		List<HotelRoomDTO> list=hotmDao.hotelRoomContent(room_idx);
		ModelAndView mav=new ModelAndView();
		if(list==null||list.size()==0){
			mav.addObject("msg", "삭제된 방 정보 이거나 잘못된 접근입니다.");
			mav.addObject("url", "hotelRoomList.do");
			mav.setViewName("manager/Msg");
		}else{
			StringBuffer sb=new StringBuffer();
			String option[]={"breakfast","minibar","safebox","bath","morningcall"};
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("breakfast", "조식");
			map.put("minibar", "미니바");
			map.put("safebox", "안전금고");
			map.put("bath", "욕조");
			map.put("morningcall", "모닝콜서비스");
			String result[]=list.get(0).getRoom_option().split(",");
			for(int k=0;k<option.length;k++){
				
				sb.append("<input type='checkbox' name='room_option' value='");
				sb.append(option[k]);
				sb.append("'");
				for(int j=0;j<result.length;j++){
					if(option[k].equals(result[j])){
						sb.append(" checked='checked'");
					}
				}
				sb.append(">");
				sb.append(map.get(option[k]));
			}
			mav.addObject("list",list);
			mav.addObject("options", sb.toString());
			mav.setViewName("manager/hotel/hotelRoomContent");
		}
		return mav;
	}
	
	@RequestMapping(value="/hotelRoomUpdate.do",method=RequestMethod.GET)
	public ModelAndView hotelRoomUpdateForm(int room_idx){
		HotelRoomDTO dto=hotmDao.hotelRoomUpdateForm(room_idx);
		StringBuffer num=new StringBuffer();
		int cnum[]={1,2,4,6};
		int pnum=dto.getPeople_num();
		num.append("<select name='people_num' class='form-control'>");
		for(int i=0;i<cnum.length;i++){
			num.append("<option value='");
			num.append(cnum[i]);
			num.append("'");
			if(cnum[i]==pnum){
				num.append(" selected='selected'");
			}
			num.append(">");
			String temp=cnum[i]+"명";
			num.append(temp);
		}
		num.append("</select>");
		StringBuffer sb=new StringBuffer();
		String option[]={"breakfast","minibar","safebox","bath","morningcall"};
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("breakfast", "조식");
		map.put("minibar", "미니바");
		map.put("safebox", "안전금고");
		map.put("bath", "욕조");
		map.put("morningcall", "모닝콜서비스");
		String result[]=dto.getRoom_option().split(",");
		for(int k=0;k<option.length;k++){
			
			sb.append("<input type='checkbox' name='room_option' value='");
			sb.append(option[k]);
			sb.append("'");
			for(int j=0;j<result.length;j++){
				if(option[k].equals(result[j])){
					sb.append(" checked='checked'");
				}
			}
			sb.append(">");
			sb.append(map.get(option[k]));
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("options", sb.toString());
		mav.addObject("num", num.toString());
		mav.setViewName("manager/hotel/hotelRoomUpdate");
		return mav;
	}
	
	@RequestMapping(value="/hotelRoomUpdate.do",method=RequestMethod.POST)
	public ModelAndView hotelRoomUpdate(HotelRoomDTO dto){
		int result=hotmDao.hotelRoomUpdate(dto);
		String msg=result>0?"수정 성공":"수정 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelRoomContent.do?room_idx="+dto.getRoom_idx());
		mav.setViewName("manager/Msg");
		return mav;
	}
	
	@RequestMapping("/hotelRoomDelete.do")
	public ModelAndView hotelRoomDelete(int room_idx){
		int result=hotmDao.hotelRoomDelete(room_idx);
		String msg=result>0?"삭제 성공":"삭제 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hotelRoomList.do");
		mav.setViewName("manager/Msg");
		return mav;
		
	}
}
