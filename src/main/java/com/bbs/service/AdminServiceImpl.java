package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.AdminMapper;
import com.bbs.model.AdminDTO;
import com.bbs.model.MemberDTO;
import com.bbs.page.Criteria;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int adminidchkAjax(String manager_id) {
		
		return adminMapper.adminidchkAjax(manager_id);
	}

	@Override
	public void adminInsert(AdminDTO adminDTO) {
		
		adminMapper.adminInsert(adminDTO);
	}

	@Override
	public AdminDTO adminPwChk(String manager_id) {
		
		return adminMapper.adminPwChk(manager_id);
	}


}
