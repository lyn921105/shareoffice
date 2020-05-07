package com.wt.client.member.controller;

<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpServletRequest;
=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.client.member.service.MemberService;
import com.wt.client.member.vo.MemberVO;
import com.wt.client.reservation.vo.ReservationVO;
=======
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wt.client.member.service.MemberService;
import com.wt.client.member.vo.MemberVO;
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/injoin", method = RequestMethod.GET)
	public String getjoin(MemberVO vo) throws Exception {
		logger.info("get join");
<<<<<<< HEAD

		return "member/join";
	}

=======
		
		return "member/join";
	}
	
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(MemberVO vo) throws Exception {
		logger.info("post join");
<<<<<<< HEAD

=======
		
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
		System.out.println(vo.getC_id());
		System.out.println(vo.getC_email());
		System.out.println(vo.getC_name());
		System.out.println(vo.getC_phone());
		System.out.println(vo.getC_pwd());
<<<<<<< HEAD

		service.join(vo);

		// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
		// 존재하지 않는다면 -> register

		return "redirect:/login/login";
=======
		
		
			
				service.join(vo);
			
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		
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

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDeleteView";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 세션에있는 비밀번호
		String sessionPw = member.getC_pwd();
		// vo로 들어오는 비밀번호
		String voPw = vo.getC_pwd();

		if (!(sessionPw.equals(voPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	}

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

<<<<<<< HEAD
	@RequestMapping("/serchId")
	public String serchId() {
		return "/member/serchId";
	}

	@RequestMapping("/serchPw")
	public String serchPw() {
		return "/member/serchPw";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete() throws Exception {

		return "member/memberDelete";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@ModelAttribute MemberVO mvo, HttpSession session) throws Exception {

		service.memberDelete(mvo);
		session.invalidate();
		return "redirect:/";
	}

	// 회원정보수정

	@RequestMapping(value = "/memberListPwdForm")
	public String memberModifyPwdChkForm() {
		return "member/memberModifyPwChk";
	}

	@RequestMapping(value = "/memberModifyPwChk", method = RequestMethod.GET)
	public String memberModifyPwChk(HttpSession session, Model model, HttpServletRequest httpServletRequest) {
		String c_id = (String) session.getAttribute("loginSuccess");
		String f_pwd = httpServletRequest.getParameter("c_pwd");

		MemberVO k = new MemberVO();
		k.setC_id(c_id);
		k.setC_pwd(f_pwd);

		MemberVO ks = service.memberModifyPwdChk(k);

		// 입력한 비밀번호와 회원 아이디의 비밀번호가 일치하면 이동
		if (f_pwd.equals(ks.getC_pwd())) {
			return "redirect:/member/memberListForm";
		} else {
			return "redirect:/member/memberListPwdForm";
		}

		if (c_id == null) {
			return "redirect:/login/login";
		}
		MemberVO member = service.memberModifyPwChk(c_id);
		model.addAttribute(k);
		return "member/memberModifyPwChk";

	}

	// 회원정보수정
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public String memberModify() throws Exception {
		return "member/memberModify";
	}

	@RequestMapping(value = "/memberModifySuccess", method = RequestMethod.POST)
	public String memberModify(@ModelAttribute MemberVO mvo) throws Exception {

		MemberVO modify = service.modifySuccess(mvo);

		return "index";

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
	public String memberDetailForm() {
		return "member/memberDetail";
	}

=======
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
}
