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
   private String room;
   private String people;
   private String roomselect;
   private String permit;
   private String bookingnum;
                    
   public Hot_bookDTO() {
      super();
   }

   
   public Hot_bookDTO(String hot_num, String name, String sex, String nationality, String checkin,
         String checkout, String card, Date bookingdate, String room, String people, String roomselect,
         String permit, String bookingnum) {
      super();
      this.hot_num = hot_num;
      this.name = name;
      this.sex = sex;
      this.nationality = nationality;
      this.checkin = checkin;
      this.checkout = checkout;
      this.card = card;
      this.bookingdate = bookingdate;
      this.room = room;
      this.people = people;
      this.roomselect = roomselect;
      this.permit = permit;
      this.bookingnum = bookingnum;
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


   public String getBookingnum() {
      return bookingnum;
   }


   public void setBookingnum(String bookingnum) {
      this.bookingnum = bookingnum;
       
      }
      
}