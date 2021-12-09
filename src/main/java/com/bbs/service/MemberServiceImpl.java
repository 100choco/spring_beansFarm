package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.MemberMapper;
import com.bbs.model.MemberDTO;
import com.bbs.page.AdminCriteria;
import com.bbs.page.Criteria;

@Service
public class MemberServiceImpl implements MemberService {

	//회원
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Override
	public void memberInsert(MemberDTO memberDTO) {
		memberMapper.memberInsert(memberDTO);

	}
	
	@Override
	public int idchkAjax(String m_id) {
		
		return memberMapper.idchkAjax(m_id);
	}

	@Override
	public int loginChkAjax(String m_id, String m_pw) {
		
		return memberMapper.loginChkAjax(m_id, m_pw);
	}

	@Override
	public MemberDTO memberLogin(String m_id) {
		
		return memberMapper.memberLogin(m_id);
	}

	@Override
	public String emailChkajax(String m_email) {
		
		return memberMapper.emailChkajax(m_email);
	}

	@Override
	public void pwUpdate(String m_id, String m_pw) {
		
		memberMapper.pwUpdate(m_id, m_pw);
	}

	@Override
	public int emailchkAjax(String m_email) {
		
		return memberMapper.emailchkAjax(m_email);
	}

	@Override
	public List<MemberDTO> listAllMain(AdminCriteria cri) {
		
		return memberMapper.listAllMain(cri);
	}

	@Override
	public int getTotalMain(AdminCriteria cri) {
		
		return memberMapper.getTotalMain(cri);
	}
	
	@Override
	public List<MemberDTO> listAll(Criteria cri) {
		
		return memberMapper.listAll(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return memberMapper.getTotal(cri);
	}
	
	
	@Override
	public void memberdelete(String m_id) {
		memberMapper.memberdelete(m_id);
	}

	@Override
	public List<MemberDTO> listOne(String m_id) {
		
		return memberMapper.listOne(m_id);
	}
	

	@Override
	public void memberTierupdate(String m_id, String msName) {
		memberMapper.memberTierupdate(m_id, msName);
		
	}

	@Override
	public void memberInfodelete(String m_id) {
		
		memberMapper.memberInfodelete(m_id);
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		memberMapper.memberUpdate(memberDTO);
	}

	

	



	


	





	

}
