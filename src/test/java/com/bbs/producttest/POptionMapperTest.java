package com.bbs.producttest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbs.mapper.POptionMapper;
import com.bbs.model.POptionDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class POptionMapperTest {
	
	@Autowired
	public POptionMapper mapper;

	@Test
	public void insertTest() {
		POptionDTO dto = new POptionDTO();
		
		dto.setOp_name("옵션이름");
		dto.setOp_price(3000);
		dto.setOp_stock(0);
		dto.setOc_no(3);

		//mapper.insert(dto);
	}
	
	@Test
	public void selectTest() {
		List<POptionDTO> list = mapper.selectByAll();
		
		//System.out.println(list);
	}
	
	@Test
	public void updateTest() {
		POptionDTO dto = new POptionDTO();	
		
		dto.setOp_no(3);
		dto.setOp_name("옵션이름변경");
		dto.setOp_price(30000);
		dto.setOp_stock(12);
		dto.setOc_no(2);
		
		System.out.println("============================"+dto);
		
		mapper.update(dto);
	}
	
	@Test
	public void deleteTest() {
		POptionDTO dto = new POptionDTO();
		
		mapper.delete(1);
	}
}
