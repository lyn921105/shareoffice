package com.wt.client.reservation.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.dao.ReservationDao;
import com.wt.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Override
	public List<AdminRoomVO> roomPopMain() {
		List<AdminRoomVO> roomMain = null;
		roomMain = reservationDao.roomPopMain();
		return roomMain;
	}
	
	@Override
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public List<AdminRoomVO> roomPopList(AdminRoomVO rvo) {
		List<AdminRoomVO> roomList = null;
		roomList = reservationDao.roomPopList(rvo);
		return roomList;
	}

	@Override
	public List<AdminRoomVO> roomPopEnd() {
		List<AdminRoomVO> roomPopEnd = reservationDao.roomPopEnd();
		return roomPopEnd;
	}

	@Override
	public AdminRoomVO totalMoney(AdminRoomVO rvo) {
		AdminRoomVO room = reservationDao.totalMoney(rvo);
		return room;
	}

	@Override
	public int reservationInsert(ReservationVO rvo) {
		return reservationDao.reservationInsert(rvo);
	}

	@Override
	public int roomUsable(ReservationVO rvo) {
		return reservationDao.roomUsable(rvo);
	}
	
}
