package com.wt.admin.question.vo;

public class FaqVO {
	private int f_num;
	private String f_question;
	private String f_answer;

	public FaqVO() {
		super();
	}

	public FaqVO(int f_num, String f_question, String f_answer) {
		super();
		this.f_num = f_num;
		this.f_question = f_question;
		this.f_answer = f_answer;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getF_question() {
		return f_question;
	}

	public void setF_question(String f_question) {
		this.f_question = f_question;
	}

	public String getF_answer() {
		return f_answer;
	}

	public void setF_answer(String f_answer) {
		this.f_answer = f_answer;
	}

}
