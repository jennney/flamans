package flamans.hot_comment_grade.model;

import java.util.List;

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
	
	public int hotel_input_comment_grade(HotCommentGradeDTO commentDTO) {
		int count = sqlMap.insert("hotel_input_comment_grade",commentDTO);
		return count;
	}
}
