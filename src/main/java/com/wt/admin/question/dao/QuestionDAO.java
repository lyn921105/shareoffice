package com.wt.admin.question.dao;

import java.util.List;

import com.wt.client.qna.vo.QnaVO;

public interface QuestionDAO {
	public List<QnaVO> adminQnaList(QnaVO avo);

	public int adminQnaListCnt(QnaVO avo);

	public QnaVO questionDetail(QnaVO avo);

	public QnaVO getAdminAccount(QnaVO avo);

	public int insertAnswer(QnaVO avo);

	public int updateState(int num);

	public int deleteAnswer(int q_num);

	public int deleteState(int q_ref);

	public int updateAnswer(QnaVO avo);

	public QnaVO fileDownload(int q_num);

}
