package com.wt.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.member.vo.AdminMemberVO;


@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSession session;
	
	
	// 회원 리스트 출력
	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		return session.selectList("memberList", avo);
	}

	// 상세 회원 정보 출력
	@Override
	public AdminMemberVO memberDetail(String c_id) {
		return session.selectOne("memberDetail", c_id);
	}

	// 회원 상태 변경 메소드
	@Override
	public int memberDisabled(AdminMemberVO rvo) {
		return session.update("memberDisabled", rvo);
	}

	// 회원 명수 메소드
	@Override
	public int memberListCnt(AdminMemberVO avo) {
		return (Integer)session.selectOne("memberListCnt", avo);
	}

	// 회원 예약 유무 검사
	@Override
	public int memberStatusDisabled(String c_id) {
		return (Integer)session.selectOne("memberStatusDisabled", c_id);
	}


}
