package com.wt.admin.reservation.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.reservation.service.MoveInService;
import com.wt.admin.reservation.service.VisitConsultService;
import com.wt.admin.reservation.vo.MoveInVO;
import com.wt.admin.reservation.vo.VisitConsultVO;
import com.wt.client.qna.vo.QnaVO;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminReservation")
public class ReservationController {

	@Autowired
	private VisitConsultService conService;

	@Autowired
	private MoveInService moService;

	// 방문 예약 목록 구현
	@RequestMapping(value = "/consultList")
	public String consultList(@ModelAttribute VisitConsultVO vvo, Model model) {

		// 페이지 세팅
		Paging.setPage(vvo);
		// 전체 레코드 수 구현
		int total = conService.adminVisitListCnt(vvo);

		// 글 번호 재설정
		int count = total - (Util.nvl(vvo.getPage()) - 1) * Util.nvl(vvo.getPageSize());

		List<VisitConsultVO> visitList = conService.adminVisitList(vvo);

		model.addAttribute("visitList", visitList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", vvo);

		return "admin/reservation/visitConsultList";
	}

	// 방문예약 상세보기 구현
	@RequestMapping(value = "/visitConsultDetail")
	public String visitConsultDetail(@ModelAttribute VisitConsultVO vvo, Model model) {
		VisitConsultVO detail = conService.adminVisitConsultDetail(vvo);

		model.addAttribute("detail", detail);

		return "admin/reservation/visitConsultDetail";

	}

	// 방문 상담 상태 변경
	@RequestMapping(value = "/updateConsultState", method = RequestMethod.GET)
	public String updateConsultState(@ModelAttribute VisitConsultVO vvo) {
		conService.updateConsultState(vvo.getV_num());

		return "redirect:/adminReservation/visitConsultDetail?v_num="+vvo.getV_num();
	}

	// 입주 예약 관리 컨트롤러

	@RequestMapping(value = "/moveInList")
	public String moveInList(@ModelAttribute MoveInVO mvo, Model model) { 
		// 페이지 세팅
		Paging.setPage(mvo);
		
		// 전체 레코드 수 구현
		int total = moService.moveInListCnt(mvo);
		
		int newReq= moService.newRequest(mvo);

		// 글 번호 재설정
		int count = total - (Util.nvl(mvo.getPage()) - 1) * Util.nvl(mvo.getPageSize());

		List<MoveInVO> moveInList = moService.moveInList(mvo);

		model.addAttribute("moveInList", moveInList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("newRequest", newReq);
		model.addAttribute("data", mvo);

		return "admin/reservation/moveInList";
	}
	
@RequestMapping(value="/moveInDetail")
public String moveInDetail(@ModelAttribute MoveInVO mvo, Model model) {
	MoveInVO detail = moService.moveInDetail(mvo);

	model.addAttribute("detail", detail);

	return "admin/reservation/moveInDetail";
}

}
