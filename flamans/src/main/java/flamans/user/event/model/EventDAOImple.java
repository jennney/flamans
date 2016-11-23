package flamans.user.event.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.user.event.model.EventDTO;

public class EventDAOImple implements EventDAO {

	private SqlSessionTemplate sqlMap;
	
	public EventDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<EventDTO> event_user_startlist(int cp, int listSize) {
		List<EventDTO> list=sqlMap.selectList("event_user_startlist");
		return list;
	}

	public Object event_user_content(int idx) {
		Object list = sqlMap.selectOne("event_user_content", idx);
		return list;
	}

	public List<EventDTO> event_user_endlist() {
		List<EventDTO> list=sqlMap.selectList("event_user_endlist");
		return list;
	}

	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count==0?1:count;  //최소한의 페이징 영역이 나 올 수 있도록 하기 위함.
	
	}

	
}

