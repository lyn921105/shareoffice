package com.wt.admin.room.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.room.vo.AdminRoomVO;

@Repository
public class AdminRoomDaoImpl implements AdminRoomDao {

	@Autowired
	private SqlSession session;
	
	// 호실 메인 페이지
	public Map<String, AdminRoomVO> roomMain(){
		return session.selectMap("roomMain", "o_room");
	}
	
	// 호실 목록 구현
	@Override
	public List<AdminRoomVO> roomList(String o) {
		return session.selectList("roomList", o);
	}

	// 호실 등록 구현
	@Override
	public int roomInsert(AdminRoomVO avo) {
		return session.insert("roomInsert", avo);
	}

}
