
package com.bbs.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbs.model.MemberDTO;
import com.bbs.service.CouponService;
import com.bbs.service.MemberService;

@Controller
@RequestMapping("/memberloginviews/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	// 비밀번호 암호화 설정
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	// 이메일 인증번호 전송
	@Autowired
    private JavaMailSender mailSender;
	
	
	
	// 회원 로그인 페이지 들어가기
	@GetMapping("/memberLogin_view")
	public String memberLogin_view() {
		
		System.out.println("회원 로그인 페이지 들어가기");
		
		return "/memberloginviews/memberLogin_view";
	}
	
	
	
	// 회원가입 페이지 들어가기
	@GetMapping("/memberJoin_view")
	public String memberJoin_view() {
		
		System.out.println("회원가입 페이지 들어가기");
		
		return "/memberloginviews/memberJoin_view";
	}
	
	
	
	// 회원가입 완료
	@PostMapping("/memberInsert")
	public String memberInsert(MemberDTO memberDTO,
			@RequestParam("m_phone1") String m_phone1, @RequestParam("m_phone2") String m_phone2, @RequestParam("m_phone3") String m_phone3,
			@RequestParam("m_email1") String m_email1, @RequestParam("m_email2") String m_email2
			) throws IOException {

		
		String rawPw = ""; // 인코딩 전
		String encodePw = ""; // 인코딩 후 
		
		
		memberDTO.setM_phone(m_phone1 + "-" + m_phone2 + "-" + m_phone3);
		memberDTO.setM_email(m_email1 + "@" + m_email2);
		
		
		rawPw = memberDTO.getM_pw(); // 비번 대입
		encodePw = pwEncoder.encode(rawPw); //비번 인코딩
		memberDTO.setM_pw(encodePw); //인코딩 한 비번 다시 dto저장
		
		
		memberService.memberInsert(memberDTO); // 회원등록
		
		
		String m_id = memberDTO.getM_id();
		System.out.println("아이디 확인 : " + m_id);
		
		
		MemberDTO dto = memberService.memberLogin(m_id);
		
		Long m_no = dto.getM_no();
		
		System.out.println("회원번호 확인 : " + m_no);
		System.out.println("아이디 확인 : " + m_id);
		couponService.couponFirstInsert(m_no);
		
		System.out.println("회원가입 완료");
		
		return "redirect:/";
		
	}
		
	
	
	// 회원가입시 아이디 중복검사
	@PostMapping("/idchkAjax")
	@ResponseBody
	public int idchkAjax(@RequestParam("m_id") String m_id) {
		
		int result = memberService.idchkAjax(m_id);
		System.out.println(m_id);
		System.out.println(result);
		if(result == 1) {
			System.out.println("아이디가 중복 입니다");
		}else {
			System.out.println("아이디 사용 가능 합니다");
		}
		
		System.out.println("idchkAjax 완료");
		return result;
	}
	
	
	
	// 회원가입시 이메일 중복검사
	@PostMapping("/emailchkAjax")
	@ResponseBody
	public int emailchkAjax(@RequestParam("m_email") String m_email) {
		System.out.println("emailchkAjax 실행");
		
		System.out.println("이메일 : " + m_email);
		
		int result = memberService.emailchkAjax(m_email);
		
		if(result == 1) {
			System.out.println("이메일이 중복 입니다");
		}else {
			System.out.println("이메일 사용 가능 합니다");
		}
		
		
		return result;
	}
	
	
	
	// 이메일 전송 확인
	@PostMapping("/emailSendAjax")
	@ResponseBody
	public String emailSendAjax(@RequestParam("m_email") String m_email) {
		
		
	// 이메일 확인
	System.out.println("인증번호 전송 확인");
	System.out.println("이메일 : " + m_email);
	
	
	// 인증번호 생성
	Random random = new Random();
	int checkNum = random.nextInt(99999) + 11111;
	System.out.println("인증번호 : " + checkNum);
	
	
	// 이메일 보내기
	// setForm : root-context.xml에 삽입한 자신의 이메일 계정의 이메일 주소
	String setFrom = "se01163@naver.com";
    String toMail = m_email;
    String title = "회원가입 인증 이메일 입니다.";
    String content = 
            "<h1> Beans Farm (원두 팜) </h1>" +
            "<br><br>" + 
            "<h2> 인증 번호는 " + checkNum + "입니다." + 
            "<br>" + 
            "해당 인증번호를 인증번호 확인란에 기입하여 주세요. </h2>";
		
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String emailNumChk = Integer.toString(checkNum);
        
		return emailNumChk;
	}
	
	
	
	// 로그인 하기
	@PostMapping("/loginchkAjax")
	@ResponseBody
	public String loginchkAjax(
			@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw,
			HttpServletRequest request, MemberDTO memberDTO,
			RedirectAttributes rttr) {
		
		
        String rawPw = "";
        String encodePw = "";
        MemberDTO logindto = memberService.memberLogin(m_id);
        
        System.out.println("loginchkAjax 실행");
        
        String result = null;
        int idChk = memberService.idchkAjax(m_id);
        
		
		
		System.out.println("아이디 : " + m_id);
//		System.out.println("비밀번호 : " + m_pw);
		
		
			
		if(idChk == 1) {
			result = "idChk";
			System.out.println("아이디 확인 체크(1확인) : " + idChk);
			System.out.println("아이디가 있음");
			
			rawPw = memberDTO.getM_pw();        // 사용자가 제출한 비밀번호
	        encodePw = logindto.getM_pw();           // 데이터베이스에 저장한 인코딩된 비밀번호
	        
//		        System.out.println("인코딩되어있는 비밀번호 : " + encodePw);
	        boolean pwChk = pwEncoder.matches(rawPw, encodePw);
	        
	        String m_leave = logindto.getM_leave();
	        System.out.println("회원탈퇴여부 : " + m_leave);
	        
	        if(m_leave.equals("y")) {
				result = "leaveChk";
				System.out.println("탈퇴된 회원입니다.");
	        
	        }else if(pwChk == true) {
				result = "loginChk";
				System.out.println("matches 메소드 사용 비교 : " + pwChk);
				System.out.println("아이디와 비번 일치");
				
				HttpSession session = request.getSession();
				session.setAttribute("userNO", logindto.getM_no());
				session.setAttribute("userID", logindto.getM_id());
				session.setAttribute("userName", logindto.getM_name());
				
				System.out.println("로그인 되었습니다");
				
			}else if(pwChk == false){
				result = "pwError";
				System.out.println("비번 오류");
			}
	        
		}else {
			result = "idError";
			System.out.println("아이디 오류");
		}
		
		
		System.out.println(result);
		
		return result;
	}
	
	
	
	// 아이디 찾기 페이지로 가기
	@GetMapping("/memberidFind_view")
	public String memberidFind_view() {
		
		System.out.println("아이디 찾기 페이지 들어가기");
		
		return "/memberloginviews/memberidFind_view";
	}
	
	
	
	// 아이디 찾기
	@PostMapping("/idFindajax")
	@ResponseBody
	public String idFindStart(@RequestParam("m_email") String m_email) {
				
		String result = null;
		
		System.out.println("이메일이 있나요?");
		System.out.println("입력한 이메일 : " + m_email);
		
		String resid = memberService.emailChkajax(m_email);
		
		
		if(!(resid == null)) {
			result = "success";
			System.out.println("네 있어요");
			System.out.println("아이디 확인 : " + resid);
			
			//아이디 이메일 발송
			String setFrom = "se01163@naver.com";
	        String toMail = m_email;
	        String title = "아이디 찾기";
	        String content = 
	                "<h1> Beans Farm (원두 팜) </h1>" +
	                "<br><br>" + 
	                "<h2> 아이디는 " + resid + "입니다. </h2>";
			
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			
		}else {
			result = "error";
			System.out.println("아니요");
		}
		
		return result;
	}
	
	
	
	// 이메일 전송 후 페이지 이동
	@GetMapping("/memberidFindSelect_view")
	public String memberidFindSelect_view() {
		
		System.out.println("아이디를 찾아서 이메일로 전송완료");
		
		return "/memberloginviews/memberidFindSelect_view";
	}
	
	
	
	// 비밀번호 찾기
	@GetMapping("/memberPwFind_view")
	public String memberPwFind_view() {
		
		System.out.println("비밀번호 찾기");
		
		return "/memberloginviews/memberPwFind_view";
	}
	
	
	@PostMapping("/pwFindajax")
	@ResponseBody
	public String pwFindajax(
			@RequestParam("m_id") String m_id,
			@RequestParam("m_email") String m_email) {

		int result = 0;
		
		System.out.println("아이디 : " + m_id);
		System.out.println("이메일 : " + m_email);
		
		int idChk = memberService.idchkAjax(m_id);
		
		
		System.out.println("아이디가 존재합니까?");
		if(idChk == 1) {
			result = 1;
			System.out.println("아이디 확인(1) : " + idChk);
			
			MemberDTO memberDTO = memberService.memberLogin(m_id);
			String joinEmail = memberDTO.getM_email();
			System.out.println("가입시 입력한 이메일 : " + joinEmail);
			
			System.out.println("입력한 이메일이랑 가입시 이메일과 동일하나요?");
			
			if(m_email.equals(joinEmail)) {
				result = 2;
				System.out.println("네 같아요");
			}else {
				result = 3;
				System.out.println("아니요");
			}
			
		}else {
			result = 4;
			System.out.println("아이디 확인(1) : " + idChk);
			System.out.println("아니요");
		}
		
		System.out.println(result);
		
		String pwFindChk = Integer.toString(result);
		
		return pwFindChk;
	}
	
	
	
	//비밀번호 재설정 페이지로 가기
	@GetMapping("/memberPwReset_view")
	public String memberPwReset_view() {
		
		System.out.println("비밀번호 재설정 페이지로 가기");
		
		return "/memberloginviews/memberPwReset_view";
	}
	
	
	// 비빌번호 재설정
	@PostMapping("/pwUpdateajax")
	@ResponseBody
	public String pwUpdateajax(
			MemberDTO memberDTO, Model model,
			@RequestParam("m_id") String m_id,
			@RequestParam("m_pw") String m_pw) {
		
		int result = 0;
		String rawPw = "";
		String encodePw = "";
		
		rawPw = memberDTO.getM_pw();
		
		System.out.println("비밀번호 재설정하기");
		
		System.out.println("아이디 : " + m_id);
		System.out.println("인코딩 전 비밀번호 : " + rawPw); // 인코딩 전
		
		  
		
		
		System.out.println("아이디가 존재합니까?");
		int idChk = memberService.idchkAjax(m_id);
		if(idChk == 1) {
			result = 1;
			System.out.println("아이디 확인(1) : " + idChk);
			
			encodePw = pwEncoder.encode(rawPw); // 인코딩 후
			System.out.println("인코딩 비번 : " + encodePw);
			
			memberDTO.setM_pw(encodePw);
			System.out.println(memberDTO);
			memberService.pwUpdate(memberDTO.getM_id(), memberDTO.getM_pw());
			
		}else {
			result = 0;
			System.out.println("아이디 확인(1) : " + idChk);
			System.out.println("아니요");
		}
		
		
		
		String pwUpdate = Integer.toString(result);
		
		return pwUpdate;
	}
	
	
	
	// 회원 탈퇴
	@PostMapping("/memberdelete")
	@ResponseBody
	public String memberdelete(MemberDTO memberDTO, HttpServletRequest request) {
		
		System.out.println("관리자 회원 삭제 실행하기");
		
		String m_id = memberDTO.getM_id();
		System.out.println("아이디 확인 : " + m_id);
		
		memberService.memberdelete(m_id);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		System.out.println("관리자 회원 삭제 완료");
		
		System.out.println("아이디 확인 : " + m_id);
		
		return "/memberloginviews/memberdelete";
	}
	
}