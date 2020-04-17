package com.wt.admin.question.service;


import java.util.List;

import com.wt.admin.question.vo.FaqVO;

public interface FaqService {
	public List<FaqVO> faqList();
	public int faqInsert(FaqVO fvo);
	public int faqUpdate(FaqVO fvo);
	public int faqDelete(int f_num);

}
