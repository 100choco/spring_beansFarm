package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.POptionMapper;
import com.bbs.mapper.ProductDetailsPageMapper;
import com.bbs.model.POptionDTO;
import com.bbs.model.ProductDetailsPageDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductDetailsPageMapperTest {
	
	@Autowired
	public ProductDetailsPageMapper mapper;

	@Test
	public void insertTest() {
		ProductDetailsPageDTO dto = new ProductDetailsPageDTO();
		
		dto.setP_no(1);
		dto.setPd_image("//////");
		

		mapper.insert(dto);
	}
	
	@Test
	public void selectTest() {
		List<ProductDetailsPageDTO> list = mapper.selectByAll();
		
		System.out.println(list);
	}
	
	@Test
	public void updateTest() {
		ProductDetailsPageDTO dto = new ProductDetailsPageDTO();
		
		dto.setP_no(1);
		dto.setPd_image("//a//a");
		
		
		System.out.println("============================"+dto);
		
		mapper.update(dto);
	}
	
	@Test
	public void deleteTest() {
		ProductDetailsPageDTO dto = new ProductDetailsPageDTO();
		
		//mapper.delete(1);
	}
}
