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
	@Override
	public List<AdminRoomVO> roomMain() {
		List<AdminRoomVO> roomMain = null;
		roomMain = adminRoomDao.roomMain();
		return roomMain;
	}

	// 호실 상세 페이지
	@Override
	public AdminRoomVO roomDetail(AdminRoomVO avo) {
		AdminRoomVO rvo = null;
		rvo = adminRoomDao.roomDetail(avo);
		return rvo;
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
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 호실 수정 구현
	@Override
	public int roomUpdate(AdminRoomVO avo) {
		int result = 0;
		try {
			result = adminRoomDao.roomUpdate(avo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 호실 삭제 구현
	@Override
	public int roomDelete(AdminRoomVO avo) {
		int result = 0;
		try {
			result = adminRoomDao.roomDelete(avo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int fileDelete(AdminRoomVO avo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = adminRoomDao.fileDelete(avo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
