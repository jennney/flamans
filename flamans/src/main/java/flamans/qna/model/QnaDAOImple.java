package flamans.qna.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class QnaDAOImple implements QnaDAO {
	
	private SqlSessionTemplate sqlMap;

	public QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<QnaDTO> qnaList(String qna_kind,int cp,int ls,String qna_item) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_kind", qna_kind);
		map.put("start",start);
		map.put("end", end);
		map.put("qna_item", qna_item);
		List<QnaDTO> qnaList = sqlMap.selectList("qna_List",map);
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
	
	public int qnaTotal(String qna_kind,String qna_item) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_kind", qna_kind);
		map.put("qna_item", qna_item);
		int count = sqlMap.selectOne("qna_Total",map);
		return count==0?1:count;
	}
	
	public int qnaUpdate(QnaDTO qdto){
		int count = sqlMap.update("qna_Update",qdto);
		return count;
	}
	
	public int qnaReadnum(int qna_idx) {
		int count = sqlMap.update("qna_Readnum",qna_idx);
		return count;
	}
	
	public String qnaPwd(int qna_idx) {
		String count = sqlMap.selectOne("qna_Pwd",qna_idx);
		return count;
	}
	
	public int qnaMaxref() {
		int count = sqlMap.selectOne("qna_Maxref");
		return count;
	}
	
	public int qnaSunbun(int ref, int sunbun) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("sunbun", sunbun);
		int count = sqlMap.update("qna_Sunbun",map);
		return count;
	}
	
	public int qnaReWrite(QnaDTO qdto) {
		int count = sqlMap.insert("qna_ReWrite",qdto);
		return count;
	}
	
	public int qnaDelete(int qna_idx) {
		int count = sqlMap.delete("qna_Delete",qna_idx);
		return count;
	}
}
