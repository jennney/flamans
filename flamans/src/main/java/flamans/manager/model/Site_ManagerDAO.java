package flamans.manager.model;

import java.util.List;

import flamans.company.model.CompanyDTO;
import flamans.member.model.MemberDTO;

public interface Site_ManagerDAO {

	public List<MemberDTO> memberList(int cp, int ls);
	
	public int totalMemberCnt();
	
	public int memberKick(String m_id);
	
	public List<CompanyDTO> permittedComany();
	
	public List<CompanyDTO> unpermitComany();
	
	public int permit(String cm_number);
	
	public int comanyOut(String cm_number);
}
