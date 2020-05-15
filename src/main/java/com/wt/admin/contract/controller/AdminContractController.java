package com.wt.admin.contract.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.chart.vo.AdminChartVO;
import com.wt.admin.contract.service.AdminContractService;
import com.wt.admin.contract.vo.AdminContractVO;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminContract")
public class AdminContractController {

	@Autowired
	AdminContractService adminContractService;

	// 계약 리스트 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adminContract(AdminContractVO avo, Model model) {

		// 페이지 세팅
		Paging.setPage(avo);

		// 전체 레코드수 구현
		int total = adminContractService.contractListCnt(avo);

		// 글번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());

		List<AdminContractVO> contractList = adminContractService.contractList(avo);

		model.addAttribute("contractList", contractList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", avo);

		return "admin/contract/adminContractList";
	}

	// 계약 상세 정보
	@RequestMapping(value = "/detail")
	public String adminContractDetail(Model model, HttpServletRequest request) {

		String r_num = request.getParameter("r_num");

		AdminContractVO avo = adminContractService.contractDetail(r_num);

		model.addAttribute("avo", avo);

		return "admin/contract/conPop/adminContractDetail";
	}

	// 퇴실 내역 리스트
	@RequestMapping(value = "/leaveList", method = RequestMethod.GET)
	public String adminContractLeave(AdminContractVO avo, Model model) {
		// 페이지 세팅
		Paging.setPage(avo);

		// 전체 레코드수 구현
		int total = adminContractService.leaveListCnt(avo);

		// 글번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());

		List<AdminContractVO> leaveList = adminContractService.leaveList(avo);

		model.addAttribute("leaveList", leaveList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", avo);

		return "admin/contract/adminLeaveList";
	}

	// 환불 리스트
	@RequestMapping(value = "/refundList", method = RequestMethod.GET)
	public String adminContractRefund(AdminContractVO avo, Model model) {

		// 페이지 세팅
		Paging.setPage(avo);

		// 전체 레코드수 구현
		int total = adminContractService.refundListCnt(avo);

		// 글번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());
		
		List<AdminContractVO> refundList = adminContractService.refundList(avo);

		model.addAttribute("refundList", refundList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", avo);
		

		return "admin/contract/adminContractRefundList";
	}

	// 환불 상세 팝업창
	@RequestMapping(value = "/refundDetail")
	public String adminContractRefundDetail(Model model, HttpServletRequest request) {

		String r_num = request.getParameter("r_num");

		AdminContractVO avo = adminContractService.refundDetail(r_num);

		model.addAttribute("avo", avo);

		return "admin/contract/conPop/adminContractRefundDetail";
	}

	// 환불 요청 승인 메소드
	@RequestMapping(value = "/refundUpdate", method = RequestMethod.POST)
	public String adminContractRefundUpdate(Model model, AdminContractVO avo) {

		adminContractService.refundUpdate(avo);
		
		return "admin/contract/conPop/adminContractRefundDetail";
	}
	
	// 차트
	@RequestMapping(value = "/chart")
	public String adminContractChart(Model model) {
		
		List<AdminChartVO> lineChartList = adminContractService.lineChart();
		List<AdminChartVO> pieChartList = adminContractService.pieChart();
		
		model.addAttribute("lineChart", lineChartList);
		model.addAttribute("pieChart", pieChartList);
		
		return "admin/contract/adminChart";
	}
	

}
