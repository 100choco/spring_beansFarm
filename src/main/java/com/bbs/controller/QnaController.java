package com.bbs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbs.model.Inquiry_classificationDTO;
import com.bbs.model.QnaDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;
import com.bbs.page.MypageViewPage;
import com.bbs.page.ViewPage;
import com.bbs.service.Inquiry_classificationService;
import com.bbs.service.QnaService;

import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/qnaviews/*")
public class QnaController {
	
	/* Q&A 서비스 */
	@Autowired
	private QnaService qnaService;
	
	/* 문의 분류 서비스 */
	@Autowired
	private Inquiry_classificationService ic_service;
	
	
	
	
	/* 관리자 Q&A 접속 페이지로 가기 */
	@GetMapping("/qna_view")
	public String qna_view(Model model, Criteria cri, HttpServletRequest request) {
		System.out.println("Q&A 들어가기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);

		List<QnaDTO> dto = qnaService.listPaging(cri);
		
		model.addAttribute("dto", dto);
			
		int total = qnaService.getTotal();
		ViewPage vp = new ViewPage(cri, total);
			
		model.addAttribute("pageMaker", vp);


		return "/qnaviews/qna_view";
	}
	
	
	
	
	
	// 회원 Q&A 들어가기
	@GetMapping("/qna_user_view")
	public String qna_user_view(Model model, MypageCriteria cri, HttpServletRequest request) {
		System.out.println("Q&A 들어가기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);

	    cri.setM_no(m_no);
		
		List<QnaDTO> dto = qnaService.view_user(cri);
		
		model.addAttribute("dto", dto);
			
		int total = qnaService.getTotal();
		MypageViewPage vp = new MypageViewPage(cri, total);
			
		model.addAttribute("pageMaker", vp);


		return "/qnaviews/qna_view";
	}
	
	
	
	/* Q&A 작성 화면으로 들어가기 */
	@GetMapping("/qna_insert_view")
	public String qna_insertView(Model model) {
		System.out.println("Q&A 작성 화면");
		
		/* 문의분류 리스트 조회 */
		List<Inquiry_classificationDTO> dto = ic_service.listAll();
		model.addAttribute("dto", dto);
		
		return "/qnaviews/qna_insertView";
	}
	
	
	
	/* Q&A 작성 */
	@PostMapping("/qna_insert")
	public String qna_insert(QnaDTO dto, RedirectAttributes rttr, Model model, 
							@RequestParam("uuid") String uuid) {
		
		System.out.println("Q&A 입력");
		
		if(!dto.getQ_image().isEmpty()) {
			String fileName = uuid + "_" + dto.getQ_image();
			dto.setQ_image(fileName);
		}else {
			dto.setQ_image("null");
		}
		
		qnaService.insert(dto);	
		
		rttr.addFlashAttribute("result", "qna 게시글 등록");
		
		return "redirect:/qnaviews/qna_user_view";
	}
	
	
	// ======================================= 파일업로드 ====================================================
	@ResponseBody
	@PostMapping("/qna_upload")
	private void upload(MultipartFile[] uploadFile, String uuid) {
		
		String uploadFolder = "C:\\beansFarm\\qna";
		
		for(MultipartFile mf:uploadFile) {
			
			String fileName = uuid + "_" + mf.getOriginalFilename();

			File savefile = new File(uploadFolder, fileName);
			
			try {
				mf.transferTo(savefile);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	
	
	
	/* Q&A 상세보기 화면으로 들어가기 */
	@GetMapping("/qna_oneview")
	public String qna_oneview(@RequestParam("q_no") String q_no, Model model) {
		System.out.println("Q&A 상세보기");
		
		Long qno = Long.parseLong(q_no);
		
		QnaDTO dto = qnaService.viewOne(qno);
		
		model.addAttribute("dto", dto);
		
		return "/qnaviews/qna_oneView";
	}
	
	
	
	/* Q&A 삭제 */
	@GetMapping("/qnaDelete")
	public String qna_Delete(QnaDTO qnaDTO, @RequestParam("q_no") String q_no, RedirectAttributes rttr) {
		System.out.println("Q&A 삭제");
		
		Long qno = Long.parseLong(q_no);
		
		QnaDTO dto = qnaService.viewOne(qno);
		
		String q_img = dto.getQ_image();
		
		fileDelete(q_img);
		
		qnaService.delete(qno);
		
		rttr.addFlashAttribute("result", "qna 게시글 삭제");
		
		return "redirect:/qnaviews/qna_view";
	}
	
	// ======================================= 파일삭제 ====================================================
		private void fileDelete(String fileName) {
		
		String filePath = "C:\\beansFarm\\qna";
		
		File file = new File(filePath+ File.separator +fileName);
		
		file.delete();
		
	}
	
	
	/* Q&A 수정 화면으로 들어가기 */
	@GetMapping("/qnaUpdateView")
	public String qnaUpdateView(@RequestParam("q_no") String q_no, Model model) {
		System.out.println("Q&A 수정 화면");
				
		
		Long qno = Long.parseLong(q_no);

		QnaDTO dto = qnaService.viewOne(qno);
		
		
		/* 문의분류 리스트 조회 */
		List<Inquiry_classificationDTO> ic = ic_service.listAll();
		
		model.addAttribute("dto", dto);
		model.addAttribute("ic", ic);
		
		return "/qnaviews/qna_updateView";
	}
	
	
	
	/* Q&A 수정 */
	@PostMapping("/qna_update")
	public String qna_update(@RequestParam("q_no") String q_no,
			@RequestParam("uuid") String uuid,
			QnaDTO dto, RedirectAttributes rttr) {
		System.out.println("Q&A 수정");
		
		
		Long qno = Long.parseLong(q_no);
		QnaDTO viewOne = qnaService.viewOne(qno);
		String q_img = viewOne.getQ_image();
		fileDelete(q_img);
		System.out.println("이전이미지 삭제하기 : " + q_img);
		
		if(!dto.getQ_image().isEmpty()) {
			String fileName = uuid + "_" + dto.getQ_image();
			dto.setQ_image(fileName);
			System.out.println("새이미지 등록하기 : " + fileName);
		}else {
			dto.setQ_image("null");
		}
		
		
		qnaService.update(dto);
		
		rttr.addFlashAttribute("result", "qna 게시글 수정");
		
		return "redirect:/qnaviews/qna_oneview?q_no="+ qno;
	}
	
	

	/* Q&A 답변 입력 및 수정 */
	@PostMapping("/qna_answer")
	@ResponseBody
	public String qna_answer(QnaDTO dto) {
		System.out.println("Q&A 답변 입력");
	
		 qnaService.answerajax(dto);
	
		return "success";
	}
	
	
	
	/* Q&A 답변 삭제 */
	@PostMapping("/qna_delAjax")
	@ResponseBody
	public String qna_dleAjax(QnaDTO dto) {
		System.out.println("Q&A 답변 삭제");
		
		System.out.println(dto);
		
		Long qno = dto.getQ_no();
		
		qnaService.answerDeleteAjax(dto);

		return "success";
	}
	

}
