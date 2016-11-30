package flamans.hos_find.model;

public class DoctorDTO {
	
	private String hos_num;
	private String doc_name;
	private String doc_img;
	private String doc_level;
	private String doc_career;
	private String doc_etc;
	private String doc_kind;
	
	public DoctorDTO() {
		super();
	}

	public DoctorDTO(String hos_num, String doc_name, String doc_img, String doc_level, String doc_career,
			String doc_etc, String doc_kind) {
		super();
		this.hos_num = hos_num;
		this.doc_name = doc_name;
		this.doc_img = doc_img;
		this.doc_level = doc_level;
		this.doc_career = doc_career;
		this.doc_etc = doc_etc;
		this.doc_kind = doc_kind;
	}

	public String getHos_num() {
		return hos_num;
	}

	public void setHos_num(String hos_num) {
		this.hos_num = hos_num;
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

	public String getDoc_kind() {
		return doc_kind;
	}

	public void setDoc_kind(String doc_kind) {
		this.doc_kind = doc_kind;
	}
	
	
	
}