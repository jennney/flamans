package flamans.hot.book.model;

import java.sql.Date;
import java.util.List;

import flamans.company.model.CompanyDTO;
import flamans.hotel_find.model.HotelRoomDTO;
import flamans.member.model.MemberDTO;

public interface Hot_bookDAO {

   public int booking_hot(Hot_bookDTO dto);
   
   public int booking_hot_info(Hot_bookDTO dto);
    
   public MemberDTO booking_info(String m_id);

	public int booking_hot1(Hot_bookDTO bdto);
	
	public List<HotelRoomDTO> hotelroom(String hot_num);
	
	public List<Hot_bookDTO> fm_myhot_book(String m_id);  
	 
	public List<HotelRoomDTO> Hbook_List(String hot_num, Date checkin);
	
	/*public int bBbook_permit(String hos_num, int bookingnum);
	
	public int bBbook_refuse(String hos_num, int bookingnum);
	
	public BbookDTO bBook_content(int bookingnum);
	
	public int bBook_reWrite(BbookDTO dto, String hos_num);
	
	public List<BbookDTO> calendar(String hos_num, String date);*/
	
}
   
