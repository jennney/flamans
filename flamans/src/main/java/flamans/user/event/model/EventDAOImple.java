package flamans.user.event.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.user.event.model.EventDTO;


public class EventDAOImple implements EventDAO {

	private SqlSessionTemplate sqlMap;
	
	public EventDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<EventDTO> event_user_list(int cp, int listSize, int e_item) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		map.put("e_item", e_item);
		List<EventDTO> list=sqlMap.selectList("event_user_list",map);
		return list;
	}

	public Object event_user_content(int idx) {
		Object list = sqlMap.selectOne("event_user_content", idx);
		return list;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count==0?1:count;  //최소한의 페이징 영역이 나 올 수 있도록 하기 위함.
	}	
	
	public int e_readnum(int idx) {
		int count = sqlMap.update("e_readnum", idx);
		return count;
	}

	public int event_add(EventDTO dto) {
		int count=sqlMap.insert("event_add",dto);
		return count;
	}
	
	public List<EventDTO> event_list(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		List<EventDTO> list=sqlMap.selectList("event_list",map);
		return list;
	}

	public int event_update(int e_idx,String e_subject,String e_start,String e_end,String e_img) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("e_idx", e_idx);
		map.put("e_subject", e_subject);
		map.put("e_start",e_start);
		map.put("e_end", e_end);
		map.put("e_img", e_img);
		int count=sqlMap.update("event_update",map);
		return count;

	}

	public int event_delete(int idx) {
		int count=sqlMap.delete("event_delete",idx);
		return count;
	}

	public Object event_content(int idx) {
		Object list = sqlMap.selectOne("event_content", idx);
		return list;
	}

	public List<EventDTO> event_hot_list(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		List<EventDTO> list=sqlMap.selectList("event_co_list",map);
		return list;
	}
	
	public int event_Date(int e_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("e_idx", e_idx);
		int count = sqlMap.update("event_Date",e_idx);
		return count;
	}

	public List<EventDTO> event_hos_list(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		List<EventDTO> list=sqlMap.selectList("event_hos_list",map);
		return list;
	}
	
}

