package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.OptionClassificationMapper;
import com.bbs.mapper.OriginMapper;
import com.bbs.model.OptionClassificationDTO;
import com.bbs.model.OriginDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OptionClassificationMapperTest {
	
	@Autowired
	public OptionClassificationMapper mapper;

	@Test
	public void insertTest() {
		OptionClassificationDTO dto = new OptionClassificationDTO();
	
		dto.setOc_name("테스트");
		
		

		mapper.insert(dto);
	}
	
	@Test
	public void selectTest() {
		OptionClassificationDTO dto = new OptionClassificationDTO();
		
		List<OptionClassificationDTO> list = mapper.selectByAll();
		
		System.out.println(list);
	}
	
	@Test
	public void updateTest() {
		OptionClassificationDTO dto = new OptionClassificationDTO();
		
		dto.setOc_no(1);
		dto.setOc_name("테스트22");
		
		mapper.update(dto);
		
		
	}
	
	@Test
	public void deleteTest() {
		OptionClassificationDTO dto = new OptionClassificationDTO();
		
		mapper.delete(1);
	}
}
