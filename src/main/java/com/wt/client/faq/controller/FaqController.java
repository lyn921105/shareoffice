package com.wt.client.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.question.vo.FaqVO;
import com.wt.client.faq.service.FaqService;

@Controller
@RequestMapping(value="/faq")
public class FaqController {
	private Logger log = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService faqService;
	
	// FAQ 글목록 구현하기
	@RequestMapping(value="/faqList", method = RequestMethod.GET)
	public String faqList(Model model) {
		log.info("faqList 호출 성공");
		
		List<FaqVO> faqList = faqService.faqList();
		model.addAttribute("faqList", faqList);
		model.addAttribute("data");
		
		return "faq/faqList";
	}
}
