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

	public List<QnaDTO> hospitalBbsList(String cm_number) {
		List<QnaDTO> list=sqlMap.selectList("hospitalBbsList", cm_number);
		return list;
	}
	
	public List<QnaDTO> hospitalBbsContent(int qna_idx) {
		List<QnaDTO> list=sqlMap.selectList("hospitalBbsContent",qna_idx);
		return list;
	}
	
	public int hospitalBbsDelete(int qna_idx) {
		int count=sqlMap.delete("hospitalBbsContent", qna_idx);
		return count;
	}

	public QnaDTO hospitalBbsReWriteForm(String cm_number, int qna_idx) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cm_number", cm_number);
		map.put("qna_idx", qna_idx);
		QnaDTO dto=sqlMap.selectOne("hospitalBbsContent", map);
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
	
	public List<DoctorDTO> doctorContent(String doc_name,String hos_num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("doc_name", doc_name);
		map.put("hos_num", hos_num);
		List<DoctorDTO> list=sqlMap.selectList("doctorContent", map);
		return list;
	}
	
	public DoctorDTO doctorUpdateForm(String doc_name, String hos_num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("doc_name", doc_name);
		map.put("hos_num", hos_num);
		DoctorDTO dto=sqlMap.selectOne("doctorContent", map);
		return dto;
	}
	
	public int doctorUpdate(DoctorDTO dto) {
		int count=sqlMap.update("doctorUpdate", dto);
		return count;
	}

	public int doctorDelete(String doc_name, String hos_num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("doc_name", doc_name);
		map.put("hos_num", hos_num);
		int count=sqlMap.delete("doctorDelete", map);
		return count;
	}
}
