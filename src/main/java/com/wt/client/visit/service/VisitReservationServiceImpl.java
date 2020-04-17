package com.wt.client.visit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.client.visit.dao.VisitReservationDao;
import com.wt.client.visit.vo.VisitReservationVO;

@Service
@Transactional
public class VisitReservationServiceImpl implements VisitReservationService {

	@Autowired
	private VisitReservationDao visitReservationDao;
	
	// 방문상담 입력 구현
	@Override
	public int visitInsert(VisitReservationVO vvo) {
		int result = 0;
		
		try {
			result = visitReservationDao.visitInsert(vvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}

	// 방문 날짜 선택시 해당 날짜 시간 처리
	@Override
	public List<VisitReservationVO> visitList(String date) {
		List<VisitReservationVO> visitList = visitReservationDao.visitList(date);
		return visitList;
	}

}
