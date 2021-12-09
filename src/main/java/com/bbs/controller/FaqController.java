package com.bbs.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbs.model.FaqDTO;
import com.bbs.model.Inquiry_classificationDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ViewPage;
import com.bbs.service.FaqService;
import com.bbs.service.Inquiry_classificationService;

@Controller
@RequestMapping("/faqviews/*")
public class FaqController {
	
	@Autowired
	 private FaqService faqService;
	
	@Autowired
	private Inquiry_classificationService ic_service;
	
	/* FAQ(자주하는질문) 페이지로 이동 */
	@GetMapping("/faq_view")
	public String faq_view(FaqDTO fdto,  Model model, Criteria cri) {
		
		String type = cri.getType();
		String keyWord = cri.getKeyword();
		System.out.println("검색한 type : " + type);
		System.out.println("검색한 내용 : " + keyWord);

		List<FaqDTO> faq_contents = faqService.getListPaging(cri);
		model.addAttribute("faq_contents", faq_contents);
		int total = faqService.getTotal(cri);
		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		return "/faqviews/faq_view";
	}
	
	/* FAQ(자주하는질문) 입력 페이지로 이동 */
	 @GetMapping("/faq_enroll_View")
	 public String faq_enroll(Model model) {
		System.out.println("게시판 등록 페이지 진입");
	
		/* 문의 분류 리스트 출력 */
		List<Inquiry_classificationDTO> dto = ic_service.listAll();
		model.addAttribute("dto", dto);
		
		 return "/faqviews/faq_enroll_View";
	 }
	 
	 /* FAQ(자주하는질문) DB에 입력 */
	 @PostMapping("/faq_enroll")
	 public String faq_enroll(FaqDTO fdto, RedirectAttributes rttr) {

		 faqService.faq_enroll(fdto);
		 rttr.addFlashAttribute("result", "faq 게시글 등록 성공");
		 
		 return "redirect:/faqviews/faq_view";
	 }
	 
	 /* FAQ(자주하는질문) 상세보기 페이지로 이동 */
	 @GetMapping("/faq_infoInquiry_Contents")
	 public String faq_infoInquiryContents(@RequestParam("faq_no") String faq_no, Model model) {
		System.out.println("faq 상세 보기");
		 
		Long fno = Long.parseLong(faq_no);
		FaqDTO fdto = faqService.getPage(fno);
		model.addAttribute("fdto", fdto);
		
		return "/faqviews/faq_infoInquiry_View";
	 }
	 
	 /* FAQ(자주하는질문) 수정 페이지로 이동 */
	 @GetMapping("/faq_update_View")
	 public String faq_updateForm(@RequestParam("faq_no")  String faq_no, Model model) {
		 System.out.println("수정 페이지 진입");
		 
		 Long fno = Long.parseLong(faq_no);
		 FaqDTO fdto = faqService.getPage(fno);
		 model.addAttribute("fdto", fdto);	
		 
		 return "/faqviews/faq_update_View";
	 }
	 
	 /* FAQ(자주하는질문) DB에 수정 */
	 @PostMapping("/faq_modify")
	 public String faq_modify(FaqDTO fdto, RedirectAttributes rttr) {
		 
		 faqService.faq_modify(fdto);
		 rttr.addFlashAttribute("result", "faq 게시글 수정 성공");
		 
		 return "redirect:/faqviews/faq_view";
	 }
	 
	 /* FAQ(자주하는질문) 삭제 */
	 @GetMapping("/faq_delete")
	 public String faq_delete(int faq_no, RedirectAttributes rttr) {
		  System.out.println("FAQ 삭제");
		  
		  faqService.faq_delete(faq_no);
		  rttr.addFlashAttribute("result", "faq 게시글 삭제 성공");
		  
		  return "redirect:/faqviews/faq_view";
	 }

}
