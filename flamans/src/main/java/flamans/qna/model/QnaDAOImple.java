package flamans.qna.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class QnaDAOImple implements QnaDAO {
	
	private SqlSessionTemplate sqlMap;

	public QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<QnaDTO> qnaList(String kind) {
		List<QnaDTO> qnaList = sqlMap.selectList("qna_List",kind);
		return qnaList;
	}
	
	public int qnaWrite(QnaDTO qdto) {
		int count = sqlMap.insert("qna_Write",qdto);
		return count;
	}
	
	public QnaDTO qnaContent(int qna_idx) {
		QnaDTO qdto = sqlMap.selectOne("qna_Content",qna_idx); 
		return qdto;
	}

}
