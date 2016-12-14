package flamans.hot.book.model;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.Bbook.model.BbookDTO;
import flamans.hotel_find.model.HotelRoomDTO;
import flamans.member.model.MemberDTO;


public class Hot_bookDAOImple implements Hot_bookDAO {
   
   private SqlSessionTemplate sqlMap;
   
   public Hot_bookDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }

   public int booking_hot(Hot_bookDTO dto) {
		int count=sqlMap.insert("booking_hot",dto);
		return count;
	}
	
	public int booking_hot_info(Hot_bookDTO dto){
		
		int count=sqlMap.insert("booking_hot_info",dto);
		return count;
	}
	
	public MemberDTO booking_info(String m_id) {
		MemberDTO mdto = sqlMap.selectOne("hot_info",m_id);
		return mdto;
	}
	
	public int booking_hot1(Hot_bookDTO bdto){
		int count= sqlMap.insert("booking_hot",bdto);
		return count;
	}
	
	public List<HotelRoomDTO> hotelroom(String hot_num) {
		List<HotelRoomDTO> list=sqlMap.selectList("fm_hotroom",hot_num);
		return list;
	}
	
	public List<Hot_bookDTO> fm_myhot_book(String m_id) {
	      List<Hot_bookDTO> list = sqlMap.selectList("fm_myhot_book",m_id);
	      return list;
	}

	public List<HotelRoomDTO> Hbook_List(String hot_num, String checkin) {
		List<HotelRoomDTO> Hlist=null;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hot_num", hot_num);
		map.put("checkin", checkin);
		try{
			Hlist=sqlMap.selectList("Hbook_list", map);
			return Hlist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public int Hbook_refuse(String hot_num, int bookingnum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hot_num", hot_num);
		map.put("bookingnum", bookingnum);
		
		int result=sqlMap.delete("HBook_del", map);
		return result;
	}
	
	public int Hbook_permit(String hot_num, int bookingnum) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hot_num", hot_num);
		map.put("bookingnum", bookingnum);
		
		
		int result=sqlMap.update("HBook_request", map);
		return result;
	}

	public int fm_hotroomnum(int room_idx, int roomselect) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("room_idx", room_idx);
			map.put("roomselect",roomselect);
			int count = sqlMap.update("fm_hotroomnum",map);
			return count;
		}


}	
  

  