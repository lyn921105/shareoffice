package com.wt.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.reservation.vo.VisitConsultVO;

@Repository
public class AdminVisitConsultDAOImpl implements AdminVisitConsultDAO {
@Autowired
private SqlSession session;
	
	@Override
	public List<VisitConsultVO> adminVisitList(VisitConsultVO vvo) {
		return session.selectList("adminVisitList", vvo);
	}

	@Override
	public int adminVisitListCnt(VisitConsultVO vvo) {
		return (Integer) session.selectOne("adminVisitListCnt", vvo);
	}

	@Override
	public VisitConsultVO adminVisitConsultDetail(VisitConsultVO vvo) {
		// TODO Auto-generated method stub
		return (VisitConsultVO)session.selectOne("adminVisitConsultDetail", vvo);
	}

	@Override
	public int updateConsultState(int v_num) {
		// TODO Auto-generated method stub
		return session.update("updateConsultState", v_num);
	}

}
