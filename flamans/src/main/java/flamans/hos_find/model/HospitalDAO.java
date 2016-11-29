package flamans.hos_find.model;

import java.util.HashMap;
import java.util.List;

public interface HospitalDAO {
	
	public List<HospitalDTO> hospital_list();
	public List<HospitalDTO> hospital_get_info(String num);
	public List<HospitalDTO> hospital_search_name(HashMap<String, Object> map);
	public List<DoctorDTO> hospital_doclist(String num);
}
