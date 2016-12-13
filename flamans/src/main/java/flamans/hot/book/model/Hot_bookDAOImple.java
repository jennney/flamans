package flamans.hot.book.model;

import org.mybatis.spring.SqlSessionTemplate;

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
}
