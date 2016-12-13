package flamans.hos_find.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

import flamans.hotel_find.model.HotelDTO;

public class HospitalDAOImple implements HospitalDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public HospitalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("hospital_totalCnt");
		return count==0?1:count;
	}
	
	public int getSubTotalCnt(String sub_sql, String hos_find_name) {
		Map<String, Object> map = new HashedMap();
		map.put("m_sb",	sub_sql);
		map.put("find", hos_find_name);
		int count=sqlMap.selectOne("hospital_sub_totalCnt",map);
		System.out.println("count======================"+count);
		return count==0?1:count;
	}
	
	public List<HospitalDTO> hospital_list(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		
		List<HospitalDTO> list = sqlMap.selectList("hospital_list",map);
		return list;
	}
	
	public List<HospitalDTO> hospital_sub_search(String m_sb, String hos_find_name, int cp, int listsize) {
		int start = (cp-1)*listsize+1;
		int end = cp*listsize;
		Map<String, Object> map = new HashedMap();
		map.put("m_sb",	m_sb);
		map.put("start", start);
		map.put("end", end);
		map.put("find", hos_find_name);
		
		System.out.println("m_sb = "+m_sb);
		List<HospitalDTO> list = sqlMap.selectList("hospital_sub_search",map);
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
	
	public List<DoctorDTO> hospital_docinfo(int num) {
		// TODO Auto-generated method stub
		List<DoctorDTO> list = sqlMap.selectList("hospital_docinfo",num);
		return list;
	}
	
	public int memberUpdateWishlist(String wishlist, String m_id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id",	m_id);
		map.put("m_wishlist", wishlist);
		
		int count=sqlMap.update("update_wishlist",map);
				
		return count;
	}
	
	public void add_memberFind(String memberfind, String id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id",	id);
		map.put("m_history", memberfind);
		
		sqlMap.update("add_memberFind", map);
		
	}
	
	public String get_hosdate() {
		String write_date = sqlMap.selectOne("get_date");
		return write_date;
	}

}
