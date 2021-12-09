package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.OriginMapper;
import com.bbs.model.OriginDTO;
import com.bbs.service.OriginService;
import com.bbs.service.OriginServiceImpl;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OriginMapparTest {
	
	@Autowired
	public OriginMapper originMaper;
	
	@Autowired
	public OriginService origin;

	@Test
	public void insertTest() {
		OriginDTO dto = new OriginDTO();
	
		dto.setOrigin_name("에티오피아");
		
		

		origin.insert(dto);
	}
	
	//@Test
	public void selectTest() {
		List<OriginDTO> list = origin.selectByAll();
		
		System.out.println("=======================");
		System.out.println(list);
	}
	
	//@Test
	public void updateTest() {
		OriginDTO dto = new OriginDTO();
		
		dto.setOrigin_no(1);
		dto.setOrigin_name("브라질");
		
		originMaper.update(dto);
	}
	
	//@Test
	public void deleteTest() {
		OriginDTO dto = new OriginDTO();
		
		originMaper.delete(2);
	}
}
