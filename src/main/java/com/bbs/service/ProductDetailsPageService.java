package com.bbs.service;

import java.util.List;

import com.bbs.model.ProductDTO;
import com.bbs.model.ProductDetailsPageDTO;
import com.bbs.page.ProductDetailsCriteria;

public interface ProductDetailsPageService {

	public void insert(ProductDetailsPageDTO dto);

	public List<ProductDetailsPageDTO> selectByAll();
	
	public ProductDetailsPageDTO selectByPNo(long p_no);

	public void update(ProductDetailsPageDTO dto);

	public void delete(long p_no);
	
	public List<ProductDTO> product_all_review_list(ProductDetailsCriteria cri);

	public int reviewCount(Long p_no);

	public int getTotal(Long p_no);
}
