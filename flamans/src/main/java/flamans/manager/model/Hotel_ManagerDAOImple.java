package flamans.manager.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.hotel_find.model.HotelDTO;
import flamans.qna.model.QnaDTO;

public class Hotel_ManagerDAOImple implements Hotel_ManagerDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Hotel_ManagerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<QnaDTO> hotelBbsList(String qna_findname) {
		List<QnaDTO> list=sqlMap.selectList("hotelBbsList", qna_findname);
		return list;
	}

	public List<QnaDTO> hotelBbsContent(int qna_idx) {
		List<QnaDTO> list=sqlMap.selectList("hotelBbsContent", qna_idx);
		sqlMap.update("qna_Readnum",qna_idx);
		return list;
	}
	
	public int hotelBbsDelete(int qna_idx) {
		int count=sqlMap.delete("hotelBbsDelete", qna_idx);
		return count;
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
}
