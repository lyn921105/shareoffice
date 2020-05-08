package com.wt.client.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.client.qna.vo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession session;
	
	// Q&A 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		return session.selectList("qnaList", qvo);
	}

	// Q&A 글입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		return session.insert("qnaInsert", qvo);
	}

	// Q&A 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return (QnaVO)session.selectOne("qnaDetail", qvo);
	}

	// Q&A 글수정 구현
	@Override
	public int qnaUpdate(QnaVO qvo) {
		return session.update("qnaUpdate", qvo);
	}

	// Q&A 글삭제 구현
	@Override
	public int qnaDelete(int q_num) {
		return session.delete("qnaDelete", q_num);
	}

	// Q&A 전체 레코드 수 구현
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return (Integer)session.selectOne("qnaListCnt");
	}

	@Override
	public QnaVO qnaDownload(int q_num) {
		return session.selectOne("qnaDownload", q_num);
	}

}
