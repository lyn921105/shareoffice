package com.wt.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wt.admin.login.service.AdminLoginService;
import com.wt.admin.login.vo.AdminLoginVO;

@Controller
@RequestMapping(value = "/adminLogin")
public class AdminLoginController {
	private Logger log = LoggerFactory.getLogger(AdminLoginController.class);
	@Autowired
	private AdminLoginService adminLoginService;

	// 로그인 화면을 보여주는 메소드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminLogin() {
		log.info("adminLogin get 호출 성공");
		return "login/adminLogin";
	}

	// 로그인 처리 메소드
	// 로그인 실패 시 처리할 내용 포함
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView adminLoginProc(@ModelAttribute("adminLoginVO") AdminLoginVO avo, HttpSession session,
			HttpServletRequest request) {
		log.info("adminLogin post 호출 성공");
		ModelAndView mav = new ModelAndView();


		AdminLoginVO adminLoginCheckResult = adminLoginService.adminLoginSelect(avo);

		if (adminLoginCheckResult == null) { // 로그인 실패시
			mav.addObject("errCode",1); // 로그인 실패 alert창을 띄우고 기존 페이지로 이동
			mav.setViewName("login/adminLogin");
			return mav;
			
		}
		// 로그인 성공시
		else {
			session.setAttribute("adminLogin", adminLoginCheckResult);
			mav.setViewName("login/loginSuccess"); // 로그인 성공, 메인 페이지로 이동
			return mav;

		}
	}
	// 로그아웃 처리 메소드
	public String adminLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/adminLogin/login";
	}

}
