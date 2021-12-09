package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.CartDTO;
import com.bbs.service.CartService;

@Controller
@RequestMapping("/cartviews/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	
	
	// 장바구니 페이지 가기
	@GetMapping("/cart_view")
	public String cart_view(CartDTO cartDTO, Model model, HttpServletRequest request) {
		
		System.out.println("장바구니 페이지로 가기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		List<CartDTO> cartAllList = cartService.selectAll(m_no);
		
		model.addAttribute("cartAllList", cartAllList);
		
		
		System.out.println(cartAllList);
		
		return "/cartviews/cart_view";
	}
	
	// 상세페이지에서 선택한 상품 ajax로 장바구니에 넣기.
	@PostMapping("/goToCart")
	@ResponseBody
	public String goToCart(
			@RequestParam("m_no") Long m_no, @RequestParam("p_no") Long p_no, @RequestParam("op_no1") int op_no1
			, @RequestParam("option_quantity1") int option_quantity1, @RequestParam("op_no2") int op_no2, @RequestParam("order_price") int order_price
			) {
		
		CartDTO c_dto = new CartDTO();
		
		c_dto.setM_no(m_no);
		c_dto.setP_no(p_no);
		c_dto.setOp_no1(op_no1);
		c_dto.setOption_quantity1(option_quantity1);
		c_dto.setOp_no2(op_no2);
		c_dto.setOrder_price(order_price);
		
		cartService.goToCart(c_dto);
		
		System.out.println("===========" + c_dto);
		
		System.out.println(m_no+"==========="+p_no+"==========="+op_no1+"==========="+option_quantity1+"==========="+op_no2+"==========="+order_price);
		
		
		return "heyheyhey";
	}
	
	
	// 선택항목 삭제하기
	@PostMapping("/cartOneDelete")
	@ResponseBody
	public String cartOneDelete(
			@RequestParam("cart_no") List<String> cart_no1,
			CartDTO cartDTO) {
		
		System.out.println("장바구니 선택한 항목 삭제 실행하기");
		
		System.out.println("장바구니 삭제 할 번호 : " + cart_no1);
		
		for(String i : cart_no1) {
			long cart_no = Long.parseLong(i);
			cartDTO.setCart_no(cart_no);
			cartService.deleteOne(cart_no);
		}
		
		
		
		return "/cartviews/cartOneDelete";
	}
	
	
	// 전체 삭제하기
	@GetMapping("/cartAllDelete")
	public String cartAllDelete(HttpServletRequest request) {
		
		System.out.println("장바구니 전체 항목 삭제 실행하기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		cartService.deleteAll(m_no);
		
		System.out.println("장바구니 전체 항목 삭제 완료");
		
		return "/cartviews/cart_view";
	}
	
	
}
