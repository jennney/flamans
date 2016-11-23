package flamans.company.model;

import org.mybatis.spring.SqlSessionTemplate;

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
}
