package com.wt.client.reservation.dao;

import java.util.List;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;

public interface ReservationDao {
	public List<AdminRoomVO> roomPopMain();
	public List<AdminRoomVO> roomPopList(AdminRoomVO rvo);
	public List<AdminRoomVO> roomPopEnd();
	public AdminRoomVO totalMoney(AdminRoomVO rvo);
	public int reservationInsert(ReservationVO rvo);
	public int roomUsable(ReservationVO rvo);
}
