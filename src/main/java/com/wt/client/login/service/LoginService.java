package com.wt.client.login.service;

import com.wt.client.login.vo.LoginVO;
import com.wt.client.member.vo.MemberVO;

public interface LoginService {
	
	public LoginVO loginSuccess(LoginVO lvo);
	public String serchId(MemberVO mvo);
	public String serchIdChk(MemberVO mvo);
	public String serchPw(MemberVO mvo);
	public String serchPwChk(MemberVO mvo);
}
