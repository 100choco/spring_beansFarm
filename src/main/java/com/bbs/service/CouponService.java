package com.bbs.service;

import java.util.List;

import com.bbs.model.CouponDTO;

public interface CouponService {
	
	// 회원가입시 첫 쿠폰 지급
	public void couponFirstInsert(Long m_no);
	
	//관리자가 한 회원의 쿠폰 지급
	public void couponInsert(CouponDTO couponDTO);
	
	//선택한 회원에게 쿠폰 지급
	public void couponAllInsert(CouponDTO couponDTO);
	
	//로그인 한 회원의 전체 쿠폰리스트
	public List<CouponDTO> couponlistOne(Long m_no);

	

	

	
	
	
}
