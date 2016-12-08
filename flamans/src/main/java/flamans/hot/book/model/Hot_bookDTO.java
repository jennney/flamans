package flamans.hot.book.model;

import java.sql.Date;

public class Hot_bookDTO {

	private String hot_num;
	private String writer;
	private String sex;
	private String age;
	private String nationality;
	private Date checkin;
	private Date checkout;
	private int card;
	private Date bookingdate;
	private String hot_optiono;
	private String room;
	private String people;
	private String roomselect;
	private String permit;
	private int booingnum;
	
	public Hot_bookDTO() {
		super();
	}

	public Hot_bookDTO(String hot_num, String writer, String sex, String age, String nationality, Date checkin,
			Date checkout, int card, Date bookingdate, String hot_optiono, String room, String people,
			String roomselect, String permit, int booingnum) {
		super();
		this.hot_num = hot_num;
		this.writer = writer;
		this.sex = sex;
		this.age = age;
		this.nationality = nationality;
		this.checkin = checkin;
		this.checkout = checkout;
		this.card = card;
		this.bookingdate = bookingdate;
		this.hot_optiono = hot_optiono;
		this.room = room;
		this.people = people;
		this.roomselect = roomselect;
		this.permit = permit;
		this.booingnum = booingnum;
	}

	public String getHot_num() {
		return hot_num;
	}

	public void setHot_num(String hot_num) {
		this.hot_num = hot_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public int getCard() {
		return card;
	}

	public void setCard(int card) {
		this.card = card;
	}

	public Date getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}

	public String getHot_optiono() {
		return hot_optiono;
	}

	public void setHot_optiono(String hot_optiono) {
		this.hot_optiono = hot_optiono;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getRoomselect() {
		return roomselect;
	}

	public void setRoomselect(String roomselect) {
		this.roomselect = roomselect;
	}

	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}

	public int getBooingnum() {
		return booingnum;
	}

	public void setBooingnum(int booingnum) {
		this.booingnum = booingnum;
	}
	
	
}
