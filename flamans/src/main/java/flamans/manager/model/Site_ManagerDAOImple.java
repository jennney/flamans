package flamans.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.company.model.CompanyDTO;
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
	
	public int memberKick(String m_id) {
		int count=sqlMap.delete("memberKick", m_id);
		return count;
	}
	
	public List<CompanyDTO> permittedComany() {
		List<CompanyDTO> list=sqlMap.selectList("permittedCompany");
		return list;
	}
	
	public List<CompanyDTO> unpermitComany() {
		List<CompanyDTO> unlist=sqlMap.selectList("unpermitCompany");
		return unlist;
	}
	
	public int permit(String cm_number) {
		int count=sqlMap.update("companyPermitOk", cm_number);
		return count;
	}
	
	public int comanyOut(String cm_number) {
		int count=sqlMap.delete("companyOut", cm_number);
		return count;
	}
}
