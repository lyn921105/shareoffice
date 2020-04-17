package com.wt.client.visit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.visit.vo.VisitReservationVO;

@Repository
public class VisitReservationDaoImpl implements VisitReservationDao {

	@Autowired
	private SqlSession session;
	
	// 방문상담 입력 구현
	@Override
	public int visitInsert(VisitReservationVO vvo) {
		return session.insert("visitInsert", vvo);
	}

	// 방문 날짜 선택시 해당 날짜 시간 처리
	@Override
	public List<VisitReservationVO> visitList(String date) {
		return session.selectList("visitList", date);
	}

}
