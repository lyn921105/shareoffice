package com.wt.admin.question.dao;

import java.util.List;

import com.wt.client.qna.vo.QnaVO;

public interface QuestionDAO {
	public List<QnaVO> adminQnaList();
	public int adminQnaListCnt(QnaVO avo);
	
	/*
	 * public QnaVO qnaDetail(QnaVO avo); public int answerInsert(QnaVO avo); public
	 * int answerUpdate(QnaVO avo); public int answerDelete(int q_num);
	 */

}
