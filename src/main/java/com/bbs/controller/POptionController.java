package com.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbs.model.OptionClassificationDTO;
import com.bbs.model.POptionDTO;
import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.service.OptionClassificationService;
import com.bbs.service.POptionService;
import com.bbs.service.ProductService;

@Controller
@RequestMapping("/product/pOption/*")
public class POptionController {
	
	@Autowired
	public POptionService op;
	
	@Autowired
	public OptionClassificationService oc;
	
	@Autowired
	public ProductService product;
	
//	옵션 추가 페이지 이동
	@GetMapping("/op_insert_form")
	public String op_insert_form(Model model, Criteria cri) {
		
		List<POptionDTO> opList = op.selectByAll();
		List<ProductDTO> productList = product.selectByAll(cri);
		
		List<OptionClassificationDTO> ocList = oc.selectByAll();
		
		model.addAttribute("opList", opList);
		model.addAttribute("ocList", ocList);
		model.addAttribute("productList", productList);
		
		return "/product/pOption/pOptionPage";
		
	}
	
//	상품옵션 작성 요청
	@GetMapping("/op_insert")
	public String op_insert(POptionDTO dto) {
		
		
		
		op.insert(dto);
		
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	상품옵션 삭제 요청
	@GetMapping("/op_delete")
		public String op_delete(@RequestParam("op_no")String num) {
		
		int no = Integer.parseInt(num);
		
		op.delete(no);
		
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	상품옵션 수정 요청
	@GetMapping("/op_update")
	public String op_update(POptionDTO dto) {
		
		op.update(dto);
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
}
