package flamans.company.model;

public interface CompanyDAO {
	
	public int company_join(CompanyDTO dto);
	public String company_id_check(String cm_id);


}
