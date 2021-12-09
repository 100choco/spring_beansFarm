package com.bbs.mapper;

import java.util.List;

import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ProductCriteria;



public interface ProductMapper {

	public void insert(ProductDTO dto);
	
	public List<ProductDTO> selectByAll(Criteria cri);
	public List<ProductDTO> selectByAllPage(ProductCriteria cri);
	public List<ProductDTO> selectByName(String p_name);
	public List<ProductDTO> selectByOrigin(String origin_name);
	public List<ProductDTO> selectByAllDetails();
	public ProductDTO selectByPNo(long p_no);
	
	public void update(ProductDTO dto);
	
	public void delete(long p_no);
	
	// 페이지 숫자
	public int getTotal(ProductCriteria cri);

	public int prodGetTotal(Criteria cri);
	
	public List<ProductDTO> headerSearch(String p_name);
	
}
