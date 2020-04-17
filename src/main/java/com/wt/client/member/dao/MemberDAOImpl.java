package com.wt.client.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired 
	private SqlSession sql;

	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("join", vo);

	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("login", vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberDelete", vo);
	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("idChk", vo);
		return result;
	}
	@Override
	public int pwChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("pwChk", vo);
		return result;
	}

}
