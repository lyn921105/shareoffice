package com.wt.admin.reservation.vo;

import com.wt.common.vo.CommonVO;

public class VisitConsultVO extends CommonVO {
	private int v_num; // 방문번호
	private String v_name; // 방문자 이름
	private String v_phone; // 방문자 전화번호
	private String v_date; // 방문 일자
	private int v_time; // 방문 시간
	private String v_status; // 방문 상담 상태

	public int getV_num() {
		return v_num;
	}

	public void setV_num(int v_num) {
		this.v_num = v_num;
	}

	public String getV_name() {
		return v_name;
	}

	public void setV_name(String v_name) {
		this.v_name = v_name;
	}

	public String getV_phone() {
		return v_phone;
	}

	public void setV_phone(String v_phone) {
		this.v_phone = v_phone;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	public int getV_time() {
		return v_time;
	}

	public void setV_time(int v_time) {
		this.v_time = v_time;
	}

	public String getV_status() {
		return v_status;
	}

	public void setV_status(String v_status) {
		this.v_status = v_status;
	}

}
