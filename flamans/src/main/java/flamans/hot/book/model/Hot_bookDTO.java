package flamans.hot.book.model;

import java.sql.Date;

public class Hot_bookDTO {
   private String hot_num;
   private String name;
   private String sex;
   private String nationality;
   private String checkin;
   private String checkout;
   private String card;
   private Date bookingdate;
   private String people;
   private int roomselect;
   private String permit;
   private String bookingnum;
   private int room_idx;
                    
   public Hot_bookDTO() {
      super();
   }

	public Hot_bookDTO(String hot_num, String name, String sex, String nationality, String checkin, String checkout,
			String card, Date bookingdate, String people, int roomselect, String permit, String bookingnum, int room_idx) {
		super();
		this.hot_num = hot_num;
		this.name = name;
		this.sex = sex;
		this.nationality = nationality;
		this.checkin = checkin;
		this.checkout = checkout;
		this.card = card;
		this.bookingdate = bookingdate;
		this.people = people;
		this.roomselect = roomselect;
		this.permit = permit;
		this.bookingnum = bookingnum;
		this.room_idx = room_idx;
	}
	
	public String getHot_num() {
		return hot_num;
	}
	
	public void setHot_num(String hot_num) {
		this.hot_num = hot_num;
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
	
	public String getNationality() {
		return nationality;
	}
	
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public String getCheckin() {
		return checkin;
	}
	
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	
	public String getCheckout() {
		return checkout;
	}
	
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
	public String getCard() {
		return card;
	}
	
	public void setCard(String card) {
		this.card = card;
	}
	
	public Date getBookingdate() {
		return bookingdate;
	}
	
	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}
	
	public String getPeople() {
		return people;
	}
	
	public void setPeople(String people) {
		this.people = people;
	}
	
	public int getRoomselect() {
		return roomselect;
	}
	
	public void setRoomselect(int roomselect) {
		this.roomselect = roomselect;
	}
	
	public String getPermit() {
		return permit;
	}
	
	public void setPermit(String permit) {
		this.permit = permit;
	}
	
	public String getBookingnum() {
		return bookingnum;
	}
	
	public void setBookingnum(String bookingnum) {
		this.bookingnum = bookingnum;
	}
	
	public int getRoom_idx() {
		return room_idx;
	}
	
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}

}