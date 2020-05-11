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
	public List<QnaVO> adminQnaList(QnaVO avo) {
		List<QnaVO> qnaList = null;
		qnaList = qDao.adminQnaList(avo);

		return qnaList;
	}

	@Override
	public int adminQnaListCnt(QnaVO avo) {
		return qDao.adminQnaListCnt(avo);
	}

//글 상세

	@Override
	public QnaVO questionDetail(QnaVO avo) {
		QnaVO detail = null;
		detail = qDao.questionDetail(avo);
		return detail;
	}

	@Override
	public QnaVO getAdminAccount(QnaVO avo) {
		QnaVO adminAccount = null;
		adminAccount = qDao.getAdminAccount(avo);
		return adminAccount;
	}

	@Override
	public int insertAnswer(QnaVO avo) {
		int result = 0;
		try {
			result = qDao.insertAnswer(avo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int updateState(int num) {
		int result = 0;

		try {
			result = qDao.updateState(num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int deleteAnswer(int q_num) {
		int result = 0;

		try {
			result = qDao.deleteAnswer(q_num);

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int deleteState(int q_ref) {
		int result = 0;

		try {
			result = qDao.deleteState(q_ref);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int updateAnswer(QnaVO avo) {
		int result = 0;

		try {
			result = qDao.updateAnswer(avo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public QnaVO fileDownload(int q_num) {
		return qDao.fileDownload(q_num);
	}

}
