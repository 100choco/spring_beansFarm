package com.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
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

import com.bbs.model.CouponDTO;
import com.bbs.model.MemberDTO;
import com.bbs.model.P_orderDTO;
import com.bbs.model.ProductDTO;
import com.bbs.model.ReviewDTO;
import com.bbs.page.MypageCriteria;
import com.bbs.page.MypageViewPage;
import com.bbs.service.CouponService;
import com.bbs.service.MemberService;
import com.bbs.service.OrderHistoryService;
import com.bbs.service.ReviewService;
import com.bbs.utils.UploadFileUtils;


@Controller
@RequestMapping("/mypageviews/*")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderHistoryService orderHistoryService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	

	// 마이페이지 들어가기
	@GetMapping("/mypage/mypage_view")
	public String mypage(Model model, HttpServletRequest request) {
		
		System.out.println("마이페이지 들어가기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);
		
		
		System.out.println("쿠폰");
		List<CouponDTO> couponlistOne = couponService.couponlistOne(m_no);
		System.out.println(couponlistOne);
		
		model.addAttribute("couponlistOne",couponlistOne);
		
		System.out.println("리뷰");
		
		List<ReviewDTO> myreviewList = reviewService.my_review_list(m_no);
		System.out.println(myreviewList);
		
		model.addAttribute("myreviewList", myreviewList);
		
		System.out.println("주문내역 조회");
		
		List<ProductDTO> myOrderHistory = orderHistoryService.myOrderHistory(m_no);
		
		
		model.addAttribute("myOrderHistory", myOrderHistory);
		
		model.addAttribute("m_no", m_no);
		
		System.out.println(myOrderHistory);
		
		return "/mypageviews/mypage/mypage_view";
	}
	
	
	
	// 전체 주문내역 들어가기
	@GetMapping("/myShoppingList/myShopping_view")
	public String myShoppingList_view() {
		
		System.out.println("전체 주문내역 들어가기");
		
		return "/mypageviews/myShoppingList/myShopping_view";
	}
	
	
	

	// 전체 쿠폰 들어가기
	@GetMapping("/myCucuList/myCucu_view")
	public String myCucuList_view(
			HttpServletRequest request, MemberDTO memberDTO,
			Model model) {
		
		System.out.println("전체 쿠폰 들어가기");
				
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);
		
		List<CouponDTO> couponlistOne = couponService.couponlistOne(m_no);
		System.out.println(couponlistOne);
		
		model.addAttribute("couponlistOne",couponlistOne);
		
		return "/mypageviews/myCucuList/myCucu_view";
		
	}
	
	
	
	// 전체 후기
	@GetMapping("/myReviewList/myReview_view")
	public String myReview_view(Model model, MypageCriteria cri, HttpServletRequest request) {
		
		System.out.println("전체 후기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);

	    
	    cri.setM_no(m_no);
		List<ReviewDTO> myreviewListAll = reviewService.my_review_list_all(cri);
		
		
		model.addAttribute("myreviewListAll", myreviewListAll);
		
		
		int total = reviewService.getTotal(m_no);
		
		
		MypageViewPage vp = new MypageViewPage(cri, total); 
		model.addAttribute("pageMaker", vp);
		
		return "/mypageviews/myReviewList/myReview_view";
		
	}

	
	
	// 리뷰쓰는곳 들어가기(21-11-22 17:00수정)
	@PostMapping("/myReviewList/reviewWriteForm_view")
	public String reviewWriteForm(Model model,  P_orderDTO oderDTO,
			@RequestParam("order_no") Long order_no) {
		
		System.out.println("리뷰페이지 바로가기!");
		System.out.println("order_no ddfdfdfdfd : " +  order_no);
		System.out.println(oderDTO.getOrder_no());
		model.addAttribute("order_no",oderDTO.getOrder_no());
		
		return "/mypageviews/myReviewList/reviewWriteForm_view";
	}


	// 리뷰등록하기
	@PostMapping("/myReviewList/reviewInsert")
	public String reviewInsert(@RequestParam(value ="m_no" , required = false) String m_no, ReviewDTO r_dto, MultipartFile file) throws IOException, Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		
		String fileName = null;
		
		if(!file.isEmpty()) {
	
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}
	
	
		if(!file.isEmpty()) {
			r_dto.setR_photo(fileName);
			r_dto.setR_thumbnail("s_" + fileName);
		}else {
			
			r_dto.setR_photo("none.png");
			r_dto.setR_thumbnail("none.png");
			
		}
		
		
		Long.valueOf(r_dto.getM_no()).longValue();
		
		reviewService.insert(r_dto);
		
		return "redirect:/mypageviews/mypage/mypage_view";
	}





	// 후기 업데이트.(21-11-22 17:00수정)
	@GetMapping("/myReviewList/reviewUpdateForm_view")
	public String reviewUpdateForm(@RequestParam(value = "r_no", required = false) String r_no, HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
		
		Long m_no = (Long)session.getAttribute("userNo");
			
		
		ReviewDTO dto = reviewService.my_review_update_form(Long.parseLong(r_no));
	
		model.addAttribute("dto", dto);
		
		return "/mypageviews/myReviewList/reviewUpdateForm_view";
	}



	@PostMapping("/myReviewList/reviewUpdate")
	public String reviewUpdate(ReviewDTO dto, @RequestParam("r_photoupdate")MultipartFile file) throws IOException, Exception {
		
		ReviewDTO preDto = reviewService.my_review_update_form(dto.getR_no());
		
		
		String prephoto= preDto.getR_photo();
		String prethumbnail= preDto.getR_thumbnail();
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		
		String fileName = null;
		if(file.isEmpty()) {
			
			dto.setR_photo(prephoto);
			dto.setR_thumbnail(prethumbnail);
			
		}else if(!file.isEmpty()) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
			dto.setR_photo(fileName);
			dto.setR_thumbnail("s_" + fileName);
			
			fileDelete(prephoto,prethumbnail);
		} 

		reviewService.reviewUpdate(dto);
		
		return "redirect:/mypageviews/mypage/mypage_view";
	}
	
	

	// 마이페이지 안에있는 후기에서 삭제하기.
	@GetMapping("/reviewDelete")
	public String reviewDeleteForm(@RequestParam(value = "r_no", required = false) String r_no,
			Model model) {
		
		System.out.println("딜리트하기!!!");
		
		
		ReviewDTO reviewDTO = reviewService.my_review_one_show(Long.parseLong(r_no));
		
		String r_photo = reviewDTO.getR_photo();
		String r_thumbnail = reviewDTO.getR_thumbnail();
		
//		파일 자체 삭제
		fileDelete(r_photo, r_thumbnail);
	
		// sql문에서 삭제
		reviewService.reviewDelete(Long.parseLong(r_no));
		
		return "redirect:/mypageviews/mypage/mypage_view";
		
	}
	

	
	
	// 파일삭제
	public void fileDelete(String photo,  String thum) {
	
	
		String filePath = "C:\\beansFarm\\review\\";
		
		
		
		File deleteFileName = new File(filePath + photo);
		File deleteThumFileName = new File(filePath + thum);
		
		// 파일이 둘중에 하나라도 존제하면 삭제해라. 그리고 none.png파일은 삭제하지말아라
		if(deleteFileName.exists() || deleteThumFileName.exists()) {
			if(!photo.equals("none.png")) {
				deleteFileName.delete();
				deleteThumFileName.delete();
				System.out.println("파일삭제완료");
			}else {
				System.out.println("파일삭제실패");
			}
			
		}else {
			
			System.out.println("파일삭제실패");
		}
	
	
	
	}
	

	
	
	// 마이페이지 -> 회원수정 페이지 들어가기
	@GetMapping("/myPageInfo/myPageInfo_view")
	public List<MemberDTO> myPageInfo_view(
			HttpServletRequest request, MemberDTO memberDTO,
			Model model ) {
		
		System.out.println("회원정보수정 들어가기");
		
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("userID");
		
		System.out.println("세션에 저장되어있는 회원 아이디 : " + m_id);
		
		
		List<MemberDTO> listOne = memberService.listOne(m_id);
		model.addAttribute("listOne",listOne);
		
		return listOne;
	}
	
	
	
	
	// 마이페이지 -> 회원수정 페이지 -> 회원정보수정 버튼
	@GetMapping("/myPageInfo/myPageInfoPW_view")
	public List<MemberDTO> myPageInfoPW_view(
			HttpServletRequest request, MemberDTO memberDTO,
			Model model ) {
		
		System.out.println("회원정보수정 버튼 들어가기");
		
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("userID");
		
		System.out.println("세션에 저장되어있는 회원 아이디 : " + m_id);
		
		
		List<MemberDTO> listOne = memberService.listOne(m_id);
		model.addAttribute("listOne",listOne);
		
		return listOne;
	}
	
	
	
	// 마이페이지 회원정보수정 페이지이동
	@GetMapping("/myPageInfo/myPageInfoUpdate_view")
	public List<MemberDTO> myPageInfoUpdate_view(
			HttpServletRequest request, MemberDTO memberDTO,
			Model model ) {
		
		System.out.println("회원정보수정 페이지 들어가기");
		
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("userID");
		
		System.out.println("세션에 저장되어있는 회원 아이디 : " + m_id);
		
		
		List<MemberDTO> listOne = memberService.listOne(m_id);
		model.addAttribute("listOne",listOne);
		
		return listOne;
	}
	
	
	// 마이페이지 회원정보수정 ajax 완료
	@PostMapping("/myPageInfo/myPageInfoUpdateAjax")
	@ResponseBody
	public String myPageInfoUpdateAjax(
			MemberDTO memberDTO, Model model ) {
		
		System.out.println("회원정보수정Ajax 들어가기");
		
		
		String m_id = memberDTO.getM_id();
		String m_name = memberDTO.getM_name();
		
		System.out.println("아이디 확인 : " + m_id);
		System.out.println("이름 확인 : " + m_name);
		
		
		memberService.memberUpdate(memberDTO);
		System.out.println(memberDTO);
		
		return "aaa";
	}
	
	
	// 마이페이지 해당상품 리뷰 작성 유무 확인
		@PostMapping("/mypageviews/myPagereviewCountAjax")
		@ResponseBody
		public int myPagereviewCountAjax(HttpServletRequest request ,@RequestParam("order_no") Long order_no) {
			
			Long m_no=0L;
			
			HttpSession session = request.getSession();
			m_no = (Long) session.getAttribute("userNO");
			
			
			
			
			System.out.println("m_no와 order_num :" + m_no +"dddddddddddddd"+ order_no);
			
			ReviewDTO reDTO = new ReviewDTO();
			reDTO.setM_no(m_no);
			reDTO.setOrder_no(order_no);
			
			
			int reviewCheck = reviewService.cannotWriteFnc(reDTO);
			System.out.println(reviewCheck);
			if(reviewCheck == 0) {
				System.out.println("리뷰쓰기가능");
			}else {

				System.out.println("리뷰쓰기 불가능");
			}
			
			
			return reviewCheck;
		}
	
	
}
