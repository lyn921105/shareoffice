package com.wt.client.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.question.vo.FaqVO;
import com.wt.client.faq.dao.FaqDao;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public List<FaqVO> faqList() {
		List<FaqVO> myList = null;
		myList = faqDao.faqList();
		return myList;
	}

}
