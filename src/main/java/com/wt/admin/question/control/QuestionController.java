package com.wt.admin.question.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.question.service.FaqService;
import com.wt.admin.question.vo.FaqVO;

@Controller
@RequestMapping(value = "/adminQuestion")
public class QuestionController {

	@Autowired
	private FaqService faqService;

//faq 리스트로 이동
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqList(Model model) {

		List<FaqVO> faqList = faqService.faqList();
		model.addAttribute("faqList", faqList);
		model.addAttribute("data");

		return "admin/question/faqList";
	}

	// faq작성 구현
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, Model model) {

		faqService.faqInsert(fvo);

		return "redirect:/adminQuestion/faq";
	}

	// faq 수정 구현
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo) {
		int result = 0;
		String url = "";

		result = faqService.faqUpdate(fvo);

		if (result == 1) {
			url = "admin/question/faqList";
		}

		return "redirect:" + url;
	}

	// faq삭제 구현
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO fvo) {
		faqService.faqDelete(fvo.getF_num());

		return "redirect:/adminQuestion/faq";
	}

}
