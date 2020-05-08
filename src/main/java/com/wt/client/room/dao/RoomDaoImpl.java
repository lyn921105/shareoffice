package com.wt.client.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.room.vo.AdminRoomVO;


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

}
