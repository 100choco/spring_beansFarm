package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.CartMapper;
import com.bbs.model.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Override
	public List<CartDTO> selectAll(Long m_no) {
		
		return mapper.selectAll(m_no);
	}
	
	@Override
	public void deleteOne(Long cart_no) {
		mapper.deleteOne(cart_no);
		
	}

	@Override
	public void deleteAll(Long m_no) {
		mapper.deleteAll(m_no);
		
	}

	@Override
	public void goToCart(CartDTO c_dto) {
		
		mapper.goToCart(c_dto);
		
	}

	



}
