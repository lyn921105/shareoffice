package com.wt.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.reservation.dao.VisitConsultDAO;
import com.wt.admin.reservation.vo.VisitConsultVO;

@Service
@Transactional
public class VisitConsultServiceImpl implements VisitConsultService {

	@Autowired
	private VisitConsultDAO vDao;
	
	@Override
	public List<VisitConsultVO> adminVisitList(VisitConsultVO vvo) {
		List<VisitConsultVO> visitList=vDao.adminVisitList(vvo);
		return visitList;
	}

	@Override
	public int adminVisitListCnt(VisitConsultVO vvo) {
		// TODO Auto-generated method stub
		return vDao.adminVisitListCnt(vvo);
	}

	@Override
	public VisitConsultVO adminVisitConsultDetail(VisitConsultVO vvo) {
		// TODO Auto-generated method stub
		return vDao.adminVisitConsultDetail(vvo);
	}

	@Override
	public int updateConsultState(int v_num) {
		// TODO Auto-generated method stub
		return vDao.updateConsultState(v_num);
	}

}
