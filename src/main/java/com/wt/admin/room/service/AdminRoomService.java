package com.wt.admin.room.service;


import java.util.List;
import java.util.Map;

import com.wt.admin.room.vo.AdminRoomVO;

public interface AdminRoomService {
	public List<AdminRoomVO> roomMain();
	public List<AdminRoomVO> roomList(String o_room);
	public int roomInsert(AdminRoomVO avo);
	public AdminRoomVO roomDetail(AdminRoomVO avo);
	public int roomUpdate(AdminRoomVO avo);
	public int roomDelete(AdminRoomVO avo);
	public int fileDelete(AdminRoomVO avo);
}
