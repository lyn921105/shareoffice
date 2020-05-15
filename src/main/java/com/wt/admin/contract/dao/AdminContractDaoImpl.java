package com.wt.admin.contract.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.chart.vo.AdminChartVO;
import com.wt.admin.contract.vo.AdminContractVO;

@Repository
public class AdminContractDaoImpl implements AdminContractDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<AdminContractVO> contractList(AdminContractVO avo) {
		return session.selectList("contractList", avo);
	}

	@Override
	public AdminContractVO contractDetail(String r_num) {
		return session.selectOne("contractDetail", r_num);
	}

	@Override
	public List<AdminContractVO> leaveList(AdminContractVO avo) {
		return session.selectList("leaveList", avo);
	}

	@Override
	public AdminContractVO refundDetail(String r_num) {
		return session.selectOne("refundDetail", r_num);
	}

	@Override
	public int refundUpdate(AdminContractVO avo) {
		session.update("officeRefundUpdate", avo);
		return session.update("refundUpdate", avo);
	}

	@Override
	public int contractListCnt(AdminContractVO avo) {
		return (Integer)session.selectOne("contractListCnt", avo);
	}

	@Override
	public int leaveListCnt(AdminContractVO avo) {
		return (Integer)session.selectOne("leaveListCnt", avo);
	}

	@Override
	public int refundListCnt(AdminContractVO avo) {
		return (Integer)session.selectOne("refundListCnt", avo);
	}

	@Override
	public List<AdminContractVO> refundList(AdminContractVO avo) {
		return session.selectList("refundList", avo);
	}

	@Override
	public List<AdminChartVO> lineChart() {
		return session.selectList("lineChart");
	}

	@Override
	public List<AdminChartVO> pieChart() {
		return session.selectList("pieChart");
	}

}
