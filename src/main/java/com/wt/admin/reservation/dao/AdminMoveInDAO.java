package com.wt.admin.reservation.dao;

import java.util.List;

import com.wt.admin.reservation.vo.MoveInVO;

public interface AdminMoveInDAO {
	public List<MoveInVO> moveInList(MoveInVO mvo);
	public int moveInListCnt(MoveInVO mvo);
	public int newRequest(MoveInVO mvo);
	public MoveInVO moveInDetail(MoveInVO mvo);
	public int updateReqState(int r_num);
}
