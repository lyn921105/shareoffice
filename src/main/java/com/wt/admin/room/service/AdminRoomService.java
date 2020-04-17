package com.wt.admin.room.service;


import java.util.List;
import java.util.Map;

import com.wt.admin.room.vo.AdminRoomVO;

public interface AdminRoomService {
	public Map<String, AdminRoomVO> roomMain();
	public List<AdminRoomVO> roomList(String o_room);
	public int roomInsert(AdminRoomVO avo);
}
