package flamans.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.hotel_find.model.HotelDTO;
import flamans.hotel_find.model.HotelRoomDTO;
import flamans.qna.model.QnaDTO;

public class Hotel_ManagerDAOImple implements Hotel_ManagerDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Hotel_ManagerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int hotelBbsCnt(String cm_number) {
		int count=sqlMap.selectOne("companyBbsCnt", cm_number);
		return count==0?1:count;
	}

	public List<QnaDTO> hotelBbsList(String qna_findname,int cp,int listSize) {
		int start=(cp-1)*listSize+1 ;
		int end=cp*listSize;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("qna_findname", qna_findname);
		map.put("start", start);
		map.put("end", end);
		List<QnaDTO> list=sqlMap.selectList("companyBbsList", map);
		return list;
	}

	public List<QnaDTO> hotelBbsContent(int qna_idx) {
		sqlMap.update("qna_Readnum",qna_idx);
		List<QnaDTO> list=sqlMap.selectList("hotelBbsContent", qna_idx);
		return list;
	}
	
	public int hotelBbsDelete(int qna_idx) {
		int count=sqlMap.delete("hotelBbsDelete", qna_idx);
		return count;
	}
	
	public int getMaxRef() {
		int ref=sqlMap.selectOne("getMaxRef");
		return ref;
	}
	
	public int updateSun(int ref, int sunbun) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("ref", ref);
		map.put("sunbun", sunbun);
		int result=sqlMap.update("updateSun", map);
		return result;
	}
	
	public QnaDTO hotelBbsReWriteForm(int qna_idx) {
		QnaDTO dto=sqlMap.selectOne("hotelBbsContent", qna_idx);
		return dto;
	}
	
	public int hotelBbsReWrite(QnaDTO dto) {
		int count=sqlMap.insert("hotelBbsReWrite", dto);
		return count;
	}
	
	public List<HotelDTO> hotelContent(String cm_number) {
		List<HotelDTO> list=sqlMap.selectList("hotelContent", cm_number);
		return list;
	}
	
	public int hotelAdd(HotelDTO dto) {
		int count=sqlMap.insert("hotelAdd", dto);
		return count;
	}
	
	public HotelDTO hotelUpdateForm(String hot_num) {
		HotelDTO dto=sqlMap.selectOne("hotelContent", hot_num);
		return dto;
	}
	
	public int hotelUpdate(HotelDTO dto) {
		int count=sqlMap.update("hotelUpdate", dto);
		return count;
	}
	
	public int hotelDelete(String hot_num) {
		int count=sqlMap.delete("hotelDelete", hot_num);
		return count;
	}
	
	public int hotelRoomCnt(String cm_number) {
		int count=sqlMap.selectOne("hotelRoomCnt", cm_number);
		return count;
	}
	
	public List<HotelRoomDTO> hotelRoomList(String cm_number, int cp, int listSize) {
		int start=(cp-1)*listSize+1 ;
		int end=cp*listSize;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cm_number", cm_number);
		map.put("start", start);
		map.put("end", end);
		List<HotelRoomDTO> list=sqlMap.selectList("hotelRoomLIst", map);
		return list;
	}
	
	public int hotelRoomAdd(HotelRoomDTO dto) {
		int count=sqlMap.insert("hotelRoomAdd", dto);
		return count;
	}
	
	public List<HotelRoomDTO> hotelRoomContent(int room_idx) {
		List<HotelRoomDTO> list=sqlMap.selectList("hotelRoomContent", room_idx);
		return list;
	}
	
	public HotelRoomDTO hotelRoomUpdateForm(int room_idx) {
		HotelRoomDTO dto=sqlMap.selectOne("hotelRoomContent", room_idx);
		return dto;
	}
	
	public int hotelRoomUpdate(HotelRoomDTO dto) {
		int count=sqlMap.update("hotelRoomUpdate", dto);
		return count;
	}
	
	public int hotelRoomDelete(int room_idx) {
		int count=sqlMap.delete("hotelRoomDelete", room_idx);
		return count;
	}
}
