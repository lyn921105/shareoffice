package com.wt.client.login.controller;

<<<<<<< HEAD
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
=======


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4

@Controller
@RequestMapping("/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);
<<<<<<< HEAD
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
=======
	@RequestMapping(value="/login", method = RequestMethod.GET)
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	public String login() {
		log.info("login get 호출 성공");
		return "login/login";
	}
<<<<<<< HEAD

	@RequestMapping(value = "/join", method = RequestMethod.GET)
=======
	@RequestMapping(value="/join", method = RequestMethod.GET)
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
	public String join() {
		log.info("login get 호출 성공");
		return "member/join";
	}
<<<<<<< HEAD

	// 아이디 찾기 입력창
	@RequestMapping(value = "/serchId", method = RequestMethod.GET)
	public String serchId() {
		ModelAndView mav = new ModelAndView();
		return "login/serchId";

	}

	// 아이디 찾기 확인창
	@RequestMapping(value = "/serchIdChk", method = RequestMethod.POST)
	public ModelAndView serchIdChk(@ModelAttribute MemberVO mvo) {
		System.out.println(mvo.getC_name());
		System.out.println(mvo.getC_email());

		ModelAndView mav = new ModelAndView();
		String idChk = loginService.serchIdChk(mvo);
		System.out.println(idChk);
		mav.addObject("idChk", idChk);
		mav.setViewName("login/serchIdChk");
		return mav;

	}

	@RequestMapping(value = "/serchPw", method = RequestMethod.GET)
	public String serchPw() {
		return "login/serchPw";

	}

	@RequestMapping(value = "/serchPwChk", method = RequestMethod.POST)
	public ModelAndView serchPwChk(@ModelAttribute MemberVO mvo) {
		System.out.println(mvo.getC_email());

		ModelAndView mav = new ModelAndView();
		String pwChk = loginService.serchPwChk(mvo);
		System.out.println(pwChk);
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
=======
	@RequestMapping(value="/serchId", method = RequestMethod.GET)
	public String serchId() {
		log.info("login get 호출 성공");
		return "login/serchId";
	}
	@RequestMapping(value="/serchPw", method = RequestMethod.GET)
	public String serchPw() {
		log.info("login get 호출 성공");
		return "login/serchPw";
	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout() {
		log.info("login get 호출 성공");
		return "index";
	}
	@RequestMapping(value="/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess() {
		log.info("login get 호출 성공");
		return "index";
	}
	
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4

}
