package com.wt.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.question.dao.QuestionDAO;
import com.wt.client.qna.vo.QnaVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDAO qDao;
	
//글목록
	@Override
	public List<QnaVO> adminQnaList() {
		List<QnaVO> qnaList=null;
		qnaList=qDao.adminQnaList();
		
		return qnaList;
	}
	
	@Override
	public int adminQnaListCnt(QnaVO avo) {
		return qDao.adminQnaListCnt(avo);
	}
	
//글 상세
	/*
	 * @Override public QnaVO qnaDetail(QnaVO avo) { QnaVO detail=null;
	 * detail=qDao.qnaDetail(avo); return detail; }
	 * 
	 * @Override public int answerInsert(QnaVO avo) { int result=0; try {
	 * result=qDao.answerInsert(avo); } catch(Exception e) { e.printStackTrace();
	 * result=0; }
	 * 
	 * return result; }
	 * 
	 * @Override public int answerUpdate(QnaVO avo) { int result=0; try {
	 * result=qDao.answerUpdate(avo); } catch(Exception e) { e.printStackTrace();
	 * result=0; }
	 * 
	 * return result; }
	 * 
	 * @Override public int answerDelete(int q_num) { int result=0;
	 * 
	 * try { result=qDao.answerDelete(q_num); } catch(Exception e) {
	 * e.printStackTrace(); result=0; }
	 * 
	 * return result;
	 * 
	 * }
	 */
}
