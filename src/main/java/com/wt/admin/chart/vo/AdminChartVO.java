package com.wt.admin.chart.vo;

public class AdminChartVO {
	private int v_count;
	private int v_time;
	private int r_count;
	private int r_member;

	public AdminChartVO() {
		super();
	}

	public AdminChartVO(int v_count, int v_time, int r_count, int r_member) {
		super();
		this.v_count = v_count;
		this.v_time = v_time;
		this.r_count = r_count;
		this.r_member = r_member;
	}

	public int getV_count() {
		return v_count;
	}

	public void setV_count(int v_count) {
		this.v_count = v_count;
	}

	public int getV_time() {
		return v_time;
	}

	public void setV_time(int v_time) {
		this.v_time = v_time;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public int getR_member() {
		return r_member;
	}

	public void setR_member(int r_member) {
		this.r_member = r_member;
	}

}
