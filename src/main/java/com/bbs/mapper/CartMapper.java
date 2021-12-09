package com.bbs.mapper;

import java.util.List;

import com.bbs.model.CartDTO;

public interface CartMapper {

	public List<CartDTO> selectAll(Long m_no);
	
	public void deleteOne(Long cart_no);

	public void deleteAll(Long m_no);

	public void goToCart(CartDTO c_dto);

	


	
}
