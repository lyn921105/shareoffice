package com.wt.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wt.admin.member.service.AdminMemberService;
import com.wt.admin.member.vo.AdminMemberVO;
import com.wt.admin.room.vo.AdminRoomVO;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminMember", method = RequestMethod.GET)
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;

	// 회원 리스트 페이지
	@RequestMapping(value = "/list")
	public String memberList(@ModelAttribute AdminMemberVO avo, Model model) {

		// 페이지 세팅
		Paging.setPage(avo);

		// 전체 레코드수 구현
		int total = adminMemberService.memberListCnt(avo);

		// 글번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());

		List<AdminMemberVO> memberList = adminMemberService.memberList(avo);

		model.addAttribute("memberList", memberList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", avo);

		return "admin/member/adminMemberList";
	}

	// 회원 상세 페이지
	@RequestMapping(value = "/detail")
	public String memberDetail(HttpServletRequest request, Model model) {

		String c_id = request.getParameter("c_id");
		
		int result = adminMemberService.memberStatusDisabled(c_id);
		if (result == 1) {
			model.addAttribute("r_status", 1);
		}
		
		AdminMemberVO avo = adminMemberService.memberDetail(c_id);

		model.addAttribute("avo", avo);

		return "admin/member/memPop/adminMemberDetail";
	}

	// 회원 상태 변경 구현
	@RequestMapping(value = "/disabled", method = RequestMethod.GET)
	public String memberDisabled(AdminMemberVO rvo) {

		adminMemberService.memberDisabled(rvo);

		return "";
	}

}
