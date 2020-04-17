package com.wt.admin.room.dao;


import java.util.List;
import java.util.Map;


import com.wt.admin.room.vo.AdminRoomVO;

public interface AdminRoomDao {
	public Map<String, AdminRoomVO> roomMain();
	public List<AdminRoomVO> roomList(String o);
	public int roomInsert(AdminRoomVO avo);
}
