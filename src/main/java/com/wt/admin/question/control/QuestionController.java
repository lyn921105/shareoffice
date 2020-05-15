package com.wt.admin.question.control;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.admin.question.service.AdminFaqService;
import com.wt.admin.question.service.QuestionService;
import com.wt.admin.question.vo.FaqVO;
import com.wt.client.qna.vo.QnaVO;
import com.wt.common.file.FileUploadUtil;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value = "/adminQuestion")
public class QuestionController {

	@Autowired
	private AdminFaqService faqService;

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

		// 페이지 세팅
		Paging.setPage(avo);
		// 전체 레코드 수 구현
		int total = qnaService.adminQnaListCnt(avo);

		// 글 번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());

		List<QnaVO> qnaList = qnaService.adminQnaList(avo);

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", avo);

		return "admin/question/qnaList";
	}

	// 글 상세보기 구현

	@RequestMapping(value = "/questionDetail")
	public String qnaDetail(@ModelAttribute QnaVO avo, Model model) {
		QnaVO detail = new QnaVO();
		detail = qnaService.questionDetail(avo);

		if (detail != null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "admin/question/questionDetail";
	}

	// QnA 답변 작성 페이지 출력

	@RequestMapping(value = "/writeAnswerForm")
	public String writeAnswerForm(@ModelAttribute QnaVO avo, Model model) {
		QnaVO data = new QnaVO();
		QnaVO adminAccount = new QnaVO();

		// 답변 글 작성 시 사용자 입력한 제목과 관리자 계정 아이디 가져오기 위함
		data = qnaService.questionDetail(avo);
		adminAccount = qnaService.getAdminAccount(avo);

		model.addAttribute("data", data);
		model.addAttribute("adminAccount", adminAccount);

		return "admin/question/writeAnswerForm";
	}

	// QnA 답변 작성 구현

	@RequestMapping(value = "/insertAnswer")
	public String answerInsert(@ModelAttribute QnaVO avo, HttpServletRequest request, Model model)
			throws IllegalStateException, IOException {
		int result = 0;
		String url = "";
		int num = Integer.parseInt(request.getParameter("q_num"));

		// 파일 업로드
		if (avo.getQ_uploadFile() != null) {
			String q_file = FileUploadUtil.fileUpload(avo.getQ_uploadFile(), request, "qna");
			avo.setQ_file(q_file);
		}

		result = qnaService.insertAnswer(avo);

		if (result == 1) {
			qnaService.updateState(num);
			url = "/adminQuestion/qnaList";

		} else {
			model.addAttribute("code", 1);
			url = "/adminQuestion/answerWrite";
		}

		return "redirect:" + url;
	}

	// 답변 삭제 구현
	@RequestMapping(value = "/deleteAnswer")
	public String deleteAnswer(@ModelAttribute QnaVO avo, HttpServletRequest request) throws IOException {
		int result = 0;
		String url = "";

		if (!avo.getQ_file().isEmpty()) {
			FileUploadUtil.fileDelete(avo.getQ_file(), request);
		}

		result = qnaService.deleteAnswer(avo.getQ_num());

		if (result == 1) {
			qnaService.deleteState(avo.getQ_ref());
			url = "/adminQuestion/qnaList";
		} else {
			url = "/adminQustion/answerDetail?q_num=" + avo.getQ_num();
		}

		return "redirect:" + url;
	}

	// qna 답변 수정 폼 출력
	@RequestMapping(value = "/updateAnswerForm")
	public String updateAnswerForm(@ModelAttribute QnaVO avo, Model model) {
		QnaVO data = new QnaVO();
		data = qnaService.questionDetail(avo);

		model.addAttribute("data", data);

		return "admin/question/updateAnswerForm";

	}

	// QnA 답변 수정 구현
	@RequestMapping(value = "/updateAnswer", method = RequestMethod.POST)
	public String updateAnswer(@ModelAttribute QnaVO avo, HttpServletRequest request) throws IOException {
		int result = 0;
		String url = "";

		String q_file = "";

		if (!avo.getQ_uploadFile().isEmpty()) {
			if (!avo.getQ_file().isEmpty()) {
				FileUploadUtil.fileDelete(avo.getQ_file(), request);
			}

			q_file = FileUploadUtil.fileUpload(avo.getQ_uploadFile(), request, "qna");
			avo.setQ_file(q_file);

		} else {
			avo.setQ_file("");
		}

		result = qnaService.updateAnswer(avo);
		if (result == 1) {
			url = "/adminQuestion/questionDetail?q_num=" + avo.getQ_num();
		} else {
			url = "/adminQuestion/updateAnswerForm?q_num=" + avo.getQ_num();
		}

		return "redirect:" + url;
	}

	// 첨부파일 다운로드
	@RequestMapping("/fileDownload")
	public void fileDownload(@ModelAttribute QnaVO avo, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		QnaVO download = qnaService.fileDownload(avo.getQ_num());
		String downFile = download.getQ_file();

		byte[] fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(
				new File(request.getSession().getServletContext().getRealPath("/uploadStorage/qna/") + downFile));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(downFile, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
