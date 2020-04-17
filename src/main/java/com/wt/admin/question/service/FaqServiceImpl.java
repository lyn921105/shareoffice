package com.wt.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wt.admin.question.dao.FaqDAO;
import com.wt.admin.question.vo.FaqVO;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {
	
@Autowired
private FaqDAO faqDao;
	
//글목록 구현
	@Override
	public List<FaqVO> faqList() {
		List<FaqVO> faqList=null;
		faqList=faqDao.faqList();
		return faqList;
	}

	//글 작성 구현
	@Override
	public int faqInsert(FaqVO fvo) {
		int result=0;
		
		try {
			result=faqDao.faqInsert(fvo);
		} catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}


	//글 수정 구현
	@Override
	public int faqUpdate(FaqVO fvo) {
		int result =0;
		
		try {
			result=faqDao.faqUpdate(fvo);
		} catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

	//글삭제 구현
	@Override
	public int faqDelete(int f_num) {
		int result=0;
		
		try {
			result=faqDao.faqDelete(f_num);
		} catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

}
