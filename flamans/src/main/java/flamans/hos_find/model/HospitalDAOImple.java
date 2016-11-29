package flamans.hos_find.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class HospitalDAOImple implements HospitalDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public HospitalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<HospitalDTO> hospital_list() {
		List<HospitalDTO> list = sqlMap.selectList("hospital_list");
		return list;
	}
	
	public List<HospitalDTO> hospital_search_name(HashMap<String, Object> map) {
		List<HospitalDTO> list = sqlMap.selectList("hospital_search_name", map);
		return list;
	}
	
	public List<HospitalDTO> hospital_get_info(String num) {
		List<HospitalDTO> list = sqlMap.selectList("hospital_get_info", num);
		return list;
	}
	
	public List<DoctorDTO> hospital_doclist(String num) {
		List<DoctorDTO> list = sqlMap.selectList("hospital_doclist",num);
		return list;
	}

}
