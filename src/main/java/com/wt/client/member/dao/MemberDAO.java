package com.wt.client.member.dao;

<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpSession;

import com.wt.client.member.vo.MemberVO;
import com.wt.client.reservation.vo.ReservationVO;
=======
import com.wt.client.member.vo.MemberVO;
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4

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
	
<<<<<<< HEAD
	public List<ReservationVO> memberReserve(String c_id);
	public List<ReservationVO> memberUse(String c_id);
	public List<ReservationVO> memberDone(String c_id);

	int memberModify(MemberVO vo) throws Exception;

	int modifySuccess(MemberVO vo);

	int memberModifyPwChk(String k) throws Exception;

	public void logout(HttpSession session);

	public MemberVO memberListPwd(MemberVO mvo);
=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4

}
