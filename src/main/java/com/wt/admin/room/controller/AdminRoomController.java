package com.wt.admin.room.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.admin.room.service.AdminRoomService;
import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.common.file.FileUploadUtil;

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
	public String resister(HttpServletRequest httpServletRequest, Model model, AdminRoomVO avo) {
		log.info("resister 호출 성공");

		String o_floor = httpServletRequest.getParameter("o_floor");
		String o_room = httpServletRequest.getParameter("o_room");

		model.addAttribute("o_floor", o_floor);
		model.addAttribute("o_room", o_room);

		AdminRoomVO rvo = adminRoomService.roomDetail(avo);

		if (rvo != null) {
			model.addAttribute("rvo", rvo);
			return "room/adminRoomEdit";
		} else {
			return "room/adminRoomResister";
		}

	}

	// 호실 등록 기능 구현
	@RequestMapping(value = "/roomInsert", method = RequestMethod.POST)
	public String roomInsert(@ModelAttribute AdminRoomVO avo, Model model, HttpServletRequest request)
			throws IOException {

		int result = 0;
		String url = "";

		// 썸네일 등록
		String o_thumbFile = FileUploadUtil.fileUpload(avo.getThumbfile(), request, "room");
		avo.setO_thumb(o_thumbFile);
		// 이미지 1 등록
		if (avo.getFile1().getOriginalFilename() != "") {
			String o_file1 = FileUploadUtil.fileUpload(avo.getFile1(), request, "room");
			avo.setO_image1(o_file1);
		}
		if (avo.getFile2().getOriginalFilename() != "") {
			String o_file2 = FileUploadUtil.fileUpload(avo.getFile2(), request, "room");
			avo.setO_image2(o_file2);
		}
		if (avo.getFile3().getOriginalFilename() != "") {
			String o_file3 = FileUploadUtil.fileUpload(avo.getFile3(), request, "room");
			avo.setO_image3(o_file3);
		}

		result = adminRoomService.roomInsert(avo);

		if (result == 1) {
			model.addAttribute("code", 0);
			url = "room/adminRoomResister";
		} else {
			model.addAttribute("code", 1);
			url = "room/adminRoomResister";
		}

		return url;
	}

	// 호실 변경및삭제 페이지 구현
	@RequestMapping(value = "/edit")
	public String edit() {
		log.info("edit 호출 성공");
		return "room/adminRoomEdit";
	}

	// 호실 변경 구현
	@RequestMapping(value = "/roomUpdate", method = RequestMethod.POST)
	public String roomUpdate(@ModelAttribute AdminRoomVO avo, Model model, HttpServletRequest request)
			throws IOException {
		int result = 0;
		String url = "";

		AdminRoomVO rvo = adminRoomService.roomDetail(avo);
		System.out.println(avo.getThumbfile().getOriginalFilename());

		if (avo.getThumbfile().getOriginalFilename() != "") {
			if (rvo.getO_thumb() != null) {
				FileUploadUtil.fileDelete(rvo.getO_thumb(), request);
			}
			String o_thumbFile = FileUploadUtil.fileUpload(avo.getThumbfile(), request, "room");
			avo.setO_thumb(o_thumbFile);
		}
		// 이미지 1 등록
		if (avo.getFile1().getOriginalFilename() != "") {
			if (rvo.getO_image1() != null) {
				FileUploadUtil.fileDelete(rvo.getO_image1(), request);
			}
			String o_file1 = FileUploadUtil.fileUpload(avo.getFile1(), request, "room");
			avo.setO_image1(o_file1);
		}
		if (avo.getFile2().getOriginalFilename() != "") {
			if (rvo.getO_image2() != null) {
				FileUploadUtil.fileDelete(rvo.getO_image2(), request);
			}
			String o_file2 = FileUploadUtil.fileUpload(avo.getFile2(), request, "room");
			avo.setO_image2(o_file2);
		}
		if (avo.getFile3().getOriginalFilename() != "") {
			if (rvo.getO_image3() != null) {
				FileUploadUtil.fileDelete(rvo.getO_image3(), request);
			}
			String o_file3 = FileUploadUtil.fileUpload(avo.getFile3(), request, "room");
			avo.setO_image3(o_file3);
		}

		result = adminRoomService.roomUpdate(avo);

		return "room/adminRoomMain";
	}

	// 파일 삭제 기능 구현
	@RequestMapping(value = "/fileDelete", method = RequestMethod.GET)
	@ResponseBody
	public String fileDelete(HttpServletRequest request) throws IOException {
		int result = 0;
		String url = "";

		String o_floor = request.getParameter("o_floor");
		String o_room = request.getParameter("o_room");
		String o_image1 = request.getParameter("o_image1");
		String o_image2 = request.getParameter("o_image2");
		String o_image3 = request.getParameter("o_image3");
		
		AdminRoomVO avo = new AdminRoomVO();
		
		avo.setO_floor(o_floor);
		avo.setO_room(o_room);
		
		if (o_image1 != null && o_image1 != "") {
			FileUploadUtil.fileDelete(o_image1, request);
			avo.setO_image1(o_image1);
		}
		if (o_image2 != null && o_image2 != "") {
			FileUploadUtil.fileDelete(o_image2, request);
			avo.setO_image2(o_image2);
		}
		if (o_image3 != null && o_image3 != "") {
			FileUploadUtil.fileDelete(o_image3, request);
			avo.setO_image3(o_image3);
		}


		result = adminRoomService.fileDelete(avo);

		return url;
	}

	// 호실 삭제 기능 구현
	@RequestMapping(value = "/roomDelete", method = RequestMethod.POST)
	public String roomDelete(@ModelAttribute AdminRoomVO avo, Model model, HttpServletRequest request)
			throws IOException {
		int result = 0;
		String url = "";

		FileUploadUtil.fileDelete(avo.getO_thumb(), request);
		if (!avo.getO_image1().isEmpty()) {
			FileUploadUtil.fileDelete(avo.getO_image1(), request);
		}
		if (!avo.getO_image2().isEmpty()) {
			FileUploadUtil.fileDelete(avo.getO_image2(), request);
		}
		if (!avo.getO_image3().isEmpty()) {
			FileUploadUtil.fileDelete(avo.getO_image3(), request);
		}

		result = adminRoomService.roomDelete(avo);

		return "room/adminRoomMain";
	}
	
	// 차트들
}
