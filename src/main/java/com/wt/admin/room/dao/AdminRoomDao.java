package com.wt.admin.room.dao;


import java.util.List;
import java.util.Map;


import com.wt.admin.room.vo.AdminRoomVO;

public interface AdminRoomDao {
	public List<AdminRoomVO> roomMain();
	public List<AdminRoomVO> roomList(String o);
	public int roomInsert(AdminRoomVO avo);
	public AdminRoomVO roomDetail(AdminRoomVO avo);
	public int roomUpdate(AdminRoomVO avo);
	public int roomDelete(AdminRoomVO avo);
	public int fileDelete(AdminRoomVO avo);
}
