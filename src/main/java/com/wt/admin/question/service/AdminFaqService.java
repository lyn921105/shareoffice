package com.wt.admin.question.service;


import java.util.List;

import com.wt.admin.question.vo.FaqVO;

public interface AdminFaqService {
	public List<FaqVO> adminFaqList();
	public int faqInsert(FaqVO fvo);
	public int faqUpdate(FaqVO fvo);
	public int faqDelete(int f_num);

}
