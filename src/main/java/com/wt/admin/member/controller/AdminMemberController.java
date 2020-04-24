package com.wt.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.member.service.AdminMemberService;
import com.wt.admin.member.vo.AdminMemberVO;

@Controller
@RequestMapping(value = "/adminMember", method = RequestMethod.GET)
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;

	// 회원 리스트 페이지
	@RequestMapping(value = "/list")
	public String memberList(Model model) {
		String url = "";
		int result = 0;

		List<AdminMemberVO> memberList = adminMemberService.memberList();

		model.addAttribute("memberList", memberList);

		url = "/member/adminMemberList";

		return url;
	}

	// 회원 상세 페이지
	@RequestMapping(value = "/detail")
	public String memberDetail(HttpServletRequest request, Model model) {
		String url = "";
		int result = 0;

		String c_id = request.getParameter("c_id");

		AdminMemberVO avo = adminMemberService.memberDetail(c_id);

		model.addAttribute("avo", avo);

		url = "/member/adminMemberDetail";
		return url;
	}

	// 회원 상태 변경 구현
	@RequestMapping(value = "/disabled", method = RequestMethod.GET)
	public String memberDisabled(AdminMemberVO rvo) {
		String url = "";
		int result = 0;

		String c_id = rvo.getC_id();

		AdminMemberVO avo = adminMemberService.memberDetail(c_id);
		
		if (rvo.getC_disabled() != avo.getC_disabled()) {
			result = adminMemberService.memberDisabled(rvo);
		}

		url = "/member/adminMemberDetail";

		return url;
	}
	

}
