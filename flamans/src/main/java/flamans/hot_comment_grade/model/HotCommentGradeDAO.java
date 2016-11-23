package flamans.hot_comment_grade.model;

import java.util.List;

public interface HotCommentGradeDAO {

	public List<HotCommentGradeDTO> hotel_get_opnion(String num);
	public int hotel_input_comment_grade(HotCommentGradeDTO commentDTO);
}
