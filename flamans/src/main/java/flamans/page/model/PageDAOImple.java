package flamans.page.model;

import org.mybatis.spring.SqlSessionTemplate;

public class PageDAOImple implements PageDAO {
	
	private SqlSessionTemplate sqlMap;

	public PageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int pageWrite(PageDTO pdto) {
		int count = sqlMap.update("page_Write",pdto);
		return count;
	}

}
