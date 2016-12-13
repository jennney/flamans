package flamans.hot.book.model;

import java.util.List;

import flamans.hotel_find.model.HotelRoomDTO;
import flamans.member.model.MemberDTO;

public interface Hot_bookDAO {

	public int booking_hot(Hot_bookDTO dto);
	
	public int booking_hot_info(Hot_bookDTO dto);
    
	public MemberDTO booking_info(String m_id);

	public int booking_hot1(Hot_bookDTO bdto);
	
	public List<HotelRoomDTO> hotelroom(String hot_num);
	
}
