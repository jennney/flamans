package flamans.hot_comment_grade.model;

import java.sql.Date;

public class HotCommentGradeDTO {
	
	private String c_number;
	private int c_grade;
	private String c_coment;
	private String c_writer;
	private java.sql.Date c_date;
	
	public HotCommentGradeDTO() {
		super();
	}
	public HotCommentGradeDTO(String c_number, int c_grade, String c_coment, String c_writer, Date c_date) {
		super();
		this.c_number = c_number;
		this.c_grade = c_grade;
		this.c_coment = c_coment;
		this.c_writer = c_writer;
		this.c_date = c_date;
	}
	public String getC_number() {
		return c_number;
	}
	public void setC_number(String c_number) {
		this.c_number = c_number;
	}
	public int getC_grade() {
		return c_grade;
	}
	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}
	public String getC_coment() {
		return c_coment;
	}
	public void setC_coment(String c_coment) {
		this.c_coment = c_coment;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public java.sql.Date getC_date() {
		return c_date;
	}
	public void setC_date(java.sql.Date c_date) {
		this.c_date = c_date;
	}
	
	
}
