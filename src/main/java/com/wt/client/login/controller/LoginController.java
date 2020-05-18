package com.wt.client.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wt.client.login.service.LoginService;
import com.wt.client.login.vo.LoginVO;
import com.wt.client.member.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		log.info("login get 호출 성공");
		return "login/login";
	}

	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join() {
		log.info("login get 호출 성공");
		return "member/join";
	}

	// 아이디 찾기 입력창
	@RequestMapping(value = "/serchId", method = RequestMethod.GET)
	public String serchId() {
		ModelAndView mav = new ModelAndView();
		return "login/serchId";

	}

	// 아이디 찾기 확인창
	@RequestMapping(value = "/serchIdChk", method = RequestMethod.POST)
	public ModelAndView serchIdChk(@ModelAttribute MemberVO mvo) {
		ModelAndView mav = new ModelAndView();
		String idChk = loginService.serchIdChk(mvo);
		mav.addObject("idChk", idChk);
		mav.setViewName("login/serchIdChk");
		return mav;

	}

	@RequestMapping(value = "/serchPw", method = RequestMethod.GET)
	public String serchPw() {
		return "login/serchPw";

	}

	// 비밀번호 찾기 확인창
	@RequestMapping(value = "/serchPwChk", method = RequestMethod.POST)
	public ModelAndView serchPwChk(@ModelAttribute MemberVO mvo) {
		ModelAndView mav = new ModelAndView();
		String pwChk = loginService.serchPwChk(mvo);
		mav.addObject("pwChk", pwChk);
		mav.setViewName("login/serchPwChk");
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		log.info("login get 호출 성공");
		session.invalidate();
		return "index";

	}

	@RequestMapping(value = "/loginSuccess", method = RequestMethod.POST)
	public ModelAndView loginSuccess(@ModelAttribute LoginVO lvo, HttpSession session) {
		log.info("login p 호출 성공");

		ModelAndView mav = new ModelAndView();

		LoginVO loginvo = loginService.loginSuccess(lvo);
		
		String loginS = loginvo.getC_id();

		if (loginS == null) {
			mav.addObject("errCode", 1);
			mav.setViewName("login/login");
			return mav;
		} else {
			session.setAttribute("loginSuccess", loginS);
			mav.setViewName("index");

			return mav;
		}

	}

}
