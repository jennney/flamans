package flamans.hotel_find.model;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

public class HotelDAOImple implements HotelDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public HotelDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<HotelDTO> hotel_list() {
		List<HotelDTO> list = sqlMap.selectList("hotel_list");
		System.out.println("호텔정보:"+list);
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
}
