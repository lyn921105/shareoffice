package com.wt.admin.reservation.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.reservation.service.AdminMoveInService;
import com.wt.admin.reservation.service.AdminVisitConsultService;
import com.wt.admin.reservation.vo.MoveInVO;
import com.wt.admin.reservation.vo.VisitConsultVO;
import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.vo.ReservationVO;
import com.wt.client.room.service.RoomService;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminReservation")
public class AdminReservationController {

	@Autowired
	private AdminVisitConsultService conService;

	@Autowired
	private AdminMoveInService moService;
	
	@Autowired
	private RoomService roomService;

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

		return "redirect:/adminReservation/visitConsultDetail?v_num=" + vvo.getV_num();
	}

	// 입주 예약 관리 컨트롤러

	// 입주 예약 리스트 출력
	@RequestMapping(value = "/moveInList")
	public String moveInList(@ModelAttribute MoveInVO mvo, Model model) {
		// 페이지 세팅
		Paging.setPage(mvo);

		// 전체 레코드 수 구현
		int total = moService.moveInListCnt(mvo);

		int newReq = moService.newRequest(mvo);

		// 글 번호 재설정
		int count = total - (Util.nvl(mvo.getPage()) - 1) * Util.nvl(mvo.getPageSize());

		//24시간 이내에 승인이 안 됐을 경우 취소로 상태 변경
		List<ReservationVO> rvo = roomService.roomCancel();

		for (int i = 0; i < rvo.size(); i++) {
			ReservationVO res = new ReservationVO(rvo.get(i).getR_num(), rvo.get(i).getR_floor(),
					rvo.get(i).getR_room(), rvo.get(i).getR_status());
			roomService.roomCancelUpdate(res);
			roomService.roomUsableUpdate(res);
		}

		List<MoveInVO> moveInList = moService.moveInList(mvo);

		model.addAttribute("moveInList", moveInList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("newRequest", newReq);
		model.addAttribute("data", mvo);

		return "admin/reservation/moveInList";
	}

	// 입주 예약 상세 보기 페이지 출력
	@RequestMapping(value = "/moveInDetail")
	public String moveInDetail(@ModelAttribute MoveInVO mvo, Model model) {
		MoveInVO detail = moService.moveInDetail(mvo);

		model.addAttribute("detail", detail);

		return "admin/reservation/moveInDetail";
	}

	// 승인 상태 변경
	@RequestMapping(value = "/updateReqState")
	public String updateReqState(@ModelAttribute MoveInVO mvo, AdminRoomVO rvo, HttpServletRequest request) {
		moService.updateReqState(mvo.getR_num());
		String o_floor = request.getParameter("r_floor");
		String o_room = request.getParameter("r_room");

		rvo.setO_floor(o_floor);
		rvo.setO_room(o_room);

		moService.updateReserve(rvo);

		return "redirect:/adminReservation/moveInList";

	}

}
