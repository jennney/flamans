package flamans.user.event.model;

import java.util.List;

public interface EventDAO {
	
	public Object event_user_content(int idx);
		
	public int getTotalCnt();

	public List<EventDTO> event_user_list(int cp, int listSize, int e_item);
	
	public int e_readnum(int idx); 
	
	public int event_add(EventDTO dto);
	
	public List<EventDTO> event_list(int cp, int listSize);

	public Object event_content(int idx);
	
	public int event_update(int e_idx, String e_subject,String e_start,String e_end,String e_img);

	public int event_delete(int idx);
	
	public List<EventDTO> event_hot_list(int cp, int listSize);
	
	public int event_Date(int e_idx);
	
	
	
}
