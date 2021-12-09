package com.bbs.mapper;

import java.util.List;

import com.bbs.model.ProductDTO;

public interface OrderHistoryMapper {

	// 주문내역 조회.
	public List<ProductDTO> myOrderHistory(Long m_no);



}
