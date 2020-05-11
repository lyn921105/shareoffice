package com.wt.client.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.wt.client.member.vo.MemberVO;
import com.wt.client.reservation.vo.ReservationVO;

public interface MemberService {
	public void join(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;

	public MemberVO logout(MemberVO vo) throws Exception;

	public void memberDelete(MemberVO vo) throws Exception;

	public int idChk(MemberVO vo) throws Exception;

	public int pwChk(MemberVO vo) throws Exception;

	public void logout(HttpSession session) throws Exception;

	public MemberVO memberModifyPwChk(MemberVO vo) throws Exception;

	public void memberModify(MemberVO vo) throws Exception;

	public int modifySuccess(MemberVO vo);

	public String serchId(MemberVO vo) throws Exception;

	public String serchPw(MemberVO vo) throws Exception;

	/*
	 * public MemberVO memberModifyPwChk(String vo);
	 */

	public List<ReservationVO> memberReserve(String c_id);

	public List<ReservationVO> memberUse(String c_id);

	public List<ReservationVO> memberDone(String c_id);

	public MemberVO memberListPwd(MemberVO mvo);

	public ReservationVO memberDetailForm(int r_num);
	
	public int memberRefund(ReservationVO rvo);
}
