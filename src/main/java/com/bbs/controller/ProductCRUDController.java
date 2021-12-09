package com.bbs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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

import com.bbs.model.CategoryDTO;
import com.bbs.model.OriginDTO;
import com.bbs.model.ProductDTO;
import com.bbs.model.ProductDetailsPageDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ViewPage;
import com.bbs.service.CategoryService;
import com.bbs.service.OriginService;
import com.bbs.service.POptionService;
import com.bbs.service.ProductDetailsPageService;
import com.bbs.service.ProductService;

import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/product/product/*")
public class ProductCRUDController {
	
	@Autowired
	private CategoryService category;
	
	@Autowired
	private OriginService origin;
	
	@Autowired
	private ProductService product;
	
	@Autowired 
	private POptionService op;
	
	@Autowired
	private ProductDetailsPageService pd;
	
//	제품등록 페이지 (form) 요청
	@GetMapping("/product_insert_form")
	public String product_insert_form(Model model) {
		
		List<OriginDTO> originList = origin.selectByAll();
		
		List<CategoryDTO> categoryList = category.selectByAll();
		
		
		model.addAttribute("originList", originList);
		model.addAttribute("categoryList", categoryList);
		
		
		return "/product/product/productInsertForm";
	}
	
	//	제품등록 페이지로 이동 요청
	@PostMapping("/product_insert")
	public String product_insert(@RequestParam("uuid")String uuid, ProductDTO dto) {
	
			System.out.println(uuid);
			String fileName = uuid+"_"+dto.getP_image();
			
			dto.setP_image(fileName);
			dto.setP_thumbnail("t_"+fileName);
					
			System.out.println(dto);
			
			product.insert(dto);		
			
		
		return "redirect:/adminviews/adminProductManage_view";
		
	}
// ======================================= 파일업로드 ====================================================
	
//	서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody 를 사용하여 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송시키는 역할 
//	보통 json을 사용
	@ResponseBody
	@PostMapping("/product_upload")
	private void upload(MultipartFile[] uploadFile, String uuid) {
		
		String uploadFolder = "C:\\beansFarm\\product";
		
		for(MultipartFile mf:uploadFile) {
			
			String fileName = uuid + "_" + mf.getOriginalFilename();

			File savefile = new File(uploadFolder, fileName);
			try {
				mf.transferTo(savefile);
				if(checkImageType(savefile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "t_" + fileName));
					Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail, 300, 300);
					thumbnail.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private boolean checkImageType(File file) {
		try {
			String contenType = Files.probeContentType(file.toPath());
			return contenType.startsWith("image");
		}catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	//================================= 리스트 ===============================================================
	
//	등록된 제품들 리스트 호출
	@GetMapping("/product_list")
	public String productList(Model model, Criteria cri) {
		
//		검색관련
		String type = cri.getType();
		String keyWord = cri.getKeyword();
		System.out.println("검색한 type : " + type);
		System.out.println("검색한 내용 : " + keyWord);
		
		List<ProductDTO> productList = product.selectByAll(cri);		//제품리스트를 불러오고, 검색용도 사용
		List<CategoryDTO> categoryList = category.selectByAll();		//카테고리 번호와 이름을 불러오기 위해 사용
		List<OriginDTO> originList = origin.selectByAll();				//원산지 번호와 이름을 불러오기 위해 사용
		List<ProductDetailsPageDTO> pdList = pd.selectByAll();			//제품의 상세리스트를 불러오기 위해 사용	
		
//	 	검색에 필요한 2개
		int total = product.prodGetTotal(cri);
		ViewPage vp = new ViewPage(cri, total);
		
	//		model에 (name == "productList", value == productList)객체를 담음  --> 뷰단에서는 name으로 지정한 이름을 통해서 value 사용
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", vp);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("originList", originList);
		model.addAttribute("pdList", pdList);
		
		return "/product/product/productList";
	}
	
	//================================== 삭제 =================================================================
	
//	등록된 제품리스트 삭제 요청
	@PostMapping("/product_delete")
	public String productDelete(ProductDTO dto, @RequestParam("pd_image")String pd_image) {
		
		System.out.println(dto);
		op.pNoDelete(dto.getP_no());
		pd.delete(dto.getP_no());
		product.delete(dto.getP_no());
		pdDeleteFile(pd_image);
		deleteFile(dto.getP_image());
		deleteFile(dto.getP_thumbnail());
		
		
		return "redirect:/adminviews/adminProductManage_view";
	}
	
	
//	저장된 이미지 파일 삭제
	private void deleteFile(String fileName) {
		
		String filePath = "C:\\beansFarm\\product";
		
		File file = new File(filePath+ File.separator +fileName);
		
		file.delete();
		
	}
	
//	저장된 상세이미지 파일 삭제
	private void pdDeleteFile(String fileName) {
		
		String filePath = "C:\\beansFarm\\product\\productDetails";
		
		File file = new File(filePath+ File.separator +fileName);
		
		file.delete();
		
	}
	
	//=================================업데이트==============================================================
	
//	Post값으로 등록된 제품 수정 (form) 요청
	@PostMapping("/product_update_form")
	public String productUpdateForm(@RequestParam("p_no")long pNo, Model model) {
		ProductDTO productDto = product.selectByPNo(pNo);
		List<CategoryDTO> categoryList = category.selectByAll();
		List<OriginDTO> originList = origin.selectByAll();
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("originList", originList);
		
		return "/product/product/productUpdateForm";
	}
	
//	등록된 제품수정 요청
	@PostMapping("/product_update")
	public String productUpdate(@RequestParam("uuid")String uuid, ProductDTO dto) {
		
		ProductDTO prevDto = product.selectByPNo(dto.getP_no());
		String prevImg = prevDto.getP_image();
		String prevThumb = prevDto.getP_thumbnail();
		System.out.println(prevImg);
		System.out.println(prevThumb);
		
		
		if(dto.getP_image().isEmpty()) {
			dto.setP_image(prevImg);
			dto.setP_thumbnail(prevThumb);
		}else {
			String fileName = uuid+ "_" +dto.getP_image();
			dto.setP_image(fileName);
			dto.setP_thumbnail("t_" + fileName);
			deleteFile(prevImg);
			deleteFile(prevThumb);
		}
		
		product.update(dto);
		
		System.out.println(dto);
		
		return "redirect:/adminviews/adminProductManage_view";
	}

}
