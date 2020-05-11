package com.wt.client.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;
import com.wt.client.room.dao.RoomDao;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDao roomDao;
	
	@Override
	public List<AdminRoomVO> roomStatus() {
		List<AdminRoomVO> roomMain = null;
		roomMain = roomDao.roomStatus();
		return roomMain;
	}

	@Override
	public List<AdminRoomVO> roomListFloor(String o_floor) {
		List<AdminRoomVO> roomList = null;
		roomList = roomDao.roomListFloor(o_floor);
		return roomList;
	}

	@Override
	public List<AdminRoomVO> roomView() {
		List<AdminRoomVO> roomView = null;
		roomView = roomDao.roomView();
		return roomView;
	}

	@Override
	public List<ReservationVO> roomEndSelect() {
		return roomDao.roomEndSelect();
	}
	
	@Override
	public int roomStatusUpdate(ReservationVO rvo) {
		return roomDao.roomStatusUpdate(rvo);
	}

	@Override
	public int roomUsableUpdate(ReservationVO rvo) {
		return roomDao.roomUsableUpdate(rvo);
	}

	@Override
	public List<ReservationVO> roomCancel() {
		return roomDao.roomCancel();
	}

	@Override
	public int roomCancelUpdate(ReservationVO rvo) {
		return roomDao.roomCancelUpdate(rvo);
	}


}
