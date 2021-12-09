package com.bbs.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bbs.mapper.CouponMapper;
import com.bbs.model.AdminDTO;
import com.bbs.model.CouponDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"
})
public class CouponMapperTest {
	
	@Autowired
	private  CouponMapper couponMapper;
	
	
	//신규가입 쿠폰
	@Test
	public void couponFirstInsert() {
		
		for(Long i=1L; i<=50; i++) {
			
			couponMapper.couponFirstInsert(i);
		}
		
	}
	
//	@Test
//	public void couponlistOne() {
//		
//		List<CouponDTO> listOne = couponMapper.couponlistOne(1L);
//		
//		System.out.println(listOne);
//		
//	}
	
}
