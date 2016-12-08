package flamans.Bbook.model;

public class DoctorDTO {

	private String cm_name;
	private String hos_num; //병원번호
	private int doc_num; //의사번호
	private String doc_name;	//의사이름
	private String doc_img;	//의사이미지
	private String doc_level;	//의사학력
	private String doc_career;	//의사경력
	private String doc_etc;	//의사기타
	private String m_name;
	private String m_sex;
	private String m_birthday;
	private String m_nationality;
	
	public DoctorDTO() {
		super();
	}

	public DoctorDTO(String cm_name, String hos_num, int doc_num, String doc_name, String doc_img, String doc_level,
			String doc_career, String doc_etc, String m_name, String m_sex, String m_birthday, String m_nationality) {
		super();
		this.cm_name = cm_name;
		this.hos_num = hos_num;
		this.doc_num = doc_num;
		this.doc_name = doc_name;
		this.doc_img = doc_img;
		this.doc_level = doc_level;
		this.doc_career = doc_career;
		this.doc_etc = doc_etc;
		this.m_name = m_name;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_nationality = m_nationality;
	}

	public String getCm_name() {
		return cm_name;
	}

	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}

	public String getHos_num() {
		return hos_num;
	}

	public void setHos_num(String hos_num) {
		this.hos_num = hos_num;
	}

	public int getDoc_num() {
		return doc_num;
	}

	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getDoc_img() {
		return doc_img;
	}

	public void setDoc_img(String doc_img) {
		this.doc_img = doc_img;
	}

	public String getDoc_level() {
		return doc_level;
	}

	public void setDoc_level(String doc_level) {
		this.doc_level = doc_level;
	}

	public String getDoc_career() {
		return doc_career;
	}

	public void setDoc_career(String doc_career) {
		this.doc_career = doc_career;
	}

	public String getDoc_etc() {
		return doc_etc;
	}

	public void setDoc_etc(String doc_etc) {
		this.doc_etc = doc_etc;
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

	
	
}
