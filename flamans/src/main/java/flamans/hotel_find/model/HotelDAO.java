package flamans.hotel_find.model;

import java.util.HashMap;
import java.util.List;

public interface HotelDAO {
	
	public List<HotelDTO> hotel_list();
	public List<HotelDTO> hotel_get_info(String num);
	public List<HotelDTO> hotel_search_name(HashMap<String, Object> map);
}
