package flamans.hos_find.model;

public class HospitalDTO {
	
	private String hos_num;
	private String hos_name;
	private String hos_addr;
	private String hos_img;
	private String hos_content;
	private String hos_mapinfo;
	private int hos_star;
	private String hos_special;
	
	public HospitalDTO() {
		super();
	}
	
	

	public HospitalDTO(String hos_num, String hos_name, String hos_addr, String hos_img, String hos_content,
			String hos_mapinfo, int hos_star, String hos_special) {
		super();
		this.hos_num = hos_num;
		this.hos_name = hos_name;
		this.hos_addr = hos_addr;
		this.hos_img = hos_img;
		this.hos_content = hos_content;
		this.hos_mapinfo = hos_mapinfo;
		this.hos_star = hos_star;
		this.hos_special = hos_special;
	}



	public String getHos_num() {
		return hos_num;
	}

	public void setHos_num(String hos_num) {
		this.hos_num = hos_num;
	}

	public String getHos_name() {
		return hos_name;
	}

	public void setHos_name(String hos_name) {
		this.hos_name = hos_name;
	}

	public String getHos_addr() {
		return hos_addr;
	}

	public void setHos_addr(String hos_addr) {
		this.hos_addr = hos_addr;
	}

	public String getHos_img() {
		return hos_img;
	}

	public void setHos_img(String hos_img) {
		this.hos_img = hos_img;
	}

	public String getHos_content() {
		return hos_content;
	}

	public void setHos_content(String hos_content) {
		this.hos_content = hos_content;
	}

	public String getHos_mapinfo() {
		return hos_mapinfo;
	}

	public void setHos_mapinfo(String hos_mapinfo) {
		this.hos_mapinfo = hos_mapinfo;
	}

	public int getHos_star() {
		return hos_star;
	}

	public void setHos_star(int hos_star) {
		this.hos_star = hos_star;
	}

	public String getHos_special() {
		return hos_special;
	}

	public void setHos_special(String hos_special) {
		this.hos_special = hos_special;
	}
	
}