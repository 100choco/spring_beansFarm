package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.OrderHistoryMapper;
import com.bbs.model.ProductDTO;


@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryMapper mapper;
	
	@Override
	public List<ProductDTO> myOrderHistory(Long m_no) {
		
		return mapper.myOrderHistory(m_no);
	}
	
	

}
