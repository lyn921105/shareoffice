package com.wt.admin.login.vo;

public class AdminLoginVO {
	private String a_id = "";
	private String a_passwd = "";

	public AdminLoginVO() {
	}

	public AdminLoginVO(String a_id, String a_passwd) {
		super();
		this.a_id = a_id;
		this.a_passwd = a_passwd;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_passwd() {
		return a_passwd;
	}

	public void setA_passwd(String a_passwd) {
		this.a_passwd = a_passwd;
	}

}
