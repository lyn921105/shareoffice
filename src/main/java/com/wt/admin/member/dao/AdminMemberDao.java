package com.wt.admin.member.dao;

import java.util.List;

import com.wt.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public List<AdminMemberVO> memberList();

	public AdminMemberVO memberDetail(String c_id);

	public int memberDisabled(AdminMemberVO rvo);

	

}
