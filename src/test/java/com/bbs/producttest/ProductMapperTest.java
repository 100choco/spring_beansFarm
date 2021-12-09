package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.POptionMapper;
import com.bbs.mapper.ProductDetailsPageMapper;
import com.bbs.mapper.ProductMapper;
import com.bbs.model.POptionDTO;
import com.bbs.model.ProductDTO;
import com.bbs.model.ProductDetailsPageDTO;
import com.bbs.page.ProductCriteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {
	
	@Autowired
	public ProductMapper mapper;

	@Test
	public void insertTest() {
		ProductDTO dto = new ProductDTO();
		
		dto.setCategory_no(1);
		dto.setP_name("커피콩");
		dto.setP_price(15000);
		dto.setP_manufacturer("커피팜");
		dto.setOrigin_no(1);
		dto.setP_image("///");
		dto.setP_thumbnail("///");
		
		

		mapper.insert(dto);
	}
	
	//@Test
	public void selectByName() {
		List<ProductDTO> list = mapper.selectByName("%콩콩콩%");
		
		//System.out.println(list);
	}
	
	//@Test
	public void selectByOrigin() {
		List<ProductDTO> list = mapper.selectByOrigin("에티오피아");
		System.out.println("======================");
		System.out.println(list);
		System.out.println("======================");

	}
	
	//@Test
	public void updateTest() {
		ProductDTO dto = new ProductDTO();
		
		dto.setP_no(1);
		dto.setCategory_no(3);
		dto.setP_name("콩콩콩");
		dto.setP_price(222);
		dto.setP_manufacturer("커피팜");
		dto.setOrigin_no(3);
		dto.setP_image("///");
		
		
		//mapper.update(dto);
	}
	
	//@Test
	public void deleteTest() {
		ProductDTO dto = new ProductDTO();
		
		mapper.delete(2);
	}
}
