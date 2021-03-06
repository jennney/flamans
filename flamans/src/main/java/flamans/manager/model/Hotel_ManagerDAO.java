package flamans.manager.model;

import java.util.List;

import flamans.hotel_find.model.HotelDTO;
import flamans.hotel_find.model.HotelRoomDTO;
import flamans.qna.model.QnaDTO;

public interface Hotel_ManagerDAO {
	
	public int hotelBbsCnt(String cm_number);
	
	public List<QnaDTO> hotelBbsList(String qna_findname,int cp,int listSize);
	
	public List<QnaDTO> hotelBbsContent(int qna_idx);
	
	public int hotelBbsDelete(int qna_idx);
	
	public int getMaxRef();
	
	public int updateSun(int ref,int sunbun);
	
	public QnaDTO hotelBbsReWriteForm(int qna_idx);
	
	public int hotelBbsReWrite(QnaDTO dto);
	
	public List<HotelDTO> hotelContent(String cm_number);
	
	public int hotelAdd(HotelDTO dto);
	
	public HotelDTO hotelUpdateForm(String hot_num);
	
	public int hotelUpdate(HotelDTO dto);
	
	public int hotelDelete(String hot_num);
	
	public int hotelRoomCnt(String cm_number);
	
	public List<HotelRoomDTO> hotelRoomList(String cm_number,int cp,int listSize);
	
	public int hotelRoomAdd(HotelRoomDTO dto);
	
	public List<HotelRoomDTO> hotelRoomContent(int room_idx);
	
	public HotelRoomDTO	hotelRoomUpdateForm(int room_idx);
	
	public int hotelRoomUpdate(HotelRoomDTO dto);
	
	public int hotelRoomDelete(int room_idx);
}
