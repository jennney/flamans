package flamans.hotel_find.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

import flamans.hos_find.model.HospitalDTO;

public class HotelDAOImple implements HotelDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public HotelDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public String get_date() {
		String write_date = sqlMap.selectOne("get_date");
		return write_date;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("hotel_totalCnt");
		return count==0?1:count;
	}
	
	public int getSubTotalCnt(String sub_sql, String hotel_name_find) {
		Map<String, Object> map = new HashedMap();
		map.put("m_sb",	sub_sql);
		map.put("find", hotel_name_find);
		
		int count=sqlMap.selectOne("hotel_sub_totalCnt",map);
		return count==0?1:count;
	}
	
	public List<HotelDTO> hotel_list(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		
		List<HotelDTO> list = sqlMap.selectList("hotel_list",map);
		return list;
	}
	
	public List<HotelRoomDTO> hotroom_info(String num) {
		List<HotelRoomDTO> list = sqlMap.selectList("hotroom_info", num);
		return list;
	}
	
	public List<HotelDTO> hotel_get_info() {
		List<HotelDTO> list = sqlMap.selectList("hotel_get_info_list");
		return list;
	}
	
	public List<HotelDTO> hotel_get_info(String num) {
		List<HotelDTO> list = sqlMap.selectList("hotel_get_info", num);
		return list;
	}
	
	public List<HotelDTO> hotel_search_name(HashMap<String, Object> map) {		
		List<HotelDTO> list = sqlMap.selectList("hotel_search_name", map);
		return list;
	}
	
	public int add_memberFind(String memberfind, String id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id",	id);
		map.put("m_history", memberfind);
		
		int count=sqlMap.update("add_memberFind", map);
		return count;
	}
	
	public int memberUpdateWishlist(String wishlist, String m_id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id",	m_id);
		map.put("m_wishlist", wishlist);
		
		int count=sqlMap.update("member_update_wishlist", map);
		return count;
	}

	//서브서치
	public List<HotelDTO> hotel_sub_search(String m_sb, String hotel_name_find, int cp, int listsize){
		int start = (cp-1)*listsize+1;
		int end = cp*listsize;
		Map<String, Object> map = new HashedMap();
		
		map.put("m_sb",	m_sb);
		map.put("start", start);
		map.put("end", end);
		map.put("find", hotel_name_find);
		
		System.out.println("m_sb = "+m_sb);
		List<HotelDTO> list = sqlMap.selectList("hotel_sub_search",map);
		return list;
	}
}
