package com.wt.client.reservation.vo;

public class ReservationVO {
	private int r_num; // 예약 번호
	private String c_id; // 회원 아이디
	private String r_company; // 입주사명
	private String r_phone; // 핸드폰번호
	private String r_member; // 인원수
	private String r_regdate; // 예약 등록일
	private String r_price; // 이용 금액
	private String r_endDate; // 만기날짜
	private String r_reserveDate; // 입주 예정 날짜
	private String r_floor; // 층
	private String r_room; // 호실
	private String r_status; // 예약 상태

	public ReservationVO() {
		super();
	}

	public ReservationVO(String r_endDate, String r_floor, String r_room, String r_status) {
		super();
		this.r_endDate = r_endDate;
		this.r_floor = r_floor;
		this.r_room = r_room;
		this.r_status = r_status;
	}
	
	public ReservationVO(int r_num, String r_floor, String r_room, String r_status) {
		super();
		this.r_num = r_num;
		this.r_floor = r_floor;
		this.r_room = r_room;
		this.r_status = r_status;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getR_company() {
		return r_company;
	}

	public void setR_company(String r_company) {
		this.r_company = r_company;
	}

	public String getR_phone() {
		return r_phone;
	}

	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}

	public String getR_member() {
		return r_member;
	}

	public void setR_member(String r_member) {
		this.r_member = r_member;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getR_price() {
		return r_price;
	}

	public void setR_price(String r_price) {
		this.r_price = r_price;
	}

	public String getR_endDate() {
		return r_endDate;
	}

	public void setR_endDate(String r_endDate) {
		this.r_endDate = r_endDate;
	}

	public String getR_reserveDate() {
		return r_reserveDate;
	}

	public void setR_reserveDate(String r_reserveDate) {
		this.r_reserveDate = r_reserveDate;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public String getR_floor() {
		return r_floor;
	}

	public void setR_floor(String r_floor) {
		this.r_floor = r_floor;
	}

	public String getR_room() {
		return r_room;
	}

	public void setR_room(String r_room) {
		this.r_room = r_room;
	}

	@Override
	public String toString() {
		return "ReservationVO [r_num=" + r_num + ", c_id=" + c_id + ", r_company=" + r_company + ", r_phone=" + r_phone
				+ ", r_member=" + r_member + ", r_regdate=" + r_regdate + ", r_price=" + r_price + ", r_endDate="
				+ r_endDate + ", r_reserveDate=" + r_reserveDate + ", r_floor=" + r_floor + ", r_room=" + r_room
				+ ", r_status=" + r_status + "]";
	}

}
