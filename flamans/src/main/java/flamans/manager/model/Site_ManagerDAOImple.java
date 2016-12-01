package flamans.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.member.model.MemberDTO;

public class Site_ManagerDAOImple implements Site_ManagerDAO {

	private SqlSessionTemplate sqlMap;
	
	public Site_ManagerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<MemberDTO> memberList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("start",start);
		map.put("end", end);
		List<MemberDTO> list=sqlMap.selectList("memberList", map);
		return list;
	}
	
	public int totalMemberCnt() {
		int count=sqlMap.selectOne("totalMemberCnt");
		return count;
	}

}
