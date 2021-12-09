package com.bbs.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bbs.mapper.MemberMapper;
import com.bbs.model.MemberDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"
})
public class MemberMapperTest {
	
	@Autowired
	private  MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Test
	public void memberInsert() {
		
		for(int i=1; i<=50; i++) {
			MemberDTO memberDTO = new MemberDTO();
			
			
			memberDTO.setM_id("id"+i);
			memberDTO.setM_pw(pwencoder.encode("pw"+i));
			memberDTO.setM_name("m_name"+i);
			memberDTO.setM_phone("010-" + (1000+i) +"-"+ (1000+i));
			memberDTO.setM_postnum("p"+i);
			memberDTO.setM_address("m_address"+i);
			memberDTO.setM_detailed_address("m_detailed_address"+i);
			memberDTO.setM_email("m_email"+i+"@naver.com");
			
			memberMapper.memberInsert(memberDTO);
		}
	}
	
//	@Test
//	public void memberLogin() {
//		MemberDTO memberLogin = memberMapper.memberLogin("id5");
//		
//		System.out.println(memberLogin);
//	}
	
//	@Test
//	public void emailChkajax() {
//		int emailChkajax = memberMapper.emailChkajax("aqz00267@naver.com");
//		
//		System.out.println(emailChkajax);
//	}
	
//	@Test
//	public void pwUpdate() {
//		MemberDTO memberDTO = memberMapper.pwUpdate("id1");
//		memberDTO.setM_pw("test");
//		
//		
//		System.out.println(memberDTO);
//	}
	
//	@Test
//	public void mamberListAllTest() {
//		
//		List<MemberDTO> list_all = memberMapper.list_all();
//		
//		for(MemberDTO i : list_all) {
//			System.out.println(i);
//		}
//		
//		
//	}
	
//	@Test
//	public void mamberListOneTest() {
//		
//		List<MemberDTO> listOne = memberMapper.listOne("id1");
//		
//		System.out.println(listOne);
//		
//		
//	}
//	
}
