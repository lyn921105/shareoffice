package com.wt.client.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.client.member.dao.MemberDAO;
import com.wt.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;

	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);

	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);

	}
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);

	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int pwChk(MemberVO vo) throws Exception {
		int result = dao.pwChk(vo);
		return result;
	}
}
