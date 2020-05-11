package com.wt.admin.reservation.dao;

import java.util.List;

import com.wt.admin.reservation.vo.MoveInVO;
import com.wt.admin.room.vo.AdminRoomVO;

public interface AdminMoveInDAO {
	public List<MoveInVO> moveInList(MoveInVO mvo);
	public int moveInListCnt(MoveInVO mvo);
	public int newRequest(MoveInVO mvo);
	public MoveInVO moveInDetail(MoveInVO mvo);
	public int updateReqState(int r_num);
	public int updateReserve(AdminRoomVO rvo);
}
