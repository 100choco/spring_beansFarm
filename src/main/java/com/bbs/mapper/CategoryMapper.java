package com.bbs.mapper;

import java.util.List;

import com.bbs.model.CategoryDTO;

public interface CategoryMapper {
	
	public void insert(CategoryDTO dto);
	
	public List<CategoryDTO> selectByAll();
	
	public void update(CategoryDTO dto);
	
	public void delete(int category_no);
}
