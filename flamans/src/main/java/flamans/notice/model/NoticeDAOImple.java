package flamans.notice.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<NoticeDTO> noList() {
		List<NoticeDTO> noList = sqlMap.selectList("noList");
		return noList;
	}

}
