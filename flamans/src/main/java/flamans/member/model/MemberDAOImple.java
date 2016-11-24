package flamans.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		int count=sqlMap.insert("member_join", dto);
		return count;
	}

	public int idCheck(String m_id) {

		int count=sqlMap.selectOne("member_check_id", m_id);
		return count;
	}

	public int logInCheck(String id, String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getUserInfo(String userid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
