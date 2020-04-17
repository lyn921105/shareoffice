package com.wt.client.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.client.qna.service.QnaService;
import com.wt.client.qna.vo.QnaVO;
import com.wt.common.file.FileUploadUtil;
import com.wt.common.page.Paging;
import com.wt.common.util.Util;

@Controller
@RequestMapping(value="/qna")
public class QnaController {
	private Logger log = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaService;
	
	// Q&A 글목록 구현하기
	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList 호출 성공");
		
		// 페이지 세팅
		Paging.setPage(qvo);
				
		// 전체 레코드수 구현
		int total = qnaService.qnaListCnt(qvo);
		log.info("total = " + total);
				
		// 글번호 재설정
		int count = total - (Util.nvl(qvo.getPage())-1) * Util.nvl(qvo.getPageSize());
		log.info("count = " + count);
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count",count);
		model.addAttribute("total",total);
		model.addAttribute("data");
		
		return "qna/qnaList";
	}
	
	// Q&A 글쓰기 폼 출력하기
	@RequestMapping(value="/qnaWriteForm")
	public String writeForm() {
		log.info("qnawriteForm 호출 성공");
		
		return "qna/qnaWrite";
	}
	
	// Q&A 글쓰기 구현하기
	@RequestMapping(value="/qnaWrite", method=RequestMethod.POST)
	public String qnaInsert(@ModelAttribute QnaVO qvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("qnaWrite 호출 성공");
		
		System.out.println(qvo.getQ_title());
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaInsert(qvo);
		
		// 파일 업로드
		if(qvo.getQ_uploadFile() !=null) {
			String q_file = FileUploadUtil.fileUpload(qvo.getQ_uploadFile(), request, "board");
			qvo.setQ_file(q_file);
		}
		
		if (result == 1) {
			url = "/qna/qnaList";
		} else {
			url = "/qna/qnaWriteForm";
		}
		return "redirect:" + url;
	}
	
	// Q&A 글 상세보기 구현
	@RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaDetail 호출 성공");
		log.info("q_num = " + qvo.getQ_num());
		
		QnaVO detail = new QnaVO();
		detail = qnaService.qnaDetail(qvo);
		
		if (detail != null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "qna/qnaDetail";
	}
	
	// Q&A에서 자신의 글만 읽을 수 있는 아이디 확인
	@ResponseBody
	@RequestMapping(value="/idConfirm", method=RequestMethod.POST)
	public String idConfirm(@ModelAttribute QnaVO qvo) {
		log.info("idConfirm 호출 성공");
		String value = "";
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
		int result = qnaService.idConfirm(qvo);
		if(result == 1) {
			value="성공";
		} else {
			value="실패";
		}
		log.info("result = " + result);
		
		return value+"";
	}
	
	// Q&A 글수정 폼 출력하기
	@RequestMapping(value="/qnaUpdateForm")
	public String updateForm(@ModelAttribute QnaVO qvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("q_num = " + qvo.getQ_num());
		
		QnaVO updateData = new QnaVO();
		updateData = qnaService.qnaDetail(qvo);
		
		model.addAttribute("updateData", updateData);
		return "qna/qnaUpdate";
	}
	
	// Q&A 글수정 구현하기
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo) {
		log.info("qnaUpdate 호출 성공");

		int result = 0;
		String url="";
		
		result = qnaService.qnaUpdate(qvo);
		
		if (result == 1) {
			// 수정 후 상세페이지로 이동
			url="/qna/qnaDetail?q_num="+qvo.getQ_num();
		} else {
			// 실패시 다시 수정폼
			url="/qna/qnaUpdateForm?q_num="+qvo.getQ_num();
		}
		
		return "redirect:"+url;
	}
	
	// Q&A 글삭제 구현하기
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo) {
		log.info("qnaDelete 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값을 담는다.(1 or 0)
		int result = 0;
		String url = "";
		
		result = qnaService.qnaDelete(qvo.getQ_num());
		
		if (result == 1) {
			url = "/qna/qnaList";
		} else {
			url = "/qna/qnaDetail?q_num="+qvo.getQ_num();
		}
		return "redirect:"+url;
	}
}
