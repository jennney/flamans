package flamans.notice.model;

import java.util.*;

public interface NoticeDAO {
	
	public List<NoticeDTO> noList(int cp, int ls);
	public int noWrite(NoticeDTO ndto);
	public NoticeDTO noContent(int no_idx);
	public int noDelete(int no_idx);
	public int noUpdate(NoticeDTO ndto);
	public int noTotal();
	public int noReadnum(int no_idx);
	public String noDownName(int no_idx);
	
}
