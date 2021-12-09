 package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.AdminDTO;
import com.bbs.model.CouponDTO;
import com.bbs.model.Inquiry_classificationDTO;
import com.bbs.model.MemberDTO;
import com.bbs.page.AdminCriteria;
import com.bbs.page.AdminViewPage;
import com.bbs.page.Criteria;
import com.bbs.page.ViewPage;
import com.bbs.service.AdminService;
import com.bbs.service.CouponService;
import com.bbs.service.Inquiry_classificationService;
import com.bbs.service.MemberService;

@Controller
@RequestMapping("/adminviews/*")

public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	/* 문의 분류 서비스 */
	@Autowired
	private Inquiry_classificationService ic_service;
	
	
	// 비밀번호 암호화 설정
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	
	//관리자 로그인 페이지 가기
	@GetMapping("/admin_B")
	public String admin_B() {
		
		System.out.println("관리자 로그인 페이지");
		
		return "/adminviews/admin_B";
	}
	
	
	
	//관리자 페이지 가기
	@GetMapping("/adminMain_view")
	public String adminMain_view(Model model, MemberDTO memberDTO,
			AdminCriteria cri) {
		
		System.out.println("관리자 페이지 가기");
		
		List<MemberDTO> memberList = memberService.listAllMain(cri);
		model.addAttribute("memberList",memberList);
		
		int total = memberService.getTotalMain(cri);
		AdminViewPage vp = new AdminViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		return "/adminviews/adminMain_view";
	}
	
	
	
	//관리자 회원가입 페이지가기
	@GetMapping("/adminJoin")
	public String adminJoin() {
		
		System.out.println("관리자 회원가입 페이지 접속");
		
		return "/adminviews/adminJoin_view";
	}
	
	
	
	//관리자 회원가입시 아이디 중복확인
	@PostMapping("/adminidchkAjax")
	@ResponseBody
	public String idchkAjax(
			@RequestParam("manager_id") String manager_id) {
		
		System.out.println("아이디 중복 확인 ajax");
		System.out.println("관리자 아이디 : " + manager_id);
		
		int result = adminService.adminidchkAjax(manager_id);
		
		
		System.out.println("아이디가 존재합니까?");
		if(result == 1) {
			System.out.println("아이디 확인여부 (1확인) : " + result);
			System.out.println("아이디가 중복 입니다");
		}else {
			System.out.println("아이디 사용 가능 합니다");
		}
		
		String adminIdChk = Integer.toString(result);
		
		return adminIdChk;
	}
	
	
	
	//관리자 가입하기
	@PostMapping("/adminInsert")
	public String adminInsert(AdminDTO adminDTO) {
		
		System.out.println("관리자 가입하기 실행");
		
		String rawPw = ""; // 인코딩 전
		String encodePw = ""; // 인코딩 후 
		
		rawPw = adminDTO.getManager_pw(); // 비번 대입
		encodePw = pwEncoder.encode(rawPw); //비번 인코딩
		adminDTO.setManager_pw(encodePw); //인코딩 한 비번 다시 dto저장
		
		
		System.out.println(adminDTO);
		adminService.adminInsert(adminDTO);
		
		System.out.println("관리자 가입하기 완료");
		
		return "redirect:/adminviews/admin_B";
	}
	
	
	
	//관리자 로그인하기
	@PostMapping("/adminloginchkAjax")
	@ResponseBody
	public String adminloginchkAjax(
			HttpServletRequest request, AdminDTO adminDTO) {
		
		System.out.println("관리자 로그인하기 실행");
		
		String manager_id = adminDTO.getManager_id();
		String manager_pw = adminDTO.getManager_pw();
		
        System.out.println("관리자 아이디 : " + manager_id);
        
        System.out.println("관리자 아이디가 있나요?");
        int adminIdChk = adminService.adminidchkAjax(manager_id);
        System.out.println("아이디 확인(1) : " + adminIdChk);
        
        int result = 0;
        
        if(adminIdChk == 1) {
        	result = 1;
        	System.out.println("아이디 있어요!");
        	
        	AdminDTO adminloginDTO = adminService.adminPwChk(manager_id);
    		String oldpw = adminloginDTO.getManager_pw();
    		
    		boolean pwChk = pwEncoder.matches(manager_pw, oldpw);
        	
        	if(pwChk == true) {
        		result = 2;
        		System.out.println("비밀번호 일치 확인");
        		
        		HttpSession session = request.getSession();
        		session.setAttribute("adminNO", adminloginDTO.getManager_no());
				session.setAttribute("adminID", adminloginDTO.getManager_id());
        		
				
        	}else {
        		result = 3;
        		System.out.println("비밀번호 오류");
        	}
        	
        }else {
        	result = 4;
        	System.out.println("아이디가 확인이 안됩니다");
        }
        
		System.out.println("관리자 로그인하기 완료");
		
		String loginRes = Integer.toString(result);
		
		return loginRes;
	}
	
	
	
	//관리자로 로그인 후 선택페이지 이동
	@GetMapping("/loginAfter_view")
	public String loginAfter() {
		
		System.out.println("관리자 선택 페이지 이동");
		
		return "/adminviews/loginAfter_view";
	}
	
	
	
	
	//관리자 회원리스트 페이지 이동
	@GetMapping("/adminMemberList_view")
	public String adminMemberList_view(Model model, MemberDTO memberDTO,
			Criteria cri) {
		
		System.out.println("관리자 회원리스트 페이지 이동");
		
		
		String type = cri.getType();
		String keyWord = cri.getKeyword();
		System.out.println("검색한 type : " + type);
		System.out.println("검색한 내용 : " + keyWord);
		
		
		List<MemberDTO> memberList = memberService.listAll(cri);
		model.addAttribute("memberList",memberList);
		
		int total = memberService.getTotal(cri);
		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		return "/adminviews/adminMemberList_view";
	}
	
	
		
	//	관리자 회원리스트에서 관리 버튼 부분
	
	
	// 관리자 회원 한명의 정보 보기
	@GetMapping("/control/memberInfo_view")
	public List<MemberDTO> memberInfo_view(Model model,
			@RequestParam("m_id") String m_id) {
		
		System.out.println("회원 정보 페이지 이동");
		
		System.out.println("아이디 : " + m_id);
		
		List<MemberDTO> listOne = memberService.listOne(m_id);
		model.addAttribute("listOne",listOne);
		
		
		
		return listOne;
	}
	
	
	
	// 관리자 쿠폰지급 페이지 가기
	@GetMapping("/control/couponGift_view")
	public String couponGift_view(@RequestParam("m_no") String m_no, Model model) {
		
		System.out.println("관리자 쿠폰지급 페이지 가기");
		
		System.out.println("회원번호 : " + m_no );
		
		model.addAttribute("m_no",m_no);
		
		
		return "/adminviews/control/couponGift_view";
	}
		
	
	
	// 관리자 쿠폰지급 하기
	@PostMapping("/control/couponInsert")
	@ResponseBody
	public String couponInsert(CouponDTO couponDTO) {
		
		System.out.println("관리자 쿠폰지급 하기 실행");
		
		Long m_no = couponDTO.getM_no();
		String c_name = couponDTO.getC_name();
		int date = couponDTO.getDate();
		String c_content = couponDTO.getC_content();
		int c_discount = couponDTO.getC_discount();
		
		System.out.println("m_no : " + m_no);
		System.out.println("c_name : " + c_name);
		System.out.println("c_expiration_date : " + date);
		System.out.println("c_content : " + c_content);
		System.out.println("c_discount : " + c_discount);
		
		couponService.couponInsert(couponDTO);
		return "/adminviews/control/couponInsert";
	}
		
		
		
	// 관리자 회원 비번 초기화
	@PostMapping("/memberpwReset")
	@ResponseBody
	public String memberpwReset(MemberDTO memberDTO) {
		
		System.out.println("관리자 회원 비번 초기화 실행하기");
		
		String m_id = memberDTO.getM_id();
		String encodePw = pwEncoder.encode("1234");
		
		System.out.println("아이디 확인 : " + m_id);
		
		memberService.pwUpdate(m_id, encodePw);
		
		System.out.println("관리자 회원 비번 초기화 완료");
		return "/adminviews/memberpwReset";
	}
	
	
	
	// 관리자 회원 삭제 (계정은 살아있고 탈퇴여부 설정)
	@PostMapping("/memberdelete")
	@ResponseBody
	public String memberdelete(MemberDTO memberDTO) {
		
		System.out.println("관리자 회원 삭제 실행하기");
		
		String m_id = memberDTO.getM_id();
		System.out.println("아이디 확인 : " + m_id);
		
		memberService.memberdelete(m_id);
		
		System.out.println("관리자 회원 삭제 완료");
		return "/adminviews/memberdelete";
	}
	
	
	
	// 관리자가 회원등업시키기
	@PostMapping("/memberInfoupdate")
	@ResponseBody
	public String memberInfoupdate(
			@RequestParam("m_id") String m_id,
			@RequestParam("msName") String msName) {
		
		
		System.out.println("관리자가 회원등업시키기 실행");
		
		System.out.println("아이디 : " + m_id);
		System.out.println("등업할 등급 : " + msName);
		
		memberService.memberTierupdate(m_id, msName);
		
		System.out.println("관리자가 회원등업시키기 완료");
		
		return "/adminviews/memberInfoupdate";
	}
	
	
	
	// 관리자가 회원완전삭제 하기 (회원삭제된다)
	@PostMapping("/memberInfodelete")
	@ResponseBody
	public String memberInfoupdate(
			@RequestParam("m_id") String m_id) {
		
		
		System.out.println("관리자가 회원완전삭제 하기 실행");
		
		System.out.println("아이디 : " + m_id);
		
		memberService.memberInfodelete(m_id);
		
		System.out.println("관리자가 회원완전삭제 하기 완료");
		
		return "/adminviews/memberInfoupdate";
	}
	

	// 관리자 전체 쿠폰지급 페이지 가기 (왼쪽 버튼)
	@GetMapping("/coupon/couponGiftAll_view")
	public String couponGiftAll_view(Model model, MemberDTO memberDTO,
			Criteria cri) {
		
		System.out.println("관리자 선택한 회원 쿠폰지급 페이지 가기");
		
		String type = cri.getType();
		String keyWord = cri.getKeyword();
		System.out.println("검색한 type : " + type);
		System.out.println("검색한 내용 : " + keyWord);
		
		
		List<MemberDTO> memberList = memberService.listAll(cri);
		model.addAttribute("memberList",memberList);
		
		int total = memberService.getTotal(cri);
		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		
		return "/adminviews/coupon/couponGiftAll_view";
	}
		
	
	
	// 관리자 전체 쿠폰지급 하기
	@PostMapping("/coupon/couponAllInsert")
	@ResponseBody
	public String couponAllInsert(
			MemberDTO memberDTO, 
			@RequestParam("m_noList") List<String> m_noList,
			@RequestParam("c_name") String c_name,
			@RequestParam("date") int date,
			@RequestParam("c_content") String c_content,
			@RequestParam("c_discount") int c_discount,
			Model model) {
		
		CouponDTO couponDTO = new CouponDTO();
		
		
		
		System.out.println("관리자 선택한 회원 쿠폰지급 하기 실행");
		
		
		System.out.println("-----------------------------------");
		
		

		
		System.out.println("m_no : " + m_noList);
		
		couponDTO.setM_noList(m_noList);
		
		for(String i : m_noList) {
			long m_no = Long.parseLong(i);
			couponDTO.setM_no(m_no);
			couponDTO.setC_name(c_name);
			couponDTO.setDate(date);
			couponDTO.setC_content(c_content);
			couponDTO.setC_discount(c_discount);
			
			couponService.couponInsert(couponDTO);
			System.out.println(couponDTO);
			
		}
		
		
		return "/adminviews/coupon/couponAllInsert";
	}
	
	
	/* 문의 분류 리스트 조회 */
	@GetMapping("/ic_managed")
	public String ic_managed(Model model) {
			
		List<Inquiry_classificationDTO> dto = ic_service.listAll();
		
		model.addAttribute("dto", dto);
		
		
		return "/adminviews/Inquiry_classification/Inquiry_classification_view";
	}
	
	
	
	/* 문의 분류 입력 */
	@GetMapping("/Inquiry_insert")
	public String ic_insert(Inquiry_classificationDTO dto) {
		
		ic_service.ic_insert(dto);
		
		return "redirect:/adminviews/ic_managed";
	}
	
	
	/* 문의 분류 수정 */
	@GetMapping("/Inquiry_update")
	public String ic_update(Inquiry_classificationDTO dto) {
		
		ic_service.ic_update(dto);
		
		return "redirect:/adminviews/ic_managed";
	}
	
	/* 문의 분류 삭제 */
	@GetMapping("/Inquiry_delete")
	public String ic_delete(@RequestParam int ic_no) {

		ic_service.ic_delete(ic_no);
		
		return "redirect:/adminviews/ic_managed";
	}
	
	/* 옵션 관리 */
	@GetMapping("/adminOptionManage_view")
	public String aom() {
		
		return "/adminviews/adminOptionManage_view";
	}
	
	
	/* 제품 관리 */
	@GetMapping("/adminProductManage_view")
	public String apm() {
		
		return "/adminviews/adminProductManage_view";
	}

	
}
