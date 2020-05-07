package com.wt.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.login.vo.LoginVO;
import com.wt.client.member.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
@Autowired

private SqlSession session;
	@Override
	public LoginVO loginSuccess(LoginVO lvo) {
		return session.selectOne("loginSuccess", lvo);
	}
	@Override
	public String serchIdChk(MemberVO mvo) {
		return session.selectOne("serchIdChk", mvo);
	}
	@Override
	public String serchPwChk(MemberVO mvo) {
		return session.selectOne("serchPwChk", mvo);
	}
	public String serchId(MemberVO mvo) {
		return session.selectOne("serchId", mvo);
	}
	@Override
	public String serchPw(MemberVO mvo) {
		return session.selectOne("serchPw", mvo);
	}

	

	

}
