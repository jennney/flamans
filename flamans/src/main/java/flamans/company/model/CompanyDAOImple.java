package flamans.company.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.member.model.MemberDTO;

public class CompanyDAOImple implements CompanyDAO {

   private SqlSessionTemplate sqlMap;

   public CompanyDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }
   
   public int company_join(CompanyDTO dto) {
   
      int count= sqlMap.insert("company_join",dto);
      return count;
            
   }

   public String company_id_check(String cm_id) {
      String id=sqlMap.selectOne("company_id_check",cm_id);
      return id;
   }

   public CompanyDTO companyLogin(String cm_id) {
   
      CompanyDTO dto=null;
      
      try{
         dto=sqlMap.selectOne("cm_logInCheck", cm_id);
         return dto;
      }catch(Exception e){
         e.printStackTrace();
         return null;
      }   
   }
   
//여기서 부터 추가
   public CompanyDTO company_find_id(String cm_name, String cm_email) {
      Map<String, String> map=new HashMap<String, String>();
      map.put("cm_name",   cm_name);
      map.put("cm_email", cm_email);

      CompanyDTO dto=new CompanyDTO();
      try{
         dto=sqlMap.selectOne("company_find_id", map);
      }catch(Exception e){
         e.printStackTrace();
         return null;
      }
      
      return dto;
   }


   public int company_update_pw(String cm_id, String cm_email, String cm_pwd) {
      Map<String, String> map=new HashMap<String, String>();
      System.out.println(cm_pwd);
      System.out.println(cm_id);
      System.out.println(cm_email);
      map.put("cm_pwd", cm_pwd);
      map.put("cm_id", cm_id);
      map.put("cm_email", cm_email);
      
      int count=sqlMap.update("company_update_pw", map);
            System.out.println("ss");
      return count;
   }

   public int company_update(CompanyDTO dto) {
      int result=sqlMap.update("company_update",dto);
      return 0;
   }

}