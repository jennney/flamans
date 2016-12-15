package flamans.hotel_find.model;

public class HotelRoomDTO {
	
	private String hot_num;
	private String roomname;
	private int roomprice;
	private int roomnum;
	private int room_idx;
	private String room_option;
	private int people_num;
	private int maxroom;
	
	public HotelRoomDTO() {
		super();
	}

	public HotelRoomDTO(String hot_num, String roomname, int roomprice, int roomnum, int room_idx, String room_option, int people_num, int maxroom) {
		super();
		this.hot_num = hot_num;
		this.roomname = roomname;
		this.roomprice = roomprice;
		this.roomnum = roomnum;
		this.room_idx = room_idx;
		this.room_option = room_option;
		this.people_num = people_num;
		this.maxroom = maxroom;
	}

	public String getHot_num() {
		return hot_num;
	}

	public void setHot_num(String hot_num) {
		this.hot_num = hot_num;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public int getRoomprice() {
		return roomprice;
	}

	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
	}

	public int getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}

	public String getRoom_option() {
		return room_option;
	}

	public void setRoom_option(String room_option) {
		this.room_option = room_option;
	}

	public int getPeople_num() {
		return people_num;
	}

	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}

	public int getMaxroom() {
		return maxroom;
	}

	public void setMaxroom(int maxroom) {
		this.maxroom = maxroom;
	}
	
	

}
