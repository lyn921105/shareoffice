package com.wt.admin.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.question.vo.FaqVO;

@Repository
public class AdminFaqDAOImpl implements AdminFaqDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqVO> adminFaqList() {
		// TODO Auto-generated method stub
		return session.selectList("adminFaqList");
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		// TODO Auto-generated method stub
		return session.insert("faqInsert",fvo);
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		// TODO Auto-generated method stub
		return session.update("faqUpdate", fvo);
	}

	@Override
	public int faqDelete(int f_num) {
		// TODO Auto-generated method stub
		return session.delete("faqDelete", f_num);
	}

}
