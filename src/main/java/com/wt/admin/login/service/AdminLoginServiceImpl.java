package com.wt.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wt.admin.login.dao.AdminLoginDao;
import com.wt.admin.login.vo.AdminLoginVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	private AdminLoginDao adminLoginDao;
	
	
	@Override
	public AdminLoginVO adminLoginSelect(AdminLoginVO avo) {
		AdminLoginVO vo = null;
		
		vo = adminLoginDao.adminLoginSelect(avo);
		
		return vo;
	}

}
