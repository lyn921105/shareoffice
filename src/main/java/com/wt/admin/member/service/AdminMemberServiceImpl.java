package com.wt.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.member.dao.AdminMemberDao;
import com.wt.admin.member.vo.AdminMemberVO;


@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMemberDao;
	
	// 회원 리스트 출력
	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		List<AdminMemberVO> memberList = null;
		memberList = adminMemberDao.memberList(avo);
		return memberList;
	}

	
	// 상세 회원 정보 출력
	@Override
	public AdminMemberVO memberDetail(String c_id) {
		AdminMemberVO avo = null;
		avo = adminMemberDao.memberDetail(c_id);
		return avo;
	}


	// 회원 상태 변경 메소드
	@Override
	public int memberDisabled(AdminMemberVO rvo) {
		int result = 0;
		result = adminMemberDao.memberDisabled(rvo);
		return result;
	}


	// 전체 회원 레코드 건수 구현
	@Override
	public int memberListCnt(AdminMemberVO avo) {
		return adminMemberDao.memberListCnt(avo);
	}

	// 회원 예약 유뮤 검사
	@Override
	public int memberStatusDisabled(String c_id) {
		return adminMemberDao.memberStatusDisabled(c_id);
	}

	
}
