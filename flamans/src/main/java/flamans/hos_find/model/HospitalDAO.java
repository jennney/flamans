package flamans.hos_find.model;

import java.util.HashMap;
import java.util.List;

import flamans.hotel_find.model.HotelDTO;

public interface HospitalDAO {
	
	public List<HospitalDTO> hospital_list(int cp, int listSize);
	public List<HospitalDTO> hospital_get_info(String num);
	public List<HospitalDTO> hospital_search_name(HashMap<String, Object> map);
	public List<HospitalDTO> hospital_sub_search(String m_sb, String hos_find_name, int cp, int listsize);
	
	
	public int getSubTotalCnt(String sub_sql, String hos_find_name);
	
	
	public List<DoctorDTO> hospital_doclist(String num);
	public List<DoctorDTO> hospital_docinfo(int num);
	public void add_memberFind(String memberfind, String id);
	
	public String get_hosdate();
	
	public int memberUpdateWishlist(String wishlist, String m_id);
	
}
