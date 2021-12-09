package com.bbs.service;

import java.util.List;

import com.bbs.model.MemberDTO;
import com.bbs.page.AdminCriteria;
import com.bbs.page.Criteria;

public interface MemberService {
	
	//회원등록
	public void memberInsert(MemberDTO memberDTO);
	
	public int idchkAjax(String m_id);
	
	public int loginChkAjax(String m_id, String m_pw);

	public MemberDTO memberLogin(String m_id);

	public String emailChkajax(String m_email);

	public void pwUpdate(String m_id, String m_pw);

	public int emailchkAjax(String m_email);

	public List<MemberDTO> listAllMain(AdminCriteria cri);
	
	public int getTotalMain(AdminCriteria cri);
	
	public List<MemberDTO> listAll(Criteria cri);
	
	public int getTotal(Criteria cri);

	public void memberdelete(String m_id);

	public List<MemberDTO> listOne(String m_id);

	public void memberTierupdate(String m_id, String msName);

	public void memberInfodelete(String m_id);

	// 회원정보 수정
	public void memberUpdate(MemberDTO memberDTO);

	







}
