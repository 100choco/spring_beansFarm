package com.bbs.mapper;

import com.bbs.model.AdminDTO;

public interface AdminMapper {

	public int adminidchkAjax(String manager_id);

	public void adminInsert(AdminDTO adminDTO);

	public AdminDTO adminPwChk(String manager_id);

	
}
