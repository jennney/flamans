package flamans.user.event.model;

import java.util.List;

public interface EventDAO {
	
	public Object event_user_content(int idx);
	
	public List<EventDTO> event_user_endlist(int cp, int listSize);
	
	public int getTotalCnt();

	public List<EventDTO> event_user_startlist(int cp, int listSize);
	
	public int e_readnum(int idx); 
	
	public int event_add(EventDTO dto);
	
}
