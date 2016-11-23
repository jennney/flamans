package flamans.company.model;

public class CompanyDTO {

	private String cm_name;
	private String cm_number;
	private String cm_id;
	private String cm_pwd;
	private String cm_email;
	private String cm_tel;
	private String cm_permit;
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(String cm_name, String cm_number, String cm_id, String cm_pwd, String cm_email, String cm_tel,
			String cm_permit) {
		super();
		this.cm_name = cm_name;
		this.cm_number = cm_number;
		this.cm_id = cm_id;
		this.cm_pwd = cm_pwd;
		this.cm_email = cm_email;
		this.cm_tel = cm_tel;
		this.cm_permit = cm_permit;
	}

	public String getCm_name() {
		return cm_name;
	}

	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}

	public String getCm_number() {
		return cm_number;
	}

	public void setCm_number(String cm_number) {
		this.cm_number = cm_number;
	}

	public String getCm_id() {
		return cm_id;
	}

	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}

	public String getCm_pwd() {
		return cm_pwd;
	}

	public void setCm_pwd(String cm_pwd) {
		this.cm_pwd = cm_pwd;
	}

	public String getCm_email() {
		return cm_email;
	}

	public void setCm_email(String cm_email) {
		this.cm_email = cm_email;
	}

	public String getCm_tel() {
		return cm_tel;
	}

	public void setCm_tel(String cm_tel) {
		this.cm_tel = cm_tel;
	}

	public String getCm_permit() {
		return cm_permit;
	}

	public void setCm_permit(String cm_permit) {
		this.cm_permit = cm_permit;
	}
	
}
