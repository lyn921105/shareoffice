package com.wt.client.qna.dao;

import java.util.List;

import com.wt.client.qna.vo.QnaVO;

public interface QnaDao {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	public int qnaInsert(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
	public int qnaUpdate(QnaVO qvo);
	public int qnaDelete(int q_num);
	public QnaVO qnaDownload(int q_num);
}
