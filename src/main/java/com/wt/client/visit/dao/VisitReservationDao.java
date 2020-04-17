package com.wt.client.visit.dao;

import java.util.List;


import com.wt.client.visit.vo.VisitReservationVO;

public interface VisitReservationDao {
	public int visitInsert(VisitReservationVO vvo);
	public List<VisitReservationVO> visitList(String date);
}
