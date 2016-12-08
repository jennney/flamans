package flamans.Bbook.model;

import java.sql.*;

public class BbookDTO {
	
	private String hos_num;	//병원번호
	private String name; 	//이름
	private String sex;	//성별
	private int age;	//나이 number
	private String nationality;	//국적
	private String surgery;	//수술부위
	private String etc;	//특이사항
	private int bookingnum;	//예약번호(number)
	private String bookingdate;	//예약일자 date
	private Date bwdate;		//예약작성일자date
	private String permit;	//예약요청
	private int doc_num;
	private String hos_Bid;
	private String cm_name;
	private String doc_img;	
	private String doc_career;
	private String doc_name;

	
	public BbookDTO() {
		super();
	}


	public BbookDTO(String hos_num, String name, String sex, int age, String nationality, String surgery, String etc,
			int bookingnum, String bookingdate, Date bwdate, String permit, int doc_num, String hos_Bid, String cm_name,
			String doc_img, String doc_career, String doc_name) {
		super();
		this.hos_num = hos_num;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.nationality = nationality;
		this.surgery = surgery;
		this.etc = etc;
		this.bookingnum = bookingnum;
		this.bookingdate = bookingdate;
		this.bwdate = bwdate;
		this.permit = permit;
		this.doc_num = doc_num;
		this.hos_Bid = hos_Bid;
		this.cm_name = cm_name;
		this.doc_img = doc_img;
		this.doc_career = doc_career;
		this.doc_name = doc_name;
	}


	public String getHos_num() {
		return hos_num;
	}


	public void setHos_num(String hos_num) {
		this.hos_num = hos_num;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getNationality() {
		return nationality;
	}


	public void setNationality(String nationality) {
		this.nationality = nationality;
	}


	public String getSurgery() {
		return surgery;
	}


	public void setSurgery(String surgery) {
		this.surgery = surgery;
	}


	public String getEtc() {
		return etc;
	}


	public void setEtc(String etc) {
		this.etc = etc;
	}


	public int getBookingnum() {
		return bookingnum;
	}


	public void setBookingnum(int bookingnum) {
		this.bookingnum = bookingnum;
	}


	public String getBookingdate() {
		return bookingdate;
	}


	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}


	public Date getBwdate() {
		return bwdate;
	}


	public void setBwdate(Date bwdate) {
		this.bwdate = bwdate;
	}


	public String getPermit() {
		return permit;
	}


	public void setPermit(String permit) {
		this.permit = permit;
	}


	public int getDoc_num() {
		return doc_num;
	}


	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}


	public String getHos_Bid() {
		return hos_Bid;
	}


	public void setHos_Bid(String hos_Bid) {
		this.hos_Bid = hos_Bid;
	}


	public String getCm_name() {
		return cm_name;
	}


	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}


	public String getDoc_img() {
		return doc_img;
	}


	public void setDoc_img(String doc_img) {
		this.doc_img = doc_img;
	}


	public String getDoc_career() {
		return doc_career;
	}


	public void setDoc_career(String doc_career) {
		this.doc_career = doc_career;
	}


	public String getDoc_name() {
		return doc_name;
	}


	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}


	
	
}
