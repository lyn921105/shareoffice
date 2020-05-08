package com.wt.client.room.service;

import java.util.List;

import com.wt.admin.room.vo.AdminRoomVO;


public interface RoomService {
	public List<AdminRoomVO> roomStatus();
	public List<AdminRoomVO> roomListFloor(String o_room);
	public List<AdminRoomVO> roomView();
}
