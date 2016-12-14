package flamans.company.model;


public interface CompanyDAO {
   
   public int company_join(CompanyDTO dto);
   
   public String company_id_check(String cm_id);
   
   public CompanyDTO companyLogin(String cm_id);
   
   public CompanyDTO company_find_id(String cm_name, String cm_email);
   
   public int company_update_pw(String cm_id, String cm_email, String cm_pwd);
   
   public int company_update(CompanyDTO dto);

   public CompanyDTO companyInfo(String cm_id);
}