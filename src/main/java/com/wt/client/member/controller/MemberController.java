package com.wt.client.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wt.client.member.service.MemberService;
import com.wt.client.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/injoin", method = RequestMethod.GET)
	public String getjoin(MemberVO vo) throws Exception {
		logger.info("get join");
		
		return "member/join";
	}
	
	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(MemberVO vo) throws Exception {
		logger.info("post join");
		
		System.out.println(vo.getC_id());
		System.out.println(vo.getC_email());
		System.out.println(vo.getC_name());
		System.out.println(vo.getC_phone());
		System.out.println(vo.getC_pwd());
		
		
			
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

}
