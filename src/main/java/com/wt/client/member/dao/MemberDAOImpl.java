package com.wt.client.member.dao;


<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpSession;

=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.member.vo.MemberVO;
<<<<<<< HEAD
import com.wt.client.reservation.vo.ReservationVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
=======

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired 
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	private SqlSession sql;

	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("join", vo);

	}
<<<<<<< HEAD

=======
	
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("login", vo);
	}
<<<<<<< HEAD

=======
	
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberDelete", vo);
	}
<<<<<<< HEAD

=======
	
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("idChk", vo);
		return result;
	}
<<<<<<< HEAD

=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	@Override
	public int pwChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("pwChk", vo);
		return result;
	}

<<<<<<< HEAD
	@Override
	public void logout(HttpSession session) {
		System.out.println("로그아웃");
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
	public int memberModifyPwChk(String k) throws Exception {
		return sql.update("memberModifyChk", k);
		
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

	/*@Override
	public int serchId(String name, String email) throws Exception {
		try {
			String id = null;
			String sql="select member_id" + "grom member_info" + "where name=?and" + "email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				id= rs.getString("member_info.member_id");
		}catch (SQLException) {
			e.printStackTrace();
		}
		return c_id;
	}*/
	
	
=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
}
