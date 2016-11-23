package flamans.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FaqDAOImple implements FaqDAO {
	
	private SqlSessionTemplate sqlMap;

	public FaqDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<FaqDTO> faqList() {
		List<FaqDTO> list = sqlMap.selectList("faq_List");
		return list;
	}
	
	public int faqWrite(FaqDTO fdto) {
		int count = sqlMap.insert("faq_Write",fdto);
		return count;
	}
	
}
