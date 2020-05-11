package com.wt.client.room.service;

import java.util.List;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;


public interface RoomService {
	public List<AdminRoomVO> roomStatus();
	public List<AdminRoomVO> roomListFloor(String o_room);
	public List<AdminRoomVO> roomView();
	public List<ReservationVO> roomEndSelect();
	public int roomStatusUpdate(ReservationVO rvo);
	public int roomUsableUpdate(ReservationVO rvo);
	public List<ReservationVO> roomCancel();
	public int roomCancelUpdate(ReservationVO rvo);
}
