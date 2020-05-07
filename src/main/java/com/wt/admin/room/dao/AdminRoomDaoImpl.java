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
	@Override
	public List<AdminRoomVO> roomMain(){
		return session.selectList("roomMain");
	}
	
	// 호실 상세 페이지
	@Override
	public AdminRoomVO roomDetail(AdminRoomVO avo) {
		return session.selectOne("roomDetail", avo);
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

	// 호실 수정 구현
	@Override
	public int roomUpdate(AdminRoomVO avo) {
		return session.update("roomUpdate", avo);
	}

	@Override
	public int roomDelete(AdminRoomVO avo) {
		return session.delete("roomDelete", avo);
	}

	@Override
	public int fileDelete(AdminRoomVO avo) {
		return session.update("fileDelete", avo);
	}

}
