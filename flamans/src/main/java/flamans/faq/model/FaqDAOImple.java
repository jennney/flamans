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
	
	public List<FaqDTO> faqList() {
		List<FaqDTO> list = sqlMap.selectList("faq_List");
		return list;
	}
	
	public int faqWrite(FaqDTO fdto) {
		int count = sqlMap.insert("faq_Write",fdto);
		return count;
	}
	
	public List<FaqDTO> faqBestList() {
		List<FaqDTO> list = sqlMap.selectList("faq_BestList");
		return list;
	}
	
	public List<FaqDTO> faqmemList() {
		List<FaqDTO> list = sqlMap.selectList("faq_memList");
		return list;
	}
	
	public List<FaqDTO> faqhotList() {
		List<FaqDTO> list = sqlMap.selectList("faq_hotList");
		return list;
	}
	
	public List<FaqDTO> faqhosList() {
		List<FaqDTO> list = sqlMap.selectList("faq_hosList");
		return list;
	}
	
	public List<FaqDTO> faqetc() {
		List<FaqDTO> list = sqlMap.selectList("faq_etc");
		return list;
	}
	
	public int faqDelete(int faq_idx) {
		int count = sqlMap.delete("faq_Delete",faq_idx);
		return count;
	}
	
	public FaqDTO faqContent(int faq_idx) {
		FaqDTO fdto = sqlMap.selectOne("faq_Content",faq_idx);
		return fdto;
	}
	
	public int faqUpdate(FaqDTO fdto) {
		int count = sqlMap.update("faq_Update",fdto);
		return count;
	}
	
	public List<FaqDTO> faqFind(String findValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("findValue", findValue);
		List<FaqDTO> list = sqlMap.selectList("faq_Find",map);
		return list;
	}
	
	public int faqTotal(String findValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("findValue", findValue);
		int count = sqlMap.selectOne("faq_Total",map);
		return count;
	}
}
