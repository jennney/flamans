package flamans.hot.book.model;

import java.util.Date;
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
	 
	public List<HotelRoomDTO> Hbook_List(String hot_num, String checkin);
	
	public int Hbook_permit(String hot_num, int bookingnum);
	
	public int Hbook_refuse(String hot_num, int bookingnum);
	
	public int fm_hotroomnum(int room_idx,int roomselect);
	
	/*
	
	public BbookDTO bBook_content(int bookingnum);
	
	public int bBook_reWrite(BbookDTO dto, String hos_num);
	
	public List<BbookDTO> calendar(String hos_num, String date);*/
	
}
   
