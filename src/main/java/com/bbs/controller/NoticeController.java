package com.bbs.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbs.model.NoticeDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ViewPage;
import com.bbs.service.NoticeService;


@Controller
@RequestMapping("/noticeviews/*")
public class NoticeController {
	
	@Autowired
	public NoticeService noticeService;

	
	
//	공지사항 메인 페이지로 이동 (페이징 + 고정글 + 검색) 
	@GetMapping("/notice_view")
	public String notice_view(Model model, Criteria cri) {
		System.out.println("notice_view들어가기");

//		페이징
		String type = cri.getType();
		String keyWord = cri.getKeyword();
		System.out.println("검색한 type : " + type);
		System.out.println("검색한 내용 : " + keyWord);
		
//		검색 리스트 가져오기
		List<NoticeDTO> fixList = noticeService.noticeFixSelect();
//		페이징 리스트 가져오기
		List<NoticeDTO> noticeList = noticeService.listAll(cri);
		
//		페이징관련
		int total = noticeService.getTotal(cri);
		ViewPage vp = new ViewPage(cri, total);
		
//		고정글 내보내기
	    model.addAttribute("fixList", fixList);
//	    검색관련
	    model.addAttribute("noticeList", noticeList);
//	    페이징관련
	    model.addAttribute("pageMaker", vp);
	 
	    
		return "/noticeviews/notice_view";
	}
	
	
//	공지사항 내용 보여주는 부분
	@GetMapping("/notice_contents")
	public String notice_contents() {
		
		
		return "/noticeviews/notice_contents";
		
	}
	
//	공지사항 입력 화면 들어가기
	@GetMapping("/notice_insertView")
	public String gonoticeInsert(Model model) {
		
		System.out.println("notice_insertView 들어가기");
		return "/noticeviews/notice_insertView";
	}
	
//	공지사항 DB에 입력 하기
	@PostMapping("/notice_insert")
	public String insert(NoticeDTO dto ) {
		noticeService.noticeInsert(dto);
		
		System.out.println("insert 성공!!");
		return "redirect:/noticeviews/notice_view";
	}
	
//	공지사항 상세내용 보기
	@GetMapping("/notice_detail")
	public String notice_detail(@RequestParam("notice_no")String unotice_no, Model model,
			 HttpServletRequest request, HttpServletResponse response) {
		
//		unotice_no의 int notice_no 값으로 형변환
		int notice_no = Integer.parseInt(unotice_no);
//		형변환 한 값을 noticeList에 넣어줌
		List<NoticeDTO>	noticeList = noticeService.noticeDetail(notice_no);
		
//		조회수 중복 방지를 위한 쿠키 생성
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
//		쿠키가 존재한다면 cookies를 cookie에 넣고, 만약 cookie가 "postView"와 이름이 같다면 oldCookie에 cookie를 넣는다.
		if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
		
//		oldCookie가 존재한다면
		if (oldCookie != null) {
//			만약 oldCookie에 벨류에 unotice_no가 포함되지 않는다면 
	        if (!oldCookie.getValue().contains("[" + unotice_no.toString() + "]")) {  
	        	noticeService.updateviewcnt(notice_no);
//	        	oldCookie.setValue에 oldCooki.getValue를 넣고
	        	oldCookie.setValue(oldCookie.getValue() + "_[" + unotice_no + "]");
//	            경로로 쿠키 전송
	        	oldCookie.setPath("/");
//	            쿠키는 하루동안 유지
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	            
	        }
		} else {
				noticeService.updateviewcnt(notice_no);
//				newCookie에 Cookie대입
				Cookie newCookie = new Cookie("postView","[" + unotice_no + "]");
				newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        response.addCookie(newCookie);
	    	}
		
		model.addAttribute("noticeList" ,noticeList);
		
		return "/noticeviews/notice_detailView";
		}
	
	    

		
		
		
	
//	공지사항 게시물 삭제		
	@GetMapping("/notice_delete")
	public String delete(@RequestParam("notice_no")String unotice_no) {
		int notice_no = Integer.parseInt(unotice_no);
		
		noticeService.noticeDelete(notice_no);
		System.out.println("삭제성공!!");
		return "redirect:/noticeviews/notice_view";
	}	
	
//	공지사항 수정페이지로 이동
	@GetMapping("/notice_updateView")
	public String noticeUpdateForm(@RequestParam("notice_no") String unotice_no, Model model) {
	
		int notice_no = Integer.parseInt(unotice_no);
		
		List<NoticeDTO> dto = noticeService.noticeDetail(notice_no);
		
		
		model.addAttribute("dto", dto);
		System.out.println("notice_updateView 들어가기");
		return "/noticeviews/notice_updateView";
	}
	
//	공지사항 DB에 수정
	@PostMapping("/notice_updateForm") 
	public String modify(NoticeDTO dto, @RequestParam("notice_no") String unotice_no) {
		noticeService.noticeUpdate(dto);
		System.out.println("수정하기 성공!!");
		return "redirect:/noticeviews/notice_detail?notice_no="+ unotice_no;
	}
	
	
	
}
