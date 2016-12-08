package flamans.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.hos_find.model.DoctorDTO;
import flamans.hos_find.model.HospitalDTO;
import flamans.qna.model.QnaDTO;

public class Hospital_ManagerDAOImple implements Hospital_ManagerDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Hospital_ManagerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int hospitalBbsCnt(String cm_number) {
		int count=sqlMap.selectOne("companyBbsCnt", cm_number);
		return count;
	}

	public List<QnaDTO> hospitalBbsList(String cm_number, int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("qna_findname", cm_number);
		map.put("start", start);
		map.put("end", end);
		List<QnaDTO> list=sqlMap.selectList("companyBbsList", map);
		return list;
	}
	
	public List<QnaDTO> hospitalBbsContent(int qna_idx) {
		List<QnaDTO> list=sqlMap.selectList("hospitalBbsContent", qna_idx);
		sqlMap.update("qna_Readnum",qna_idx);
		return list;
	}
	
	public int hospitalBbsDelete(int qna_idx) {
		int count=sqlMap.delete("hospitalBbsContent", qna_idx);
		return count;
	}

	public QnaDTO hospitalBbsReWriteForm(int qna_idx) {
		QnaDTO dto=sqlMap.selectOne("hospitalBbsContent", qna_idx);
		return dto;
	}
	
	public int hospitalBbsReWrite(QnaDTO dto) {
		int count=sqlMap.insert("hospitalBbsReWrite",dto);
		return count;
	}
	
	public List<HospitalDTO> hospitalContent(String cm_number) {
		List<HospitalDTO> list=sqlMap.selectList("hospitalContent", cm_number);
		return list;
	}
	
	public int hospitalAdd(HospitalDTO dto) {
		int count=sqlMap.insert("hospitalAdd", dto);
		return count;
	}
	
	public HospitalDTO hospitalUpdateForm(String cm_number) {
		HospitalDTO dto=sqlMap.selectOne("hospitalContent", cm_number);
		return dto;
	}
	
	public int hospitalUpdate(HospitalDTO dto) {
		int count=sqlMap.update("hospitalUpdate", dto);
		return count;
	}
	
	public int hospitalDelete(String hos_num) {
		int count=sqlMap.delete("hospitalDelete", hos_num);
		return count;
	}
	
	public List<DoctorDTO> doctorList(String hos_num) {
		List<DoctorDTO> list=sqlMap.selectList("doctorList", hos_num);
		return list;
	}
	
	public int doctorAdd(DoctorDTO dto) {
		int count=sqlMap.insert("doctorAdd", dto);
		return count;
	}
	
	public List<DoctorDTO> doctorContent(int doc_num) {
		List<DoctorDTO> list=sqlMap.selectList("doctorContent", doc_num);
		return list;
	}
	
	public DoctorDTO doctorUpdateForm(int doc_num){
		DoctorDTO dto=sqlMap.selectOne("doctorContent", doc_num);
		return dto;
	}
	
	public int doctorUpdate(DoctorDTO dto) {
		int count=sqlMap.update("doctorUpdate", dto);
		return count;
	}

	public int doctorDelete(int doc_num){
		int count=sqlMap.delete("doctorDelete", doc_num);
		return count;
	}
}
