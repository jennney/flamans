package flamans.member.model;

import java.util.List;

import flamans.Bbook.model.BbookDTO;
import flamans.hot.book.model.Hot_bookDTO;
import flamans.qna.model.*;

public interface MemberDAO {

	public static int NOT_ID=1;
	public static int NOT_PWD=2;
	public static int LOGIN_OK=3;
	public static int ERROR=-1;
	
	public int memberJoin(MemberDTO dto);

	public int idCheck(String m_id);
	
	public MemberDTO memberLogin(String m_id);

	public MemberDTO memberFindId(String m_name, String m_email);
	
	public int memberUpdatePwd(String m_id, String m_email, String m_pwd);
	
	public int memberUpdateWishlist(String wishlist, String m_id);
	
	public int memberOut(String m_id, String m_pwd);
	
	public int memberUpdate(MemberDTO dto);
	
	public List<QnaDTO> myqna(String qna_writer);
	
	public List<BbookDTO> mcalendar(String hos_bid, String date);
	
	public List<Hot_bookDTO> Hcalendar(String name, String date);

	public List<Hot_bookDTO> book(String name);
	
	
}
