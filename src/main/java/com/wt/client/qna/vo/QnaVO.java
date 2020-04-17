package com.wt.client.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import com.wt.common.vo.CommonVO;

public class QnaVO extends CommonVO {
	private int q_num; // 질문글 번호
	private String c_id; // 사용자 아이디
	private String a_id; // 관리자 아이디
	private String q_regdate; // 작성일
	private String q_title; // 제목
	private String q_content; // 내용
	private String q_state; // 답변상태
	private int q_ref; // 원글번호
	private int q_step; // 문의글 계층변수
	private int q_level; // 문의글 위치변수

	// 파일 업로드를 위한 속성
	private String q_file; // 저장할 파일
	private MultipartFile q_uploadFile; // 첨부파일

	public MultipartFile getQ_uploadFile() {
		return q_uploadFile;
	}

	public void setQ_uploadFile(MultipartFile q_uploadFile) {
		this.q_uploadFile = q_uploadFile;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_state() {
		return q_state;
	}

	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_step() {
		return q_step;
	}

	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}

	public int getQ_level() {
		return q_level;
	}

	public void setQ_level(int q_level) {
		this.q_level = q_level;
	}

	public String getQ_file() {
		return q_file;
	}

	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}

}
