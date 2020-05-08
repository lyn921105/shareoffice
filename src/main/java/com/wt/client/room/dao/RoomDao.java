package com.wt.client.room.dao;

import java.util.List;

import com.wt.admin.room.vo.AdminRoomVO;


public interface RoomDao {
	public List<AdminRoomVO> roomStatus();
	public List<AdminRoomVO> roomListFloor(String o_room);
	public List<AdminRoomVO> roomView();
}
