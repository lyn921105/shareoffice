package com.wt.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.reservation.vo.MoveInVO;
import com.wt.admin.room.vo.AdminRoomVO;

@Repository
public class AdminMoveInDAOImpl implements AdminMoveInDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<MoveInVO> moveInList(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("moveInList", mvo);
	}

	@Override
	public int moveInListCnt(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("moveInListCnt", mvo);
	}

	@Override
	public int newRequest(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("newRequest", mvo);
	}

	@Override
	public MoveInVO moveInDetail(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return (MoveInVO) session.selectOne("moveInDetail", mvo);
	}

	@Override
	public int updateReqState(int r_num) {
		// TODO Auto-generated method stub
		return (Integer) session.update("updateReqState", r_num);
	}

	@Override
	public int updateReserve(AdminRoomVO rvo) {
		// TODO Auto-generated method stub
		return session.update("updateReserve", rvo);
	}


}
