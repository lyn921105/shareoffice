package com.wt.admin.contract.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.chart.vo.AdminChartVO;
import com.wt.admin.contract.dao.AdminContractDao;
import com.wt.admin.contract.vo.AdminContractVO;
import com.wt.admin.member.vo.AdminMemberVO;

@Service
@Transactional
public class AdminContractServiceImpl implements AdminContractService {

	@Autowired
	public AdminContractDao adminContractDao;


	@Override
	public AdminContractVO contractDetail(String r_num) {
		AdminContractVO avo = null;
		avo = adminContractDao.contractDetail(r_num);
		return avo;
	}

	@Override
	public List<AdminContractVO> leaveList(AdminContractVO avo) {
		List<AdminContractVO> leaveList = null;
		leaveList = adminContractDao.leaveList(avo);
		return leaveList;
	}


	@Override
	public AdminContractVO refundDetail(String r_num) {
		AdminContractVO avo = null;
		avo = adminContractDao.refundDetail(r_num);
		return avo;
	}

	@Override
	public int refundUpdate(AdminContractVO avo) {
		int result = 0;
		result = adminContractDao.refundUpdate(avo);
		return result;
	}

	@Override
	public int contractListCnt(AdminContractVO avo) {
		int result = 0;
		result = adminContractDao.contractListCnt(avo);
		return result;
	}

	@Override
	public List<AdminContractVO> contractList(AdminContractVO avo) {
		List<AdminContractVO> contractList = null;
		contractList = adminContractDao.contractList(avo);
		return contractList;
	}

	@Override
	public int leaveListCnt(AdminContractVO avo) {
		int result = 0;
		result = adminContractDao.leaveListCnt(avo);
		return result;
	}

	@Override
	public int refundListCnt(AdminContractVO avo) {
		int result = 0;
		result = adminContractDao.refundListCnt(avo);
		return result;
	}

	@Override
	public List<AdminContractVO> refundList(AdminContractVO avo) {
		List<AdminContractVO> refundList = null;
		refundList = adminContractDao.refundList(avo);
		return refundList;
	}

	@Override
	public List<AdminChartVO> lineChart() {
		List<AdminChartVO> lineChart = null;
		lineChart = adminContractDao.lineChart();
		return lineChart;
	}

	@Override
	public List<AdminChartVO> pieChart() {
		List<AdminChartVO> pieChart = null;
		pieChart = adminContractDao.pieChart();
		return pieChart;
	}

}
