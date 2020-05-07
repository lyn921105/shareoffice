package com.wt.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.reservation.vo.MoveInVO;

@Repository
public class MoveInDAOImpl implements MoveInDAO {
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

}
