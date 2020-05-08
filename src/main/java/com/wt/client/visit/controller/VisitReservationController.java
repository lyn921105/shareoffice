package com.wt.client.visit.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.client.visit.service.VisitReservationService;
import com.wt.client.visit.vo.VisitReservationVO;

@Controller
@RequestMapping(value="/visit")
public class VisitReservationController {
	private Logger log = LoggerFactory.getLogger(VisitReservationController.class);
	
	@Autowired
	private VisitReservationService visitReservationService;
	
	
	// 방문상담 예약 폼 출력
	@RequestMapping(value="/visitReservationForm")
	public String visitReservationForm() {
		log.info("visitReservationForm 호출 성공");
		
		return "visit/visitReservation";
	}
	
	// 방문상담 예약 처리
	@RequestMapping(value="/visitReservation", method=RequestMethod.POST)
	public String visitReservation(@ModelAttribute VisitReservationVO vvo, Model model) {
		log.info("visitReservation 호출 성공");
		
		int result = 0;
		String url = "";
		
		System.out.println(vvo.getV_name());
		System.out.println(vvo.getV_phone());
		System.out.println(vvo.getV_date());
		System.out.println(vvo.getV_time());
		
		result = visitReservationService.visitInsert(vvo);
		
		if (result == 1) {
			url = "/";
		} else {
			url = "/visit/visitReservationForm";
		}
		
		model.addAttribute("result", result);
		
		return "redirect:"+url;
	}
	
	// 방문 날짜 선택시 해당 날짜 시간 처리(ajax)
	@RequestMapping(value="visitList")
	@ResponseBody
	public List<VisitReservationVO> visitList(HttpServletRequest httpServletRequest) {
		log.info("visitList 호출 성공");
		
		String date = httpServletRequest.getParameter("input_Vdate");
		
		List<VisitReservationVO> visitList = visitReservationService.visitList(date);
		
		return visitList;
	}
}
