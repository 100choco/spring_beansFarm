package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.OriginMapper;
import com.bbs.model.OriginDTO;

@Service
public class OriginServiceImpl implements OriginService {
	
	@Autowired
	public OriginMapper mapper;	
	
	@Override
	public void insert(OriginDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<OriginDTO> selectByAll() {
		
		return mapper.selectByAll();
	}

	@Override
	public void update(OriginDTO dto) {
		mapper.update(dto);

	}

	@Override
	public void delete(int origin_no) {
		mapper.delete(origin_no);
	}

}
