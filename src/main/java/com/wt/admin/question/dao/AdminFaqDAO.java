package com.wt.admin.question.dao;


import java.util.List;

import com.wt.admin.question.vo.FaqVO;

public interface AdminFaqDAO {

	public List<FaqVO> adminFaqList();
	public int faqInsert(FaqVO fvo);
	public int faqUpdate(FaqVO fvo);
	public int faqDelete(int f_num);
}
