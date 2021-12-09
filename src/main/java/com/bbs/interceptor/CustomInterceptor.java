package com.bbs.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.model.AdminDTO;
import com.bbs.model.CategoryDTO;
import com.bbs.model.MemberDTO;
import com.bbs.service.AdminService;
import com.bbs.service.CategoryService;
import com.bbs.service.MemberService;

public class CustomInterceptor implements HandlerInterceptor{
	@Autowired
	private CategoryService category;
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {


		// 카테고리
		List<CategoryDTO>categoryList = category.selectByAll();
		request.setAttribute("categoryList", categoryList);
		
		
	}
}
