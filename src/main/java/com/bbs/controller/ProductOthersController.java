package com.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbs.model.CategoryDTO;
import com.bbs.model.OptionClassificationDTO;
import com.bbs.model.OriginDTO;
import com.bbs.service.CategoryService;
import com.bbs.service.OptionClassificationService;
import com.bbs.service.OriginService;

@Controller
@RequestMapping("/product/*/*")
public class ProductOthersController {
	
	@Autowired
	public CategoryService category;

//	카테고리 등록 form 요청
	@GetMapping("/category_insert_form")
	public String category_insert_form(Model model) {

		List<CategoryDTO> list = category.selectByAll();

		model.addAttribute("list", list);

		return "/product/category/categoryPage";
	}
	
//	카테고리 등록 요청	
	@GetMapping("/category_insert")
	public String category_insert(CategoryDTO dto) {


		if (!dto.getCategory_name().isEmpty()) {
			category.insert(dto);
		}
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	카테고리 삭제 요청	
	@GetMapping("/category_delete")
	public String category_delete(@RequestParam("categoryNum")String num) {
		
		int categoryNum = Integer.parseInt(num);
		
		category.delete(categoryNum);
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	카테고리 수정 요청
	@GetMapping("/category_update")
	public String category_update(CategoryDTO dto) {
		
			category.update(dto);
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
// ===================================================================================
	
	@Autowired
	public OriginService origin;
	
//	원산지 등록 form 요청
	@GetMapping("/origin_insert_form")
	public String origin_insert_form(Model model) {
		
	
		List<OriginDTO> list = origin.selectByAll();
			
		model.addAttribute("list", list);


		return "/product/origin/originPage";
	}
	
//	원산지 등록 요청 
	@GetMapping("/origin_insert")
	public String origin_insert(OriginDTO dto) {
		
			origin.insert(dto);
		
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	원산지 삭제 요청	
	@GetMapping("/origin_delete")
	public String origin_delete(@RequestParam("originNum")String num) {
		
		int originNum = Integer.parseInt(num);
		
		origin.delete(originNum);
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
//	원산지 수정 요청
	@GetMapping("/origin_update")
	public String origin_update(OriginDTO dto) {
		
		origin.update(dto);
		
		return "redirect:/adminviews/adminOptionManage_view";
	}
	
	// ===================================================================================
	
		@Autowired
		OptionClassificationService oc;
		
//		옵션분류 작성(form)요청
		@GetMapping("/optionClassification_insert_form")
		public String optionClassification_insert_form(Model model) {
			
		
			List<OptionClassificationDTO> list = oc.selectByAll();
				
			model.addAttribute("list", list);


			return "/product/optionClassification/optionClassificationPage";
		}
		
//		옵션분류 작성 요청
		@GetMapping("/optionClassification_insert")
		public String optionClassification_insert(OptionClassificationDTO dto) {
			
				oc.insert(dto);
			
			
			return "redirect:/adminviews/adminOptionManage_view";
		}
		
//		옵션분류 삭제 요청
		@GetMapping("/optionClassification_delete")
		public String optionClassification_delete(@RequestParam("ocNum")String num) {
			
			int ocNum = Integer.parseInt(num);
			
			oc.delete(ocNum);
			
			return "redirect:/adminviews/adminOptionManage_view";
		}
		
//		옵션분류 수정 요청
		@GetMapping("/optionClassification_update")
		public String optionClassification_update(OptionClassificationDTO dto) {
			
			oc.update(dto);
			
			return "redirect:/adminviews/adminOptionManage_view";
		}
	
}
