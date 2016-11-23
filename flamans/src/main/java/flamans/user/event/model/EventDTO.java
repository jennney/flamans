package flamans.user.event.model;

import java.sql.Date;

public class EventDTO {

	private String e_img;
	private String e_name;
	private Date e_date;
	private Date e_start;
	private Date e_end;
	private String e_subject;
	private int e_idx;
	private int e_readnum;
	
	public EventDTO() {
		super();
	}

	public EventDTO(String e_img, String e_name, Date e_date, Date e_start, Date e_end, String e_subject, int e_idx, int e_readnum) {
		super();
		this.e_img = e_img;
		this.e_name = e_name;
		this.e_date = e_date;
		this.e_start = e_start;
		this.e_end = e_end;
		this.e_subject = e_subject;
		this.e_idx = e_idx;
		this.e_readnum = e_readnum;
	
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

	public Date getE_start() {
		return e_start;
	}

	public void setE_start(Date e_start) {
		this.e_start = e_start;
	}

	public Date getE_end() {
		return e_end;
	}

	public void setE_end(Date e_end) {
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
	
}
