package com.wt.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.reservation.dao.AdminVisitConsultDAO;
import com.wt.admin.reservation.vo.MoveInVO;
import com.wt.admin.reservation.vo.VisitConsultVO;

@Service
@Transactional
public class AdminVisitConsultServiceImpl implements AdminVisitConsultService {

	@Autowired
	private AdminVisitConsultDAO vDao;

	@Override
	public List<VisitConsultVO> adminVisitList(VisitConsultVO vvo) {
		// 정렬에 대한 기본 값 설정
		if (vvo.getOrder_by() == null) {
			vvo.setOrder_by("v_time");
		}
		if (vvo.getOrder_sc() == null) {
			vvo.setOrder_sc("DESC");
		}

		List<VisitConsultVO> visitList = vDao.adminVisitList(vvo);
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
