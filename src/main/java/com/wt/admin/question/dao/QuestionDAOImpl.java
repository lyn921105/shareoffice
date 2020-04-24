package com.wt.admin.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.qna.vo.QnaVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<QnaVO> adminQnaList() {
		// TODO Auto-generated method stub
		return session.selectList("qnaList");
	}
	
	@Override
	public int adminQnaListCnt(QnaVO avo) {
		return (Integer)session.selectOne("qnaListCnt");
	}

	/*
	 * @Override public QnaVO qnaDetail(QnaVO avo) { // TODO Auto-generated method
	 * stub return (QnaVO) session.selectOne("qnaDetail", avo); }
	 * 
	 * @Override public int answerInsert(QnaVO avo) { // TODO Auto-generated method
	 * stub return session.insert("answerInsert", avo); }
	 * 
	 * @Override public int answerUpdate(QnaVO avo) { // TODO Auto-generated method
	 * stub return session.update("answerUpdate", avo); }
	 * 
	 * @Override public int answerDelete(int q_num) { // TODO Auto-generated method
	 * stub return session.delete("answerDelete", q_num); }
	 */

}
