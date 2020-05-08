package com.wt.admin.reservation.service;

import java.util.List;

import com.wt.admin.reservation.vo.VisitConsultVO;

public interface AdminVisitConsultService {
	public List<VisitConsultVO> adminVisitList(VisitConsultVO vvo);

	public int adminVisitListCnt(VisitConsultVO vvo);

	public VisitConsultVO adminVisitConsultDetail(VisitConsultVO vvo);

	public int updateConsultState(int v_num);
}
