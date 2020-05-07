package com.wt.admin.member.vo;

import com.wt.common.vo.CommonVO;

public class AdminMemberVO extends CommonVO {
	public String c_id; // 회원 아이디
	public String c_pwd; // 회원 비밀번호
	public String c_email; // 회원 이메일
	public String c_name; // 회원 이름
	public String c_phone; // 회원 전화번호
	public String c_regdate; // 회원 가입일
	public String c_disabled; // 회원 상태

	public AdminMemberVO() {
		super();
	}

	public AdminMemberVO(String c_id, String c_pwd, String c_email, String c_name, String c_phone, String c_regdate,
			String c_disabled) {
		super();
		this.c_id = c_id;
		this.c_pwd = c_pwd;
		this.c_email = c_email;
		this.c_name = c_name;
		this.c_phone = c_phone;
		this.c_regdate = c_regdate;
		this.c_disabled = c_disabled;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_pwd() {
		return c_pwd;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	public String getC_disabled() {
		return c_disabled;
	}

	public void setC_disabled(String c_disabled) {
		this.c_disabled = c_disabled;
	}

}
