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
	public List<QnaVO> adminQnaList(QnaVO avo) {
		// TODO Auto-generated method stub
		return session.selectList("adminQnaList", avo);
	}

	@Override
	public int adminQnaListCnt(QnaVO avo) {
		return (Integer) session.selectOne("adminQnaListCnt", avo);
	}

	@Override
	public QnaVO questionDetail(QnaVO avo) {
		return (QnaVO) session.selectOne("questionDetail", avo);
	}

	@Override
	public QnaVO getAdminAccount(QnaVO avo) {
		return (QnaVO) session.selectOne("getAdminAccount", avo);
	}

	@Override
	public int insertAnswer(QnaVO avo) {
		return session.insert("insertAnswer", avo);
	}

	@Override
	public int updateState(int num) {
		return session.update("updateState", num);
	}

	@Override
	public int deleteAnswer(int q_num) {
		return session.delete("deleteAnswer", q_num);
	}

	@Override
	public int deleteState(int q_ref) {
		return session.update("deleteState", q_ref);
	}

	@Override
	public int updateAnswer(QnaVO avo) {
		// TODO Auto-generated method stub
		return session.update("updateAnswer", avo);
	}

	@Override
	public QnaVO fileDownload(int q_num) {
		return session.selectOne("fileDownload", q_num);
	}

}
