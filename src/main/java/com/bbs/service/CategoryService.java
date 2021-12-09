package com.bbs.service;

import java.util.List;

import com.bbs.model.CategoryDTO;

public interface CategoryService {

	public void insert(CategoryDTO dto);

	public List<CategoryDTO> selectByAll();

	public void update(CategoryDTO dto);

	public void delete(int category_no);
}
