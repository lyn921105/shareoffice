package com.wt.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import lombok.extern.java.Log;

//@Log
@Controller
public class MainController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "index";
	}
	
}