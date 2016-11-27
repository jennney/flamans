package flamans.company.model;

import flamans.member.model.MemberDTO;

public interface CompanyDAO {
	
	public int company_join(CompanyDTO dto);
	public String company_id_check(String cm_id);
	public CompanyDTO companyLogin(String cm_id);

}
