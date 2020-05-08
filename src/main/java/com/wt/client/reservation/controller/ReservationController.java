package com.wt.client.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.reservation.service.ReservationService;
import com.wt.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value="/reservation")
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	// 예약 폼 출력하기
	@RequestMapping(value="/reservationForm")
	public String writeForm(HttpSession session, Model model) {
		log.info("reservationForm 호출 성공");
		
		String c_id = (String)session.getAttribute("loginSuccess");
		model.addAttribute("c_id", c_id);
		
		return "reservation/reservationForm";
	}
	
	// 호실 현황 팝업으로 출력
	@RequestMapping(value = "/roomPop", method = RequestMethod.GET)
	public String roomPopMain(Model model) {
		log.info("roomChange 호출 성공");
		
		List<AdminRoomVO> roomMain = reservationService.roomPopMain();
		
		if (!roomMain.isEmpty()) {
			model.addAttribute("roomMain", roomMain);
		} else {
			return "reservation/resPop/roomPop";
		}
		return "reservation/resPop/roomPop";
	}
	
	// 호실 현황을 볼 때 층 변경시
	@RequestMapping(value = "/popChange", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminRoomVO> roomPopList(@ModelAttribute AdminRoomVO rvo, Model model) {
		List<AdminRoomVO> roomList = reservationService.roomPopList(rvo);
		
		if (!roomList.isEmpty()) {
			model.addAttribute("roomList", roomList);
		} else {
			return roomList;
		}
		return roomList;
	}
	
	// 호실 현황을 볼 때 입주 희망 날짜 변경시
	@RequestMapping(value="/roomPopDate", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminRoomVO> roomPopDate(HttpServletRequest httpServletRequest, Model model) {
		String date = httpServletRequest.getParameter("input_Rdate");
		
		List<AdminRoomVO> roomList = reservationService.roomPopEnd(date);
		
		model.addAttribute("roomList", roomList);
		
		return roomList;
	}
	
	// 만기날짜 선택시 이용금액 계산 및 최대 인원수 설정
	@RequestMapping(value="/totalMoney", method = RequestMethod.GET)
	@ResponseBody
	public AdminRoomVO totalMoney(@ModelAttribute AdminRoomVO rvo) {
		AdminRoomVO room = reservationService.totalMoney(rvo);
		
		return room;
	}
	
	// 예약 결과폼 출력
	@RequestMapping(value="/reservationResult", method = RequestMethod.POST)
	public String reservationResult(@ModelAttribute ReservationVO rvo, Model model, HttpServletRequest httpServletRequest) {
		model.addAttribute("result", rvo);
		
		String date = httpServletRequest.getParameter("send_endDate");
		model.addAttribute("send_endDate", date);
		return "reservation/reservationResult";
	}
	
	// 예약 정보 DB에 저장
	@RequestMapping(value="/reservationInsert")
	public String reservationInsert(@ModelAttribute ReservationVO rvo) {
		reservationService.reservationInsert(rvo);
		return "index";
	}
	
	// 예약 안내문 출력
	@RequestMapping(value="/resInfo")
	public String reservationInfo() {
		return "reservation/resPop/resInfo";
	}
}
