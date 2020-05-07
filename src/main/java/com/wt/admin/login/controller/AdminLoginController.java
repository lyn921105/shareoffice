package com.wt.admin.login.controller;

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
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String adminLogin() {
		return "login/adminLogin";
	}

	// 로그인 처리 메소드
	// 로그인 실패 시 처리할 내용 포함
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String adminLoginProc(AdminLoginVO avo,Model model) {
		String url = "";

		AdminLoginVO rvo = adminLoginService.adminLoginSelect(avo);
		
		if(rvo == null) {
			model.addAttribute("errCode", 1);
			url = "login/adminLogin";
		} else {
			model.addAttribute("rvo", rvo);
			url = "login/loginSuccess";
		}

		
		return url;
	}
	
	// 로그아웃 처리 메소드
	public String adminLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/adminLogin/login";
	}

}
