package com.bbs.service;

import java.util.List;

import com.bbs.model.CartDTO;

public interface CartService {

	public List<CartDTO> selectAll(Long m_no);
	
	public void deleteOne(Long cart_no);

	public void deleteAll(Long m_no);

	public void goToCart(CartDTO c_dto);

	


}
