package flamans.manager.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

}
