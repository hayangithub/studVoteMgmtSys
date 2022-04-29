package com.hm.vote.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hm.vote.mappers.AdminMapper;
import com.hm.vote.vo.Admin;
import com.hm.vote.vo.AdminExample;
import com.hm.vote.utils.MD5;



@Service("LoginService")
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	private AdminMapper adminMapper;

	public LoginService(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
		
	}
	
	public Boolean checkAdminLoginCred(Admin admin)  {
		Boolean result = null;
		AdminExample adminExample =new AdminExample();
		AdminExample.Criteria criteriaAdmin=adminExample.createCriteria();
		criteriaAdmin.andEmailEqualTo(admin.getEmail());
		System.out.println("MD5   " + MD5.getMd5(admin.getPassword()));
		criteriaAdmin.andPasswordEqualTo(MD5.getMd5(admin.getPassword()));
		List<Admin> adminList=adminMapper.selectByExample(adminExample);
		
		if (adminList.size() == 0 || adminList.size() > 1) {
			result=false;
		}
		
		if (adminList.size() == 1) {
			result=true;
		}

		return result;
	}

}
