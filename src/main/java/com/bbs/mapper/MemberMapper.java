package com.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.model.MemberDTO;
import com.bbs.page.AdminCriteria;
import com.bbs.page.Criteria;

public interface MemberMapper {

	// 회원등록
	public void memberInsert(MemberDTO memberDTO);

	// 아이디체크
	public int idchkAjax(String m_id);

	// 아이디 비번 체크 후 로그인
	public int loginChkAjax(@Param("m_id") String m_id, @Param("m_pw") String m_pw);

	// 회원 한명의 정보 불러오기
	public MemberDTO memberLogin(String m_id);
	
	// 회원의 이메일로 아이디 찾기
	public String emailChkajax(String m_email);

	// 아이디로 비번 변경
	public void pwUpdate(@Param("m_id") String m_id, @Param("m_pw") String m_pw);

	// 이메일 체크
	public int emailchkAjax(String m_email);

	// 회원 전체 리스트(관리자메인)
	public List<MemberDTO> listAllMain(AdminCriteria cri);
	
	// 페이지 숫자(관리자메인)
	public int getTotalMain(AdminCriteria cri);
	
	// 회원 전체 리스트
	public List<MemberDTO> listAll(Criteria cri);
	
	// 페이지 숫자
	public int getTotal(Criteria cri);

	// 회원 삭제
	public void memberdelete(String m_id);

	// 회원 한명의 정보 불러오기
	public List<MemberDTO> listOne(String m_id);

	// 회원 등급 변경하기
	public void memberTierupdate(@Param("m_id") String m_id, @Param("msName") String msName);

	// 회원 정보 완전 삭제
	public void memberInfodelete(String m_id);

	// 회원정보 수정
	public void memberUpdate(MemberDTO memberDTO);

	



}
