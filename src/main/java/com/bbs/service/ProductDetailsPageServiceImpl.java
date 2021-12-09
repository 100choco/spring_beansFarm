package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.ProductDetailsPageMapper;
import com.bbs.model.ProductDTO;
import com.bbs.model.ProductDetailsPageDTO;
import com.bbs.page.ProductDetailsCriteria;
@Service
public class ProductDetailsPageServiceImpl implements ProductDetailsPageService {

	@Autowired
	ProductDetailsPageMapper mapper;
	
	@Override
	public void insert(ProductDetailsPageDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<ProductDetailsPageDTO> selectByAll() {
		return mapper.selectByAll();
	}

	@Override
	public void update(ProductDetailsPageDTO dto) {
		mapper.update(dto);
	}

	@Override
	public void delete(long p_no) {
		mapper.delete(p_no);
	}

	@Override
	public ProductDetailsPageDTO selectByPNo(long p_no) {
		return mapper.selectByPNo(p_no);
	}
	
	@Override
	public List<ProductDTO> product_all_review_list(ProductDetailsCriteria cri) {
		System.out.println("123  cri******** " + cri);
		return mapper.product_all_review_list(cri);
	}

	@Override
	public int reviewCount(Long p_no) {
		
		return mapper.reviewCount(p_no);
	}

	@Override
	public int getTotal(Long p_no) {
		
		return mapper.getTotal(p_no);
	}
}
