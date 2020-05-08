package com.wt.client.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.question.vo.FaqVO;


@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqVO> faqList() {
		return session.selectList("faqList");
	}

}
