package com.wt.admin.member.dao;

import java.util.List;

import com.wt.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public List<AdminMemberVO> memberList(AdminMemberVO avo);

	public AdminMemberVO memberDetail(String c_id);

	public int memberDisabled(AdminMemberVO rvo);

	public int memberListCnt(AdminMemberVO avo);

	public int memberStatusDisabled(String c_id);

}
