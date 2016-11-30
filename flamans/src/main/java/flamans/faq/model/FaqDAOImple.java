package flamans.faq.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class FaqDAOImple implements FaqDAO {
	
	private SqlSessionTemplate sqlMap;

	public FaqDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<FaqDTO> faqList(String item) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("faq_item", item);
		List<FaqDTO> list = sqlMap.selectList("faq_List",map);
		return list;
	}
	
	public int faqWrite(FaqDTO fdto) {
		int count = sqlMap.insert("faq_Write",fdto);
		return count;
	}
	
}
