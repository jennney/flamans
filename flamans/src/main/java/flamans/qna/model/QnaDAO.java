package flamans.qna.model;

import java.util.List;

public interface QnaDAO {
	
	public List<QnaDTO> qnaList(String qna_kind,int cp, int ls,String qna_item,String findKey, String findValue);
	public int qnaWrite(QnaDTO qdto);
	public QnaDTO qnaContent(int qna_idx);
	public int qnaTotal(String qna_kind,String qna_item,String findKey,String findValue);
	public int qnaUpdate(QnaDTO qdto);
	public int qnaReadnum(int qna_idx);
	public String qnaPwd(int qna_idx);
	public int qnaMaxref();
	public int qnaSunbun(int ref,int sunbun);
	public int qnaReWrite(QnaDTO qdto);
	public int qnaDelete(int qna_idx);
}
