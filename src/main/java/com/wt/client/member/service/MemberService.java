package com.wt.client.member.service;

import com.wt.client.member.vo.MemberVO;

public interface MemberService {
	public void join(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public int pwChk(MemberVO vo) throws Exception;

}
