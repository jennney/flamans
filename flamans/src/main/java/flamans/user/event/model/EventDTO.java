package flamans.user.event.model;

import java.sql.Date;

public class EventDTO {

	private String e_img;
	private String e_name;
	private Date e_date;
	private String e_start;
	private String e_end;
	private String e_subject;
	private int e_idx;
	private int e_readnum;
	private int e_item;
	
	
	public EventDTO() {
		super();
	}


	public EventDTO(String e_img, String e_name, Date e_date, String e_start, String e_end, String e_subject, int e_idx,
			int e_readnum, int e_item) {
		super();
		this.e_img = e_img;
		this.e_name = e_name;
		this.e_date = e_date;
		this.e_start = e_start;
		this.e_end = e_end;
		this.e_subject = e_subject;
		this.e_idx = e_idx;
		this.e_readnum = e_readnum;
		this.e_item = e_item;
	}


	public String getE_img() {
		return e_img;
	}


	public void setE_img(String e_img) {
		this.e_img = e_img;
	}


	public String getE_name() {
		return e_name;
	}


	public void setE_name(String e_name) {
		this.e_name = e_name;
	}


	public Date getE_date() {
		return e_date;
	}


	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}


	public String getE_start() {
		return e_start;
	}


	public void setE_start(String e_start) {
		this.e_start = e_start;
	}


	public String getE_end() {
		return e_end;
	}


	public void setE_end(String e_end) {
		this.e_end = e_end;
	}


	public String getE_subject() {
		return e_subject;
	}


	public void setE_subject(String e_subject) {
		this.e_subject = e_subject;
	}


	public int getE_idx() {
		return e_idx;
	}


	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}


	public int getE_readnum() {
		return e_readnum;
	}


	public void setE_readnum(int e_readnum) {
		this.e_readnum = e_readnum;
	}


	public int getE_item() {
		return e_item;
	}


	public void setE_item(int e_item) {
		this.e_item = e_item;
	}
	
	

}