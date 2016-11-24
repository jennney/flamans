package flamans.qna.model;

import java.util.List;

public interface QnaDAO {
	
	public List<QnaDTO> qnaList(String kind);
	public int qnaWrite(QnaDTO qdto);

}
