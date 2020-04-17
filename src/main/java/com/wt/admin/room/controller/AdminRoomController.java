package com.wt.admin.room.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.admin.room.service.AdminRoomService;
import com.wt.admin.room.vo.AdminRoomVO;

@Controller
@RequestMapping(value = "/adminRoom")
public class AdminRoomController {
	private Logger log = LoggerFactory.getLogger(AdminRoomController.class);

	@Autowired
	private AdminRoomService adminRoomService;

	// 호실 현황 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String roomMain(Model model) {

		Map<String, AdminRoomVO> roomMain = adminRoomService.roomMain();

		
		if (!roomMain.isEmpty()) {
			model.addAttribute("roomMain", roomMain);
		} else {
			return "room/adminRoomMain";
		}
		return "room/adminRoomMain";
	}

	// 호실 층별 페이지 변경 구현
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminRoomVO> roomList(HttpServletRequest httpServletRequest, Model model) {

		String o_floor = httpServletRequest.getParameter("o_floor");

		List<AdminRoomVO> roomList = adminRoomService.roomList(o_floor);
		
		if (!roomList.isEmpty()) {
			model.addAttribute("roomList", roomList);
		} else {
			return roomList;
		}
		return roomList;
	}

	// 호실 등록 페이지 구현
	@RequestMapping(value = "/resister")
	public String resister(HttpServletRequest httpServletRequest, Model model) {
		log.info("resister 호출 성공");
		
		
		
		return "room/adminRoomResister";
	}

	// 호실 등록 기능 구현
	@RequestMapping(value = "/roomInsert", method = RequestMethod.POST)
	public String roomInsert(@ModelAttribute AdminRoomVO avo, Model model) {
		int result = 0;
		String url = "";
		
		result = adminRoomService.roomInsert(avo);
		if(result == 1) {
			url = "room/adminRoomMain";
		} else {
			model.addAttribute("code", 1);
			url = "room/adminRoomResister";
		}
		
		return "room/adminRoomMain";
	}

	// 호실 변경및삭제 페이지 구현
	@RequestMapping(value = "/edit")
	public String edit() {
		log.info("edit 호출 성공");
		return "room/adminRoomEdit";
	}

	// 호실 변경 및 삭제 기능 구현
	@RequestMapping(value = "/roomUpdate", method = RequestMethod.POST)
	public String roomUpdate(@ModelAttribute AdminRoomVO avo, Model model) {
		return "room/adminRoomMain";
	}
	// 차트들
}
