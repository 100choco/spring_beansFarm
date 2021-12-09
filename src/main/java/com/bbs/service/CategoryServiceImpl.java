package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.CategoryMapper;
import com.bbs.model.CategoryDTO;
@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper mapper;

	@Override
	public void insert(CategoryDTO dto) {
		mapper.insert(dto);

	}

	@Override
	public List<CategoryDTO> selectByAll() {
		return mapper.selectByAll();
	}

	@Override
	public void update(CategoryDTO dto) {
		mapper.update(dto);

	}

	@Override
	public void delete(int category_no) {
		mapper.delete(category_no);
	}

}
