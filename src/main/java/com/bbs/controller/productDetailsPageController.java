package com.bbs.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bbs.model.OptionClassificationDTO;
import com.bbs.model.POptionDTO;
import com.bbs.model.ProductDTO;
import com.bbs.model.ProductDetailsPageDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ProductDetailsCriteria;
import com.bbs.page.ProductDetailsViewPage;
import com.bbs.service.OptionClassificationService;
import com.bbs.service.POptionService;
import com.bbs.service.ProductDetailsPageService;
import com.bbs.service.ProductService;

@RequestMapping("/product/*/*")
@Controller
public class productDetailsPageController {

	@Autowired
	private ProductDetailsPageService pd;
	
	@Autowired
	private ProductService product;
	
	@Autowired
	private POptionService op;
	
	@Autowired
	private OptionClassificationService oc;
	
//	제품상세페이지 등록 요청	
	@GetMapping("/pd_insert_form")
	public String pdInsertForm(Model model, @RequestParam("p_no")long pno, Criteria cri) {
		
		List<ProductDTO> productList = product.selectByAll(cri);
		long p_no = pno;
		model.addAttribute("p_no", p_no);
		model.addAttribute("productList", productList);
		
		return "/product/product/pdInsertForm";
	}
	
//	제품상세페이지 등록 요청
	@PostMapping("/pd_insert")
	public String pdInsert(@RequestParam("uuid")String uuid, ProductDetailsPageDTO dto) {
		String fileName = dto.getPd_image();
		
		dto.setPd_image(uuid + "_" + fileName);
		
		pd.insert(dto);
		
		return "redirect:/adminviews/adminProductManage_view";
	}
	
	
	
	// ======================================= 파일업로드 ====================================================
//	서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody 를 사용하여 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송시키는 역할 
//	보통 json을 사용
		@ResponseBody
		@PostMapping("/product_details_upload")
		private void upload(MultipartFile[] uploadFile, String uuid) {
			
			String uploadFolder = "C:\\beansFarm\\product\\productDetails";
			
			System.out.println(uploadFile);
			System.out.println(uuid);
			
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
	// ======================리스트는 ProductCRUDController 에 합쳐있음==========================================
	// ================================================삭제===========================================================
		
		//제품상세페이지의 삭제 요청	
		@PostMapping("/product_details_delete")
		public String pdDelete(ProductDetailsPageDTO dto) {
			pd.delete(dto.getP_no());
			pdDeleteFile(dto.getPd_image());

			
			return "redirect:/adminviews/adminProductManage_view";
		}
		
		private void pdDeleteFile(String fileName) {
			
			String filePath = "C:\\beansFarm\\product\\productDetails";
			
			File file = new File(filePath+ File.separator +fileName);
			
			file.delete();
			
		}
		
	//=================================================업데이트==============================================
		
		//제품상세 수정 form요청
		@PostMapping("/product_details_update_form")
		public String pdUpdateForm(@RequestParam("p_no")long p_no, Model model) {
			ProductDetailsPageDTO pdDTO = pd.selectByPNo(p_no);
			ProductDTO pDTO = product.selectByPNo(p_no);
			model.addAttribute("pdDTO", pdDTO);
			model.addAttribute("productDTO", pDTO);
			
			
			return "/product/product/pdUpdateForm";			
		}
		
		//Post값으로 제품상세 수정 요청
		@PostMapping("/product_details_update")
		public String pdUpdate(@RequestParam("uuid")String uuid, ProductDetailsPageDTO dto) {
			
			ProductDetailsPageDTO prevDto = pd.selectByPNo(dto.getP_no());
			String prevImageName = prevDto.getPd_image();
			
			
			if(dto.getPd_image().isEmpty()) {
				dto.setPd_image(prevImageName);
			}else {
				dto.setPd_image(uuid + "_" + dto.getPd_image());
				pdDeleteFile(prevImageName);
			}
			
			pd.update(dto);
			
			return "redirect:/adminviews/adminProductManage_view";
		}
		
		//================================================상품상세페이지 들어가기==============================================
		
		@GetMapping("/pdDetailsCon_view")
		public String pdDetailsCon_view(@RequestParam("p_no") Long p_no, Model model, ProductDetailsCriteria cri) {
			
			System.out.println("상품상세페이지 들어가기");
			
			cri.setP_no(p_no);
			
			  // 해당상품 전체 리뷰 보기.
			  List<ProductDTO> list = pd.product_all_review_list(cri);
			  List<POptionDTO> opList = op.selectByPNo(p_no);
			  List<OptionClassificationDTO> ocList = oc.selectByAll();
			  ProductDetailsPageDTO pdDTO = pd.selectByPNo(p_no);
			  
			  model.addAttribute("list",list);
			  System.out.println(list);
			  ProductDTO productDTO = product.selectByPNo(p_no);
			  model.addAttribute("productDTO",productDTO);
			  System.out.println("해당상품 전체 리뷰 보기");
			  
			  model.addAttribute("opList",opList);
			  model.addAttribute("ocList",ocList);
			  model.addAttribute("pdDTO",pdDTO);
			  
			  // 리뷰 수 카운트.
			  int reviewCount = pd.reviewCount(p_no); 
			  model.addAttribute("reviewCount",reviewCount);
			  
			  
			  System.out.println(reviewCount);
			  
			  // 리뷰 페이징.
			  int total = pd.getTotal(p_no);
			  
			  ProductDetailsViewPage vp = new ProductDetailsViewPage(cri, total); 
			  model.addAttribute("pageMaker", vp);
			  
			  
			return "/product/product_details/pdDetailsCon_view";
		}
		
		// 상품상세정보내에 후기 페이징 할 시 ajax로 페이지 이동없이 변경.
		@PostMapping("pagingAjax")
		@ResponseBody
		public int pagingAjax(Model model, @RequestParam("pageNum")int num, @RequestParam("pNo")Long pNo, ProductDetailsCriteria cri) {
			System.out.println("aaaa"+num);
			System.out.println("aaaa"+pNo);
			cri.setPageNum(num);
			cri.setP_no(pNo);
			List<ProductDTO> list = pd.product_all_review_list(cri);
			System.out.println(list+"테스트");
			model.addAttribute("list", list);
			
			
			return num;			
		}
		
		
		// op1 불러오기(500g)
		@ResponseBody
		@PostMapping("/opAjax1")
		public POptionDTO pdAjax1(@RequestParam("op1")int op1) {
			
			POptionDTO opDTO = op.selectByOpNo(op1);
						
			return opDTO;
		}
		
		
		// op2 불러오기(원두상태)
		@ResponseBody
		@PostMapping("/opAjax2")
		public POptionDTO pdAjax2(@RequestParam("op2")int op2) {
			
			POptionDTO opDTO = op.selectByOpNo(op2);
						
			return opDTO;
		}
		
}
