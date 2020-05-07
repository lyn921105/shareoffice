package com.wt.admin.contract.vo;

import com.wt.common.vo.CommonVO;

public class AdminContractVO extends CommonVO {
	private int r_num;
	private String c_id;
	private String r_company;
	private String r_phone;
	private int r_member;
	private String r_regdate;
	private int r_price;
	private String r_enddate;
	private String r_reservedate;
	private String r_floor;
	private String r_room;
	private String r_status;
	private int r_refundprice;
	private String r_refunddate;

	public AdminContractVO() {
		super();
	}

	public AdminContractVO(int r_num, String c_id, String r_company, String r_phone, int r_member, String r_regdate,
			int r_price, String r_enddate, String r_reservedate, String r_floor, String r_room, String r_status,
			int r_refundprice, String r_refunddate) {
		super();
		this.r_num = r_num;
		this.c_id = c_id;
		this.r_company = r_company;
		this.r_phone = r_phone;
		this.r_member = r_member;
		this.r_regdate = r_regdate;
		this.r_price = r_price;
		this.r_enddate = r_enddate;
		this.r_reservedate = r_reservedate;
		this.r_floor = r_floor;
		this.r_room = r_room;
		this.r_status = r_status;
		this.r_refundprice = r_refundprice;
		this.r_refunddate = r_refunddate;
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

	public int getR_member() {
		return r_member;
	}

	public void setR_member(int r_member) {
		this.r_member = r_member;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getR_enddate() {
		return r_enddate;
	}

	public void setR_enddate(String r_enddate) {
		this.r_enddate = r_enddate;
	}

	public String getR_reservedate() {
		return r_reservedate;
	}

	public void setR_reservedate(String r_reservedate) {
		this.r_reservedate = r_reservedate;
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

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getR_refundprice() {
		return r_refundprice;
	}

	public void setR_refundprice(int r_refundprice) {
		this.r_refundprice = r_refundprice;
	}

	public String getR_refunddate() {
		return r_refunddate;
	}

	public void setR_refunddate(String r_refunddate) {
		this.r_refunddate = r_refunddate;
	}

}
