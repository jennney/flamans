package flamans.manager.model;

import java.util.List;

import flamans.qna.model.QnaDTO;

public interface Hotel_ManagerDAO {
	
	public List<QnaDTO> hotelBbsList(String qna_findname);
}
