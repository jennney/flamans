package flamans.notice.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<NoticeDTO> noList(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map<String, Integer> map = new HashedMap();
		map.put("start",start);
		map.put("end", end);
		List<NoticeDTO> noList = sqlMap.selectList("no_List",map);
		return noList;
	}
	
	public int noWrite(NoticeDTO ndto) {
		int count = sqlMap.insert("no_Write",ndto);
		return count;
	}
	
	public NoticeDTO noContent(int no_idx) {
		NoticeDTO ndto = sqlMap.selectOne("no_Content",no_idx);
		return ndto;
	}
	
	public int noDelete(int no_idx) {
		int count = sqlMap.delete("no_Delete",no_idx);
		return count;
	}
	
	public int noUpdate(NoticeDTO ndto) {
		int count = sqlMap.update("no_Update",ndto);
		return count;
	}
	
	public int noTotal() {
		int count = sqlMap.selectOne("no_Total");
		return count;
	}
	
	public int noReadnum(int no_idx) {
		int count = sqlMap.update("no_Readnum",no_idx);
		return count;
	}
	
	public String noDownName(int no_idx) {
		String downName = sqlMap.selectOne("no_DownName",no_idx);
		return downName;
	}
		
}
