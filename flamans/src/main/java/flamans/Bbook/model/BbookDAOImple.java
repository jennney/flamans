package flamans.Bbook.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class BbookDAOImple implements BbookDAO {

	private SqlSessionTemplate sqlMap;
	
	public BbookDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public BbookDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	
	public DoctorDTO doctorView(String hos_num, int doc_num, String userid) {
		
		DoctorDTO dDTO=null;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("doc_num", doc_num);
		map.put("m_id", userid);
		
		try{
			dDTO=sqlMap.selectOne("findDoc", map);
			return dDTO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	

	public DoctorDTO docInfo(String hos_num, int doc_num) {
		
		DoctorDTO dto = null ;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("doc_num", doc_num);
		
		dto=sqlMap.selectOne("docInfo", map);
		
		return dto;
	}

	public int bBook(BbookDTO dto) {
		
		int result=sqlMap.insert("hos_book", dto);
		return result;
	}


	public List<DoctorDTO> docAll(String hos_num) {

		List<DoctorDTO> doc=null;
		
		try{
			doc=sqlMap.selectList("docAll", hos_num);
			return doc;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public List<BbookDTO> bBbook_List(String hos_num, String bookingdate) {
		
		List<BbookDTO> Alist=null;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingdate", bookingdate);
		
		try{
			Alist=sqlMap.selectList("bBbook_list", map);
			return Alist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public int bBbook_permit(String hos_num, int bookingnum) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingnum", bookingnum);
		
		int result=sqlMap.update("bBook_request", map);
		return result;
	}

	public int bBbook_refuse(String hos_num, int bookingnum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("bookingnum", bookingnum);
		
		int result=sqlMap.delete("bBook_del", map);
		return result;
	}

	public BbookDTO bBook_content(int bookingnum) {
		
		BbookDTO Bdto=sqlMap.selectOne("bBook_content", bookingnum);
		return Bdto;
	}

	public int bBook_reWrite(BbookDTO dto, String hos_num) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("dto", dto);
		
		int result=sqlMap.insert("bBook_reWirte", map);
		return result;

	}

	public List<BbookDTO> calendar(String hos_num, String date) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_num", hos_num);
		map.put("date", date);
		List<BbookDTO> cal=sqlMap.selectList("calendar", map);
		return cal;
	}

	
	
}
