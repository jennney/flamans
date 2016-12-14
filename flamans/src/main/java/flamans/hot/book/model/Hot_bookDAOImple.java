package flamans.hot.book.model;



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

	
	/*public List<BbookDTO> bBbook_List(String hos_num, String bookingdate) {
		
		List<BbookDTO> Alist=null;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingdate", bookingdate);
		
		try{
			Alist=sqlMap.selectList("bBbook_list", map);
			return Alist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public int bBbook_permit(String hos_num, int bookingnum) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingnum", bookingnum);
		
		int result=sqlMap.update("bBook_request", map);
		return result;
	}

	public int bBbook_refuse(String hos_num, int bookingnum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingnum", bookingnum);
		
		int result=sqlMap.delete("bBook_del", map);
		return result;
	}

	public BbookDTO bBook_content(int bookingnum) {
		
		BbookDTO Bdto=sqlMap.selectOne("bBook_content", bookingnum);
		return Bdto;
	}

	public int bBook_reWrite(BbookDTO dto, String hos_num) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("dto", dto);
		
		int result=sqlMap.insert("bBook_reWirte", map);
		return result;

	}

	public List<BbookDTO> calendar(String hos_num, String date) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("date", date);
		List<BbookDTO> cal=sqlMap.selectList("calendar", map);
		return cal;
	}
*/
	

}
