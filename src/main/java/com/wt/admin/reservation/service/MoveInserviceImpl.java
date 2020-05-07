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
		// 정렬에 대한 기본 값 설정
		if (mvo.getOrder_by() == null) {
			mvo.setOrder_by("r_reservedate");
		}
		if (mvo.getOrder_sc() == null) {
			mvo.setOrder_sc("DESC");
		}

		List<MoveInVO> moveInList = mDao.moveInList(mvo);
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

	@Override
	public int updateReqState(int r_num) {
		// TODO Auto-generated method stub
		return mDao.updateReqState(r_num);
	}

}
