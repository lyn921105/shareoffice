package com.wt.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wt.admin.reservation.dao.MoveInDAO;
import com.wt.admin.reservation.vo.MoveInVO;

@Service
public class MoveInserviceImpl implements MoveInService {
	@Autowired
	private MoveInDAO mDao;

	@Override
	public List<MoveInVO> moveInList(MoveInVO mvo) {
		List<MoveInVO> moveInList=mDao.moveInList(mvo);
		return moveInList;
	}

	@Override
	public int moveInListCnt(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return mDao.moveInListCnt(mvo);
	}

	@Override
	public int newRequest(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return mDao.newRequest(mvo);
	}

	@Override
	public MoveInVO moveInDetail(MoveInVO mvo) {
		// TODO Auto-generated method stub
		return mDao.moveInDetail(mvo);
	}

}
