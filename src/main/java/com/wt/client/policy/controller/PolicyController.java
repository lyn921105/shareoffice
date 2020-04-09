package com.wt.client.policy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/policy")
public class PolicyController {
	
	@RequestMapping(value="/policyService", method = RequestMethod.GET)
	public String service() {
		return "policy/service";
	}
	
	@RequestMapping(value="/policyPrivacy", method = RequestMethod.GET)
	public String privacy() {
		return "policy/privacy";
	}
}
