package com.wt.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.client.qna.dao.QnaDao;
import com.wt.client.qna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qnaDao;

	// Q&A 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> myList = null;
		
		myList = qnaDao.qnaList(qvo);
		return myList;
	}

	// Q&A 글입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		int result = 0;
		try {
			result = qnaDao.qnaInsert(qvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// Q&A 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDao.qnaDetail(qvo);
		return detail;
	}

	// Q&A 글수정 구현
	@Override
	public int qnaUpdate(QnaVO qvo) {
		int result = 0;
		try {
			result = qnaDao.qnaUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// Q&A 글삭제 구현
	@Override
	public int qnaDelete(int q_num) {
		int result = 0;
		try {
			result = qnaDao.qnaDelete(q_num);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// Q&A 전체 레코드 수 구현
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDao.qnaListCnt(qvo);
	}

	@Override
	public QnaVO qnaDownload(int q_num) {
		return qnaDao.qnaDownload(q_num);
	}


}
