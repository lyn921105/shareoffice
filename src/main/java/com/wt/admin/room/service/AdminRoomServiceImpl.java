package com.wt.admin.room.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.room.dao.AdminRoomDao;
import com.wt.admin.room.vo.AdminRoomVO;

@Service
@Transactional
public class AdminRoomServiceImpl implements AdminRoomService {

	@Autowired
	private AdminRoomDao adminRoomDao;
	
	
	// 호실 메인 페이지(1페이지)
	public Map<String, AdminRoomVO> roomMain(){
		Map<String, AdminRoomVO> roomMain = null;
		roomMain = adminRoomDao.roomMain();
		return roomMain;
	}
	
	// 호실 목록 구현
	@Override
	public List<AdminRoomVO> roomList(String o) {
		List<AdminRoomVO> roomList = null;
		roomList = adminRoomDao.roomList(o);
		return roomList;
	}

	// 호실 등록 구현
	@Override
	public int roomInsert(AdminRoomVO avo) {
		int result = 0;
		try {
			result = adminRoomDao.roomInsert(avo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	

}
