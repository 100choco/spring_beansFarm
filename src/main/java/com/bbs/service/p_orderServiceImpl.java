package com.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.P_orderMapper;
import com.bbs.model.P_orderDTO;

@Service
public class p_orderServiceImpl implements p_orderService{

	@Autowired
	private P_orderMapper p_orderMapper;
	
	@Override
	public void orderInsert(P_orderDTO p_orderDTO) {
		
		p_orderMapper.orderInsert(p_orderDTO);
	}
	
	

}
