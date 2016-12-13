package flamans.hotel_find.model;

public class HotelDTO {
	private String hot_num;
	private String hot_name;
	private String hot_addr;
	private String hot_img;
	private String hot_content;
	private String hot_mapinfo;
	private int hot_grade;
	private String hot_roominfo;
	private String hot_option;
	private String hot_etc;
	
	public HotelDTO() {
		super();
	}

	public HotelDTO(String hot_num, String hot_name, String hot_addr, String hot_img, String hot_content,
			String hot_mapinfo, int hot_grade, String hot_roominfo, String hot_option, String hot_etc) {
		super();
		this.hot_num = hot_num;
		this.hot_name = hot_name;
		this.hot_addr = hot_addr;
		this.hot_img = hot_img;
		this.hot_content = hot_content;
		this.hot_mapinfo = hot_mapinfo;
		this.hot_grade = hot_grade;
		this.hot_roominfo = hot_roominfo;
		this.hot_option = hot_option;
		this.hot_etc = hot_etc;
	}

	public String getHot_num() {
		return hot_num;
	}

	public void setHot_num(String hot_num) {
		this.hot_num = hot_num;
	}

	public String getHot_name() {
		return hot_name;
	}

	public void setHot_name(String hot_name) {
		this.hot_name = hot_name;
	}

	public String getHot_addr() {
		return hot_addr;
	}

	public void setHot_addr(String hot_addr) {
		this.hot_addr = hot_addr;
	}

	public String getHot_img() {
		return hot_img;
	}

	public void setHot_img(String hot_img) {
		this.hot_img = hot_img;
	}

	public String getHot_content() {
		return hot_content;
	}

	public void setHot_content(String hot_content) {
		this.hot_content = hot_content;
	}

	public String getHot_mapinfo() {
		return hot_mapinfo;
	}

	public void setHot_mapinfo(String hot_mapinfo) {
		this.hot_mapinfo = hot_mapinfo;
	}

	public int getHot_grade() {
		return hot_grade;
	}

	public void setHot_grade(int hot_grade) {
		this.hot_grade = hot_grade;
	}

	public String getHot_roominfo() {
		return hot_roominfo;
	}

	public void setHot_roominfo(String hot_roominfo) {
		this.hot_roominfo = hot_roominfo;
	}

	public String getHot_option() {
		return hot_option;
	}

	public void setHot_option(String hot_option) {
		this.hot_option = hot_option;
	}

	public String getHot_etc() {
		return hot_etc;
	}

	public void setHot_etc(String hot_etc) {
		this.hot_etc = hot_etc;
	}
	
	
	
}
