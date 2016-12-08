package flamans.manager.model;

import java.util.List;

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDTO;
import flamans.qna.model.QnaDTO;

public interface Hospital_ManagerDAO {

	public int hospitalBbsCnt(String cm_number);
	
	public List<QnaDTO> hospitalBbsList(String cm_number,int cp, int listSize);
	
	public List<QnaDTO> hospitalBbsContent(int qna_idx);
	
	public int hospitalBbsDelete(int qna_idx);
	
	public QnaDTO hospitalBbsReWriteForm(int qna_idx);
	
	public int hospitalBbsReWrite(QnaDTO dto);
	
	public List<HospitalDTO> hospitalContent(String cm_number);
	
	public int hospitalAdd(HospitalDTO dto);
	
	public HospitalDTO hospitalUpdateForm(String cm_number);
	
	public int hospitalUpdate(HospitalDTO dto);
	
	public int hospitalDelete(String hos_num);
	
	public List<DoctorDTO> doctorList(String hos_num);
	
	public int doctorAdd(DoctorDTO dto);
	
	public List<DoctorDTO> doctorContent(int doc_num);
	
	public DoctorDTO doctorUpdateForm(int doc_num);
	
	public int doctorUpdate(DoctorDTO dto);
	
	public int doctorDelete(int doc_num);
}
