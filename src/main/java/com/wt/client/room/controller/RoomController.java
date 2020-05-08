package com.wt.client.room.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.client.room.service.RoomService;

@Controller
@RequestMapping(value="/room")
public class RoomController {
	private Logger log = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	
	// 호실 현황 페이지
	@RequestMapping(value = "/roomStatus", method = RequestMethod.GET)
	public String roomStatus(Model model) {
		log.info("roomStatus 호출 성공");
		
		List<AdminRoomVO> roomMain = roomService.roomStatus();
		
		if (!roomMain.isEmpty()) {
			model.addAttribute("roomMain", roomMain);
		} else {
			return "room/roomStatus";
		}
		return "room/roomStatus";
	}
	
	// 호실 층별 페이지 변경 구현
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminRoomVO> roomListFloor(HttpServletRequest httpServletRequest, Model model) {
		log.info("roomChange 호출 성공");
		
		String o_floor = httpServletRequest.getParameter("o_floor");
	
		List<AdminRoomVO> roomList = roomService.roomListFloor(o_floor);
		
		if (!roomList.isEmpty()) {
			model.addAttribute("roomList", roomList);
		} else {
			return roomList;
		}
		return roomList;
	}
	
	// 호실 안내 페이지 구현
	@RequestMapping(value = "/roomView")
	public String roomView (Model model) {

		List<AdminRoomVO> roomView = roomService.roomView();
		
		model.addAttribute("roomImage", roomView.get(0));
		model.addAttribute("roomView", roomView);

		return "room/roomView";
	}
}
