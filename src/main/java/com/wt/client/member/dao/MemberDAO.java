package com.wt.client.member.dao;

import com.wt.client.member.vo.MemberVO;

public interface MemberDAO {
	//회원가입
	public void join(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	//회원탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	//중복체크
	public int idChk(MemberVO vo) throws Exception;
	//패스워드 체크
	public int pwChk (MemberVO vo) throws Exception;
	

}
