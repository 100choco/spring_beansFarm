 package com.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.CartDTO;
import com.bbs.model.P_orderDTO;
import com.bbs.service.CartService;
import com.bbs.service.p_orderService;

@Controller
@RequestMapping("/orderviews/*")
public class OrderController {
	
	@Autowired
	private p_orderService p_orderService;
	
	@Autowired
	private CartService cartService;
	
	//주문ajax
	@PostMapping("/orderCon")
	@ResponseBody
	public String orderCon(Model model, @RequestParam("cart_no") List<String> cart_no1, CartDTO cartDTO, P_orderDTO p_orderDTO) {
		
		System.out.println("주문페이지번호넘기기");
		
		System.out.println("주문 번호 : " + cart_no1);
		
		
		
		for(String i : cart_no1) {
			
			long cart_no = Long.parseLong(i);
			
//			CartDTO cartDTO = cartService.selectByCartNo(cart_no);
//			p_orderDTO.setM_no(cartDTO.getM_no());
			p_orderService.orderInsert(p_orderDTO);
			System.out.println("======================>p_orderDTO : " + p_orderDTO);
			
		}
		
		
		
		
		
		return "/orderviews/orderCon";
	}
	
	
	@GetMapping("/orderCon_view")
	public String orderCon_view() {
		
		System.out.println("주문페이지로 가기");
		
		
		
		return "/orderviews/orderCon_view";
	}
	
	
	
	//이용약관
	@GetMapping("/terms")
	public String admin_B() {
		
		System.out.println("주문서 작성에 이용약관 불러오기");
		
		return "/orderviews/terms";
	}
	
	
	
}
