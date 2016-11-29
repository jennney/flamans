package flamans.qna.model;

import java.sql.Date;

public class QnaDTO {
	
	private String qna_writer; 
	private String qna_subject; 
	private String qna_content;
	private Date qna_writedate;
	private String qna_item;
	private String qna_pwd;
	private String qna_secret;
	private String qna_findname;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	private int qna_idx; 
	private String qna_kind;
	
	public QnaDTO() {
		super();
	}

	public QnaDTO(String qna_writer, String qna_subject, String qna_content, Date qna_writedate, String qna_item,
			String qna_pwd, String qna_secret, String qna_findname, int readnum, int ref, int lev, int sunbun,
			int qna_idx, String qna_kind) {
		super();
		this.qna_writer = qna_writer;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_writedate = qna_writedate;
		this.qna_item = qna_item;
		this.qna_pwd = qna_pwd;
		this.qna_secret = qna_secret;
		this.qna_findname = qna_findname;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.qna_idx = qna_idx;
		this.qna_kind = qna_kind;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_writedate() {
		return qna_writedate;
	}

	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}

	public String getQna_item() {
		return qna_item;
	}

	public void setQna_item(String qna_item) {
		this.qna_item = qna_item;
	}

	public String getQna_pwd() {
		return qna_pwd;
	}

	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}

	public String getQna_secret() {
		return qna_secret;
	}

	public void setQna_secret(String qna_secret) {
		this.qna_secret = qna_secret;
	}

	public String getQna_findname() {
		return qna_findname;
	}

	public void setQna_findname(String qna_findname) {
		this.qna_findname = qna_findname;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getQna_kind() {
		return qna_kind;
	}

	public void setQna_kind(String qna_kind) {
		this.qna_kind = qna_kind;
	}
	
}
