package flamans.manager.model;

import java.util.List;

import flamans.member.model.MemberDTO;

public interface Site_ManagerDAO {

	public List<MemberDTO> memberList(int cp, int ls);
	
	public int totalMemberCnt();
}
