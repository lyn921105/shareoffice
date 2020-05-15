package com.wt.admin.contract.service;

import java.util.List;

import com.wt.admin.chart.vo.AdminChartVO;
import com.wt.admin.contract.vo.AdminContractVO;

public interface AdminContractService {

	public AdminContractVO contractDetail(String r_num);

	public List<AdminContractVO> leaveList(AdminContractVO avo);

	public AdminContractVO refundDetail(String r_num);

	public int refundUpdate(AdminContractVO avo);

	public int contractListCnt(AdminContractVO avo);

	public List<AdminContractVO> contractList(AdminContractVO avo);

	public int leaveListCnt(AdminContractVO avo);

	public int refundListCnt(AdminContractVO avo);

	public List<AdminContractVO> refundList(AdminContractVO avo);

	public List<AdminChartVO> lineChart();

	public List<AdminChartVO> pieChart();

}
