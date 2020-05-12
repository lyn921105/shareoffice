package com.wt.client.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.member.vo.MemberVO;
import com.wt.client.reservation.vo.ReservationVO;

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
		sql.update("memberDelete", vo);
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

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int memberModify(MemberVO vo) throws Exception {
		return sql.update("memberModify", vo);
	}

	@Override
	public int modifySuccess(MemberVO vo) {
		return sql.update("modifySuccess", vo);

	}

	@Override
	public MemberVO memberModifyPwChk(MemberVO vo) throws Exception {
		return sql.selectOne("memberModifyPwChk", vo);

	}

	@Override
	public List<ReservationVO> memberReserve(String c_id) {
		return sql.selectList("memberReserve", c_id);
	}

	@Override
	public List<ReservationVO> memberUse(String c_id) {
		return sql.selectList("memberUse", c_id);
	}

	@Override
	public List<ReservationVO> memberDone(String c_id) {
		return sql.selectList("memberDone", c_id);
	}

	@Override
	public MemberVO memberListPwd(MemberVO mvo) {
		return sql.selectOne("memberListPwd", mvo);
	}

	@Override
	public ReservationVO memberDetailForm(int r_num) {
		return sql.selectOne("memberDetailForm", r_num);
	}

	@Override
	public int memberRefund(ReservationVO rvo) {
		return sql.update("memberRefund", rvo);
	}

	/*
	 * @Override public int serchId(String name, String email) throws Exception {
	 * try { String id = null; String sql="select member_id" + "grom member_info" +
	 * "where name=?and" + "email=?"; PreparedStatement pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, name); pstmt.setString(2,
	 * email);
	 * 
	 * ResultSet rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) id= rs.getString("member_info.member_id"); }catch
	 * (SQLException) { e.printStackTrace(); } return c_id; }
	 */

}
