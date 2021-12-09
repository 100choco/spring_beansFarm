package com.bbs.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bbs.mapper.AdminMapper;
import com.bbs.model.AdminDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"
})
public class AdminMapperTest {
	
	@Autowired
	private  AdminMapper adminMapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Test
	public void adminInsertTest() {
		
		for(int i=1; i<=10; i++) {
			AdminDTO adminDTO = new AdminDTO();
			
			
			adminDTO.setManager_id("admin"+i);
			adminDTO.setManager_pw(pwencoder.encode("apw"+i));
			adminDTO.setManager_name("adminname"+i);
			
			adminMapper.adminInsert(adminDTO);
		}
	}
	
//	@Test
//	public void adminPwChkTest() {
//		AdminDTO adminDTO = adminMapper.adminPwChk("admin1");
//		
//		System.out.println(adminDTO);
//		
//	}
	
}
