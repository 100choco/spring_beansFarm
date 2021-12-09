package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.POptionMapper;
import com.bbs.model.POptionDTO;
@Service
public class POptionServiceImpl implements POptionService {
	
	@Autowired
	POptionMapper mapper;

	@Override
	public void insert(POptionDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<POptionDTO> selectByAll() {
		return mapper.selectByAll();
	}

	@Override
	public void update(POptionDTO dto) {
		mapper.update(dto);
	}

	@Override
	public void delete(int op_no) {
		mapper.delete(op_no);
	}

	@Override
	public void pNoDelete(long p_no) {
		mapper.pNoDelete(p_no);
	}

	@Override
	public List<POptionDTO> selectByPNo(Long p_no) {
		
		return mapper.selectByPNo(p_no);
	}

	@Override
	public POptionDTO selectByOpNo(int op_no) {
		
		return mapper.selectByOpNo(op_no);
	}

}
