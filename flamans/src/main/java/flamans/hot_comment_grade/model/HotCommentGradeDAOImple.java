package flamans.hot_comment_grade.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class HotCommentGradeDAOImple implements HotCommentGradeDAO {

	private SqlSessionTemplate sqlMap;
	
	public HotCommentGradeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<HotCommentGradeDTO> hotel_get_opnion(String num) {
			List<HotCommentGradeDTO> list = sqlMap.selectList("hotel_get_opnion", num);
			return list;
	}
	
	public int hotel_input_comment_grade(String c_number, String c_grade, String c_comment, String username) {
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("c_number",	c_number);
		map.put("c_grade", c_grade);
		map.put("c_comment", c_comment);
		map.put("username", username);
		
		int count = sqlMap.insert("hotel_input_comment_grade",map);
		return count;
	}
}
