package flamans.manager.model;

import java.util.List;

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDTO;
import flamans.qna.model.QnaDTO;

public interface Hospital_ManagerDAO {

	public List<QnaDTO> hospitalBbsList(String cm_number);
	
	public List<QnaDTO> hospitalBbsContent(int qna_idx);
	
	public int hospitalBbsDelete(int qna_idx);
	
	public QnaDTO hospitalBbsReWriteForm(String cm_number,int qna_idx);
	
	public int hospitalBbsReWrite(QnaDTO dto);
	
	public List<HospitalDTO> hospitalContent(String cm_number);
	
	public int hospitalAdd(HospitalDTO dto);
	
	public int hospitalDelete(String hos_num);
	
	public List<DoctorDTO> doctorList(String hos_num);
	
	public int doctorAdd(DoctorDTO dto);
	
	public List<DoctorDTO> doctorContent(int doc_num, String hos_num);
	
	public DoctorDTO doctorUpdateForm(String doc_name,String hos_num);
	
	public int doctorUpdate(DoctorDTO dto);
	
	public int doctorDelete(String doc_name,String hos_num);
}
