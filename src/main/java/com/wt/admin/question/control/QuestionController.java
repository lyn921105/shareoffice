package com.wt.admin.question.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.question.service.FaqService;
import com.wt.admin.question.service.QuestionService;
import com.wt.admin.question.vo.FaqVO;
import com.wt.client.qna.vo.QnaVO;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminQuestion")
public class QuestionController {

	@Autowired
	private FaqService faqService;

	@Autowired
	private QuestionService qnaService;

	// faq 게시판 컨트롤러 시작
//faq 목록 구현
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqList(Model model) {

		List<FaqVO> faqList = faqService.adminFaqList();
		model.addAttribute("faqList", faqList);
		model.addAttribute("data");

		return "admin/question/faqList";
	}

	// faq 작성 구현
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, Model model) {

		faqService.faqInsert(fvo);

		return "redirect:/adminQuestion/faq";
	}

	// faq 수정 구현
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo) {

		faqService.faqUpdate(fvo);

		return "redirect:/adminQuestion/faq";

	}

	// faq 삭제 구현
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO fvo) {
		faqService.faqDelete(fvo.getF_num());

		return "redirect:/adminQuestion/faq";
	}
	// faq 컨트롤러 끝

//QnA 게시판 컨트롤러 시작
	// QnA 목록 구현
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnAList(@ModelAttribute QnaVO avo, Model model) {
		
		//페이지 세팅
		Paging.setPage(avo);
		
		//전체 레코드 수 구현
		int total=qnaService.adminQnaListCnt(avo);
		
		//글 번호 재설정
		int count = total-(Util.nvl(avo.getPage())-1)*Util.nvl(avo.getPageSize());
		
		List<QnaVO> qnaList = qnaService.adminQnaList();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("totla", total);
		model.addAttribute("data");

		return "admin/question/qnaList";
	}
	

	/*
	 * // 글 상세보기 구현
	 * 
	 * @RequestMapping(value = "/qnaDetail") public String qnaDetail(@ModelAttribute
	 * QnaVO avo, Model model) { QnaVO detail = new QnaVO(); detail =
	 * qnaService.qnaDetail(avo);
	 * 
	 * if (detail != null) {
	 * detail.setQ_content(detail.getQ_content().toString().replaceAll("\n",
	 * "<br>")); }
	 * 
	 * model.addAttribute("detail", detail);
	 * 
	 * return "admin/question/qnaDetail"; }
	 * 
	 * // QnA 답변 작성 페이지 출력
	 * 
	 * @RequestMapping(value = "/answerWrite") public String answerWriteForm() {
	 * return "admin/question/answerWrite"; }
	 * 
	 * // QnA 답변 수정 페이지 출력
	 * 
	 * @RequestMapping(value = "/editAnswerForm") public String
	 * editAnswerForm(@ModelAttribute QnaVO avo, Model model) { QnaVO updateData =
	 * new QnaVO(); updateData = qnaService.qnaDetail(avo);
	 * model.addAttribute("updateData", updateData);
	 * 
	 * return "/admin/question/editAnswerForm"; }
	 * 
	 * // QnA 답변 작성 구현
	 * 
	 * @RequestMapping(value = "/answerInsert") public String
	 * answerInsert(@ModelAttribute QnaVO avo, Model model) { int result = 0; String
	 * url = "";
	 * 
	 * result = qnaService.answerInsert(avo);
	 * 
	 * if (result == 1) { url = "/adminQuestion/qnaList"; } else {
	 * model.addAttribute("code", 1); url = "/adminQuestion/answerWrite"; }
	 * 
	 * return "redirect:" + url; }
	 * 
	 * // QnA 답변 수정 구현
	 * 
	 * @RequestMapping(value = "/answerUpdate") public String
	 * answerUpdate(@ModelAttribute QnaVO avo) { int result = 0; String url = "";
	 * 
	 * result = qnaService.answerUpdate(avo);
	 * 
	 * if (result == 1) { url = "/adminQustion/answerDetail?q_num=" +
	 * avo.getQ_num(); } else { url = "/adminQestion/editAnswerForm?q_num=" +
	 * avo.getQ_num(); }
	 * 
	 * return "redirect:" + url; }
	 * 
	 * // 답변 삭제 구현
	 * 
	 * @RequestMapping(value = "/answerDelete") public String
	 * answerDelete(@ModelAttribute QnaVO avo) { int result = 0; String url = "";
	 * 
	 * result = qnaService.answerDelete(avo.getQ_num());
	 * 
	 * if (result == 1) { url = "/adminQuestion/qnaList"; } else { url =
	 * "/adminQustion/answerDetail?q_num=" + avo.getQ_num(); }
	 * 
	 * return "redirect:" + url; }
	 */

}
