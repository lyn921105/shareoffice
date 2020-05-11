package com.wt.client.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;


@Repository
public class RoomDaoImpl implements RoomDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<AdminRoomVO> roomStatus() {
		return session.selectList("roomStatus");
	}

	@Override
	public List<AdminRoomVO> roomListFloor(String o_floor) {
		return session.selectList("roomListFloor", o_floor);
	}

	@Override
	public List<AdminRoomVO> roomView() {
		return session.selectList("roomView");
	}

	@Override
	public List<ReservationVO> roomEndSelect() {
		return session.selectList("roomEndSelect");
	}
	
	@Override
	public int roomStatusUpdate(ReservationVO rvo) {
		return session.update("roomStatusUpdate", rvo);
	}

	@Override
	public int roomUsableUpdate(ReservationVO rvo) {
		return session.update("roomUsableUpdate", rvo);
	}

	@Override
	public List<ReservationVO> roomCancel() {
		return session.selectList("roomCancel");
	}

	@Override
	public int roomCancelUpdate(ReservationVO rvo) {
		return session.update("roomCancelUpdate", rvo);
	}


}
