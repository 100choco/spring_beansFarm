package com.bbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbs.model.ProductDTO;


public interface OrderHistoryService {

	List<ProductDTO> myOrderHistory(Long m_no);
	
	
}
