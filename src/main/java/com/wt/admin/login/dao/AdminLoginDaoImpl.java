package com.wt.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.admin.login.vo.AdminLoginVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminLoginVO adminLoginSelect(AdminLoginVO avo) {
		return session.selectOne("adminLoginSelect", avo);
		
	}

}
