package com.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbs.model.CategoryDTO;
import com.bbs.model.ProductDTO;
import com.bbs.page.ProductCriteria;
import com.bbs.page.ProductViewPage;
import com.bbs.service.CategoryService;
import com.bbs.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService product;

//	전체제품 페이지로 이동
	@GetMapping("/product_view")
	public String product_view(Model model, ProductCriteria cri ) {
		List<ProductDTO>productList = product.selectByAllPage(cri);
		model.addAttribute("productList", productList);
		
		int total = product.getTotal(cri);
		ProductViewPage vp = new ProductViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		return "/product/product_view";
	}
	
//	제품 상세페이지 이동
	@GetMapping("/details/detailsCon_view")
	public String detailsCon_view(Model model, ProductCriteria cri ) {
		
		System.out.println("제품 상세페이지 이동");
		
		return "/product/details/detailsCon_view";
	}
}
