package com.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bbs.service.CategoryService;

@Controller
public class MainController {
	
	@Autowired
	CategoryService category;
	
	//메인페이지
	@GetMapping("/")
	public String main_view() {
		
		
		return "mainviews/main_view";
	}
	
	
	
	// 로그아웃하기
	@PostMapping("/logoutAjax")
	public String logoutAjax(HttpServletRequest request) {
		
		System.out.println("logoutAjax 실행");
		
		HttpSession session = request.getSession();
//			session.getAttribute("userID");
//			session.getAttribute("userName");
		session.invalidate();
		
		System.out.println("로그아웃하기");
		
		return "redirect:/";
	}
	
	
}
