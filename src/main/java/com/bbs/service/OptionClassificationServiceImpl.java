package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.OptionClassificationMapper;
import com.bbs.model.OptionClassificationDTO;
@Service
public class OptionClassificationServiceImpl implements OptionClassificationService {
	
	@Autowired
	OptionClassificationMapper mapper;

	@Override
	public void insert(OptionClassificationDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<OptionClassificationDTO> selectByAll() {
		return mapper.selectByAll();
	}

	@Override
	public void update(OptionClassificationDTO dto) {
		mapper.update(dto);
	}

	@Override
	public void delete(int oc_no) {
		mapper.delete(oc_no);
	}

}
