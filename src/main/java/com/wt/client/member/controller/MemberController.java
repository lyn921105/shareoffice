package com.wt.client.member.controller;

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

import com.wt.client.member.service.MemberService;
import com.wt.client.member.vo.MemberVO;
import com.wt.client.reservation.vo.ReservationVO;
import com.wt.client.room.service.RoomService;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;
	
	@Autowired
	private RoomService roomService;

	@RequestMapping(value = "/injoin", method = RequestMethod.GET)
	public String getjoin(MemberVO vo) throws Exception {
		logger.info("get join");

		return "member/join";
	}

	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(MemberVO vo) throws Exception {
		logger.info("post join");

		service.join(vo);

		return "redirect:/login/login";
	}
//로그인

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws
	 * Exception { logger.info("post login");
	 * 
	 * HttpSession session = req.getSession(); MemberVO login = service.login(vo);
	 * 
	 * if (login == null) { session.setAttribute("member", null);
	 * rttr.addFlashAttribute("msg", false); } else { session.setAttribute("member",
	 * login); }
	 * 
	 * return "redirect:/"; }
	 */

	/*
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public String
	 * logout(HttpSession session) throws Exception {
	 * 
	 * session.invalidate();
	 * 
	 * return "redirect:/"; }
	 */

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	// 비밀번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "/pwChk", method = RequestMethod.POST)
	public int pwChk(MemberVO vo) throws Exception {
		int result = service.pwChk(vo);
		return result;
	}

	@RequestMapping("/serchId")
	public String serchId() {
		return "member/serchId";
	}

	@RequestMapping("/serchPw")
	public String serchPw() {
		return "member/serchPw";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDeletePwd", method = RequestMethod.GET)
	public String memberDeletePwd() throws Exception {

		return "member/memberDeletePwd";
	}

	// 회원 탈퇴 Form
	@RequestMapping(value = "/memberDeleteForm", method = RequestMethod.POST)
	public String memberDelete(@ModelAttribute MemberVO mvo, HttpSession session, Model model) throws Exception {
		String c_id = (String)session.getAttribute("loginSuccess");
		mvo.setC_id(c_id);
		
		model.addAttribute("delete", mvo);
		
		return "member/memberDelete";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDeleteDisabled(@ModelAttribute MemberVO mvo, HttpSession session) throws Exception {

		service.memberDelete(mvo);
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원정보수정폼
	@RequestMapping(value = "/memberModifyPwForm")
	public String memberModifyPwdChkForm(HttpSession session) {
		return "member/memberModifyPwChk";
	}

	// 회원정보수정
	@RequestMapping(value = "/memberModifyPwChk", method = RequestMethod.GET)
	public String memberModifyPwChk(HttpSession session, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		String c_id = (String) session.getAttribute("loginSuccess");
		if (c_id == null) {
			return "redirect:/login/login";
		}
		String f_pwd = httpServletRequest.getParameter("c_pwd");

		MemberVO k = new MemberVO();
		k.setC_id(c_id);
		k.setC_pwd(f_pwd);

		MemberVO ks = service.memberModifyPwChk(k);

		// 입력한 비밀번호와 회원 아이디의 비밀번호가 일치하면 이동
		if (f_pwd.equals(ks.getC_pwd())) {
			return "redirect:/member/memberListForm";
		} else {
			return "redirect:/member/memberListPwdForm";
		}

	}

	// 회원정보수정
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public String memberModify() throws Exception {
		return "member/memberModify";
	}

	@RequestMapping(value = "/memberModifySuccess", method = RequestMethod.POST)
	public String memberModify(@ModelAttribute MemberVO mvo, HttpSession session) throws Exception {
		
		String c_id = (String) session.getAttribute("loginSuccess");
		mvo.setC_id(c_id);
		
		int result = 0;
		
		result = service.modifySuccess(mvo);
		
		if (result == 1) {
			return "index";
		} else {
			return "redirect:/member/memberModify";
		}


	}

	// 마이페이지 예약 현황 비밀번호 확인 폼
	@RequestMapping(value = "/memberListPwdForm")
	public String memberListPwdForm() {
		return "member/memberListPwd";
	}

	// 마이페이지 예약 현황 비밀번호 확인
	@RequestMapping(value = "/memberListPwd", method = RequestMethod.POST)
	public String memberListPwd(HttpServletRequest httpServletRequest, HttpSession session) {
		String c_id = (String) session.getAttribute("loginSuccess");
		String f_pwd = httpServletRequest.getParameter("c_pwd");
		MemberVO mvo = new MemberVO();
		mvo.setC_id(c_id);
		mvo.setC_pwd(f_pwd);

		MemberVO g_mvo = service.memberListPwd(mvo);

		// 입력한 비밀번호와 회원 아이디의 비밀번호가 일치하면 이동
		if (f_pwd.equals(g_mvo.getC_pwd())) {
			return "redirect:/member/memberListForm";
		} else {
			return "redirect:/member/memberListPwdForm";
		}
	}

	// 마이페이지 예약 현황 폼
	@RequestMapping(value = "/memberListForm")
	public String memberListForm(HttpSession session, Model model) {
		// 예약 후 24시간 이내에 관리자가 승인을 해주지 않는 경우 예약 상태 '취소'로 변경
		List<ReservationVO> rvo = roomService.roomCancel();
								
		for (int i = 0; i < rvo.size(); i++) {
			ReservationVO res = new ReservationVO(rvo.get(i).getR_num(), rvo.get(i).getR_floor(), rvo.get(i).getR_room(), rvo.get(i).getR_status());
			roomService.roomCancelUpdate(res);
			roomService.roomUsableUpdate(res);
		}
		
		String c_id = (String) session.getAttribute("loginSuccess");
		
		List<ReservationVO> rvo1 = service.memberReserve(c_id);
		List<ReservationVO> rvo2 = service.memberUse(c_id);
		List<ReservationVO> rvo3 = service.memberDone(c_id);

		model.addAttribute("res_list1", rvo1);
		model.addAttribute("res_list2", rvo2);
		model.addAttribute("res_list3", rvo3);

		return "member/memberList";
	}

	// 마이페이지 예약 현황 상세페이지 폼
	@RequestMapping(value = "/memberDetailForm")
	public String memberDetailForm(HttpServletRequest request, Model model) {
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		
		ReservationVO rvo = service.memberDetailForm(r_num);
		
		model.addAttribute("res", rvo);
		
		return "member/memberDetail";
	}
	
	// 마이페이지 환불 요청
	@RequestMapping(value="/memberRefund")
	public String memberRefund(@ModelAttribute ReservationVO rvo) {
		service.memberRefund(rvo);
		
		return "index";
	}

}
