package com.wt.client.visit.service;

import java.util.List;


import com.wt.client.visit.vo.VisitReservationVO;

public interface VisitReservationService {
	public int visitInsert(VisitReservationVO vvo);
	public List<VisitReservationVO> visitList(String date);
}
