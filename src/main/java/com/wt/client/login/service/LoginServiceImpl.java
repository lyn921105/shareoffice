package com.wt.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.client.login.dao.LoginDAO;
import com.wt.client.login.vo.LoginVO;
import com.wt.client.member.vo.MemberVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDao;
	@Override
	public LoginVO loginSuccess(LoginVO lvo) {
		return loginDao.loginSuccess(lvo);
	}
	@Override
	public String serchIdChk(MemberVO mvo) {
		return loginDao.serchIdChk(mvo);
	}
	@Override
	public String serchPwChk(MemberVO mvo) {
		return loginDao.serchPwChk(mvo);
	}
	@Override
	public String serchId(MemberVO mvo) {
		return loginDao.serchId(mvo);
	}
	@Override
	public String serchPw(MemberVO mvo) {
		return loginDao.serchPw(mvo);
	}
}
