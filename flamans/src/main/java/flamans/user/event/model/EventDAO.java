package flamans.user.event.model;

import java.util.List;

public interface EventDAO {
	
	public Object event_user_content(int idx);
	
	public List<EventDTO> event_user_endlist();
	
	public int getTotalCnt();

	public List<EventDTO> event_user_startlist(int cp, int listSize);
	
}
