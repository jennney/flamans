package flamans.hot.book.model;



import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

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
	    
}
