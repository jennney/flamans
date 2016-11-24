package flamans.member.model;

public class MemberDTO {

	private String m_name;
	private String m_sex;
	private String m_birthday;
	private String m_nationality;
	private String m_id;
	private String m_pwd;
	private String m_email;
	private String m_tel;
	private String m_wishlist;
	private String m_history;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String m_name, String m_sex, String m_birthday, String m_nationality, String m_id, String m_pwd,
			String m_email, String m_tel, String m_wishlist, String m_history) {
		super();
		this.m_name = m_name;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_nationality = m_nationality;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_email = m_email;
		this.m_tel = m_tel;
		this.m_wishlist = m_wishlist;
		this.m_history = m_history;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_birthday() {
		return m_birthday;
	}

	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}

	public String getM_nationality() {
		return m_nationality;
	}

	public void setM_nationality(String m_nationality) {
		this.m_nationality = m_nationality;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_wishlist() {
		return m_wishlist;
	}

	public void setM_wishlist(String m_wishlist) {
		this.m_wishlist = m_wishlist;
	}

	public String getM_history() {
		return m_history;
	}

	public void setM_history(String m_history) {
		this.m_history = m_history;
	}
	
	
	
}
