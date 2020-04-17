package com.wt.admin.room.vo;

public class AdminRoomVO {
	private int o_no; // 호실 시퀀스
	private String o_floor; // 호실 층 정보
	private String o_room; // 방번호
	private int o_price; // 가격
	private int o_member; // 인원수
	private String o_info; // 기본정보(창측,내측)
	private String o_thumb; // 대표사진
	private String o_image1; // 이미지1
	private String o_image2; // 이미지2
	private String o_image3; // 이미지3
	private String o_status; // 현재 상태(사용 가능/불가능)

	public AdminRoomVO() {
		super();
	}

	public AdminRoomVO(int o_no, String o_floor, String o_room, int o_price, int o_member, String o_info,
			String o_thumb, String o_image1, String o_image2, String o_image3, String o_status) {
		super();
		this.o_no = o_no;
		this.o_floor = o_floor;
		this.o_room = o_room;
		this.o_price = o_price;
		this.o_member = o_member;
		this.o_info = o_info;
		this.o_thumb = o_thumb;
		this.o_image1 = o_image1;
		this.o_image2 = o_image2;
		this.o_image3 = o_image3;
		this.o_status = o_status;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_floor() {
		return o_floor;
	}

	public void setO_floor(String o_floor) {
		this.o_floor = o_floor;
	}

	public String getO_room() {
		return o_room;
	}

	public void setO_room(String o_room) {
		this.o_room = o_room;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public int getO_member() {
		return o_member;
	}

	public void setO_member(int o_member) {
		this.o_member = o_member;
	}

	public String getO_info() {
		return o_info;
	}

	public void setO_info(String o_info) {
		this.o_info = o_info;
	}

	public String getO_thumb() {
		return o_thumb;
	}

	public void setO_thumb(String o_thumb) {
		this.o_thumb = o_thumb;
	}

	public String getO_image1() {
		return o_image1;
	}

	public void setO_image1(String o_image1) {
		this.o_image1 = o_image1;
	}

	public String getO_image2() {
		return o_image2;
	}

	public void setO_image2(String o_image2) {
		this.o_image2 = o_image2;
	}

	public String getO_image3() {
		return o_image3;
	}

	public void setO_image3(String o_image3) {
		this.o_image3 = o_image3;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

}
