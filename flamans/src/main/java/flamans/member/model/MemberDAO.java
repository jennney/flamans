package flamans.member.model;

public interface MemberDAO {

	public static int NOT_ID=1;
	public static int NOT_PWD=2;
	public static int LOGIN_OK=3;
	public static int ERROR=-1;
	
	public int memberJoin(MemberDTO dto);

	public int idCheck(String m_id);
	
	public int logInCheck(String id, String pwd);
	
	public String getUserInfo(String userid);
}