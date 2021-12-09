package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.CategoryMapper;
import com.bbs.model.CategoryDTO;
import com.bbs.service.CategoryService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CategoryMapperTest {
	
	@Autowired
	public CategoryMapper mapper;
	
	@Autowired
	public CategoryService ser;

	@Test
	public void insertTest() {
		CategoryDTO dto = new CategoryDTO();
	
		dto.setCategory_name("테스트 카테고리");
		
		

		ser.insert(dto);
	}
	
	//@Test
	public void selectTest() {
		List<CategoryDTO> list = mapper.selectByAll();
		
		System.out.println(list);
	}
	
	//@Test
	public void updateTest() {
		CategoryDTO dto = new CategoryDTO();
		
		dto.setCategory_no(1);
		dto.setCategory_name("카테고리 테스트 업데이트");
		
		mapper.update(dto);
	}
	
	//@Test
	public void deleteTest() {
		CategoryDTO dto = new CategoryDTO();
		
		mapper.delete(1);
	}
}
