package com.wt.client.reservation.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<AdminRoomVO> roomPopMain() {
		return session.selectList("roomPopMain");
	}
	
	@Override
	public List<AdminRoomVO> roomPopList(AdminRoomVO rvo) {
		return session.selectList("roomPopList", rvo);
	}

	@Override
	public List<AdminRoomVO> roomPopEnd() {
		return session.selectList("roomPopEnd");
	}

	@Override
	public AdminRoomVO totalMoney(AdminRoomVO rvo) {
		return session.selectOne("totalMoney", rvo);
	}

	@Override
	public int reservationInsert(ReservationVO rvo) {
		return session.insert("reservationInsert", rvo);
	}
	
	@Override
	public int roomUsable(ReservationVO rvo) {
		return session.update("roomUsable", rvo);
	}

}
