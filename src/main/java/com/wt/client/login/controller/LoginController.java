package com.wt.client.login.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);
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
	

}
