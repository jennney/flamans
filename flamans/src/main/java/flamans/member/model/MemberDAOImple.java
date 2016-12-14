package flamans.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import flamans.Bbook.model.*;
import flamans.hot.book.model.*;
import flamans.member.model.MemberDTO;
import flamans.qna.model.QnaDTO;

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
	
	public MemberDTO memberFindId(String m_name, String m_email) {

		Map<String, String> map=new HashMap<String, String>();
		map.put("m_name",	m_name);
		map.put("m_email", m_email);

		MemberDTO dto=new MemberDTO();
		try{
			dto=sqlMap.selectOne("member_find_id", map);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
		return dto;
	}

	public int memberUpdatePwd(String m_id, String m_email, String m_pwd) {
		
		Map<String, String> map=new HashMap<String, String>();
		System.out.println(m_pwd);
		System.out.println(m_id);
		System.out.println(m_email);
		map.put("m_pwd", m_pwd);
		map.put("m_id",	m_id);
		map.put("m_email", m_email);
		
		int count=sqlMap.update("member_update_pwd", map);
				System.out.println("ss");
		return count;
	}

	public MemberDTO memberLogin(String m_id) {
		
		MemberDTO dto=null;
		
		try{
			dto=sqlMap.selectOne("logInCheck", m_id);
			return dto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
		
	}

	public int memberOut(String m_id, String m_pwd) {
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_pwd", m_pwd);
		map.put("m_id",	m_id);

		int result = sqlMap.delete("member_out", map);
		return result;
	}

	public int memberUpdate(MemberDTO dto) {		
		int result=sqlMap.update("member_update", dto);
		return result;	
		
	}
	
	public int memberUpdateWishlist(String wishlist, String m_id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id",	m_id);
		map.put("m_wishlist", wishlist);
		
		int count=sqlMap.update("member_update_wishlist", map);
				
		return count;
	}
	
	public List<QnaDTO> myqna(String qna_writer) {
		List<QnaDTO> myqna = sqlMap.selectList("member_myqna",qna_writer);
		return myqna;
	}
	
	public List<BbookDTO> mcalendar(String hos_bid, String date) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("hos_bid", hos_bid);
		map.put("date", date);
		 System.out.println("컨트롤러"+hos_bid+"/"+date);
		List<BbookDTO> cal=sqlMap.selectList("m_Bcalendar", map);
		return cal;
	}
	

	public List<Hot_bookDTO> Hcalendar(String name, String date) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name","윤두준"); //이름으로 저장되서 바꿔야 됨
		map.put("date", date);
		 System.out.println("컨트롤러"+name+"/"+date);
		List<Hot_bookDTO> calH=sqlMap.selectList("m_Hcalendar", map);
		return calH;
	}
	

	public List<Hot_bookDTO> book(String name) {
		List<Hot_bookDTO> book = sqlMap.selectList("book",name);
		return book;
	}
	public List<MemberDTO> hot_info(String m_name) {
		List<MemberDTO> hot_info = sqlMap.selectList("hot_info",m_name);
		return hot_info;
	}
    
}
