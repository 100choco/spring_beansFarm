package com.bbs.service;

import java.util.List;

import com.bbs.model.AdminDTO;
import com.bbs.model.MemberDTO;
import com.bbs.page.Criteria;

public interface AdminService {

	public int adminidchkAjax(String manager_id);

	public void adminInsert(AdminDTO adminDTO);

	public AdminDTO adminPwChk(String manager_id);



}
