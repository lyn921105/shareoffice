package com.wt.admin.contract.dao;

import java.util.List;

import com.wt.admin.chart.vo.AdminChartVO;
import com.wt.admin.contract.vo.AdminContractVO;

public interface AdminContractDao {

	public List<AdminContractVO> contractList(AdminContractVO avo);

	public AdminContractVO contractDetail(String r_num);

	public List<AdminContractVO> leaveList(AdminContractVO avo);

	public AdminContractVO refundDetail(String r_num);

	public int refundUpdate(AdminContractVO avo);

	public int contractListCnt(AdminContractVO avo);

	public int leaveListCnt(AdminContractVO avo);

	public int refundListCnt(AdminContractVO avo);

	public List<AdminContractVO> refundList(AdminContractVO avo);

	public List<AdminChartVO> lineChart();

	public List<AdminChartVO> pieChart();

}
