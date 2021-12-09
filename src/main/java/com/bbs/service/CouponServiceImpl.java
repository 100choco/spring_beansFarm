package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.CouponMapper;
import com.bbs.model.CouponDTO;


@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	private CouponMapper couponMapper;

	// 회원가입시 첫 쿠폰 지급
	@Override
	public void couponFirstInsert(Long m_no) {
		couponMapper.couponFirstInsert(m_no);
		
	}
	
	
	//관리자가 한 회원의 쿠폰 지급
	@Override
	public void couponInsert(CouponDTO couponDTO) {
		couponMapper.couponInsert(couponDTO);
		
	}

	
	//선택한 회원에게 쿠폰 지급
	@Override
	public void couponAllInsert(CouponDTO couponDTO) {
		couponMapper.couponAllInsert(couponDTO);
	}
		
		
		
	//로그인 한 회원의 전체 쿠폰리스트
	@Override
	public List<CouponDTO> couponlistOne(Long m_no) {
		
		return couponMapper.couponlistOne(m_no);
	}

	

	

	
	
	

	
	

	

	
	

}
