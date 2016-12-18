package flamans.hotel_find.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.codehaus.jackson.map.ser.std.StdArraySerializers.StringArraySerializer;

public interface HotelDAO {
	
	public List<HotelDTO> hotel_list(int cp, int listSize);
	public List<HotelDTO> hotel_get_info(String num);
	public List<HotelRoomDTO> hotroom_info(String num);
	
	public List<HotelDTO> hotel_get_info();
	
	public String get_date();
	
	//병원 서브서치
	public List<HotelDTO> hotel_sub_search(String m_sb, String hotel_name_find, int cp, int listsize);
	
	//비교용
	
	public List<HotelDTO> hotel_search_name(HashMap<String, Object> map);
	public int getTotalCnt();
	public int getSubTotalCnt(String sub_sql, String hotel_name_find);
	public int memberUpdateWishlist(String wishlist, String m_id);
	public int add_memberFind(String memberfind, String id);
	
}