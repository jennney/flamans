package flamans.notice.model;



import java.sql.Date;


public class NoticeDTO {
	
	private String no_subject;
	private String no_content;
	private Date no_writedate;
	private String no_file1;
	private int no_idx;
	private int no_readnum;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(String no_subject, String no_content, Date no_writedate, String no_file1,
			int no_idx, int no_readnum) {
		super();
		this.no_subject = no_subject;
		this.no_content = no_content;
		this.no_writedate = no_writedate;
		this.no_file1 = no_file1;
		this.no_idx = no_idx;
		this.no_readnum = no_readnum;
	}

	public String getNo_subject() {
		return no_subject;
	}

	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}

	public String getNo_content() {
		return no_content;
	}

	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}

	public Date getNo_writedate() {
		return no_writedate;
	}

	public void setNo_writedate(Date no_writedate) {
		this.no_writedate = no_writedate;
	}

	public String getNo_file1() {
		return no_file1;
	}

	public void setNo_file1(String no_file1) {
		this.no_file1 = no_file1;
	}

	public int getNo_idx() {
		return no_idx;
	}

	public void setNo_idx(int no_idx) {
		this.no_idx = no_idx;
	}

	public int getNo_readnum() {
		return no_readnum;
	}

	public void setNo_readnum(int no_readnum) {
		this.no_readnum = no_readnum;
	}
	
}
