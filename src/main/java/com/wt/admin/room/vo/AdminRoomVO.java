package com.wt.admin.room.vo;

import org.springframework.web.multipart.MultipartFile;

public class AdminRoomVO {
	private int o_no; // 호실 시퀀스
	private String o_floor; // 호실 층 정보
	private String o_room; // 방번호
	private int o_price; // 가격
	private int o_member; // 인원수
	private String o_info; // 기본정보(창측,내측)
	private MultipartFile thumbfile; // 대표사진 첨부파일
	private String o_thumb; // 대표사진
	private MultipartFile file1; // 첨부파일
	private String o_image1; // 이미지1
	private MultipartFile file2; // 첨부파일
	private String o_image2; // 이미지2
	private MultipartFile file3; // 첨부파일
	private String o_image3; // 이미지3
	private String o_status; // 현재 상태(사용 가능/불가능)
	private String r_endDate; // 사용자페이지 만기날짜 구현
	private String r_status; // 사용자페이지 예약상태 구별
	private String o_reserve;

	public AdminRoomVO() {
		super();
	}

	public AdminRoomVO(int o_no, String o_floor, String o_room, int o_price, int o_member, String o_info,
			MultipartFile thumbfile, String o_thumb, MultipartFile file1, String o_image1, MultipartFile file2,
			String o_image2, MultipartFile file3, String o_image3, String o_status, String r_endDate, String r_status,
			String o_reserve) {
		super();
		this.o_no = o_no;
		this.o_floor = o_floor;
		this.o_room = o_room;
		this.o_price = o_price;
		this.o_member = o_member;
		this.o_info = o_info;
		this.thumbfile = thumbfile;
		this.o_thumb = o_thumb;
		this.file1 = file1;
		this.o_image1 = o_image1;
		this.file2 = file2;
		this.o_image2 = o_image2;
		this.file3 = file3;
		this.o_image3 = o_image3;
		this.o_status = o_status;
		this.r_endDate = r_endDate;
		this.r_status = r_status;
		this.o_reserve = o_reserve;
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

	public MultipartFile getThumbfile() {
		return thumbfile;
	}

	public void setThumbfile(MultipartFile thumbfile) {
		this.thumbfile = thumbfile;
	}

	public String getO_thumb() {
		return o_thumb;
	}

	public void setO_thumb(String o_thumb) {
		this.o_thumb = o_thumb;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public String getO_image1() {
		return o_image1;
	}

	public void setO_image1(String o_image1) {
		this.o_image1 = o_image1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public String getO_image2() {
		return o_image2;
	}

	public void setO_image2(String o_image2) {
		this.o_image2 = o_image2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
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

	public String getR_endDate() {
		return r_endDate;
	}

	public void setR_endDate(String r_endDate) {
		this.r_endDate = r_endDate;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public String getO_reserve() {
		return o_reserve;
	}

	public void setO_reserve(String o_reserve) {
		this.o_reserve = o_reserve;
	}

}
