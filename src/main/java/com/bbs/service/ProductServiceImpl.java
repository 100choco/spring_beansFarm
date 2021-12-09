package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.ProductMapper;
import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ProductCriteria;
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper mapper;

	@Override
	public void insert(ProductDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<ProductDTO> selectByAll(Criteria cri) {
		return mapper.selectByAll(cri);
	}

	@Override
	public List<ProductDTO> selectByName(String p_name) {
		return mapper.selectByName(p_name);
	}

	@Override
	public List<ProductDTO> selectByOrigin(String origin_name) {
		return mapper.selectByOrigin(origin_name);
	}

	@Override
	public void update(ProductDTO dto) {
		mapper.update(dto);
	}

	@Override
	public void delete(long p_no) {
		mapper.delete(p_no);
	}

	@Override
	public ProductDTO selectByPNo(long p_no) {
		return mapper.selectByPNo(p_no);
	}

	@Override
	public List<ProductDTO> selectByAllDetails() {
		return mapper.selectByAllDetails();
	}

	@Override
	public List<ProductDTO> selectByAllPage(ProductCriteria cri) {
		return mapper.selectByAllPage(cri);
	}

	@Override
	public int getTotal(ProductCriteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public int prodGetTotal(Criteria cri) {
		
		return mapper.prodGetTotal(cri);
	}
	
	@Override
	public List<ProductDTO> headerSearch(String p_name) {
		
		return mapper.headerSearch(p_name);
	}

}
