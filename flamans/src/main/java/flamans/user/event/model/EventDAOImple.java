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
	
	public List<EventDTO> event_user_startlist(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		List<EventDTO> list=sqlMap.selectList("event_user_startlist",map);
		return list;
	}

	public Object event_user_content(int idx) {
		Object list = sqlMap.selectOne("event_user_content", idx);
		return list;
	}

	public List<EventDTO> event_user_endlist(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		
		Map<String, Integer> map=
				new HashMap<String, Integer>();
		map.put("start", startnum);
		map.put("end", endnum);
		List<EventDTO> list=sqlMap.selectList("event_user_endlist",map);
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
}

