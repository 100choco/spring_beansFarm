package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.AddressDTO;
import com.bbs.page.MypageCriteria;
import com.bbs.page.MypageViewPage;
import com.bbs.service.AddressService;


@Controller
@RequestMapping("/mypageviews/*")
public class AddressController {
	         
	@Autowired
	private AddressService addressService;

	

	
	// 마이페이지 주소목록 관리 팝업창(페이징 봉인)
	 @GetMapping("/myPageInfo/myPageInfo_addressManagePop") 


		public String myPageInfo_addressManagePop(MypageCriteria cri, Model model, HttpServletRequest request) throws Exception{
			System.out.println("myPageInfo_addressManagePop들어왔다......");
			HttpSession session = request.getSession();
			Long m_no = (Long)session.getAttribute("userNO");
			
			System.out.println("세션에 저장되어있는 회원 번호 : " + m_no);

		    
		    cri.setM_no(m_no);
		    cri.setAmount(5);
		    
		    model.addAttribute("listOne", addressService.addrPopupList(cri));
			
			
			int total = addressService.getTotal();
			
			
			MypageViewPage vp = new MypageViewPage(cri, total);
			
			model.addAttribute("pageMaker", vp);
			
			return "/mypageviews/myPageInfo/myPageInfo_addressManagePop";
		    
		
		}
	 
	 
	    @PostMapping("/myPageInfo/deletePopUpAddress_List")
	    @ResponseBody
	    public String deletePopUpAddress_ListAjax(HttpServletRequest request) {
	       String[] deletePopUpAddress_ListAjax = request.getParameterValues("valueArr");
	       int size = deletePopUpAddress_ListAjax.length;
	       
	       System.out.println(deletePopUpAddress_ListAjax);
	       String result = null;
	       for(int i = 0; i<size; i++) {
	          addressService.deletePopUpAddress(deletePopUpAddress_ListAjax[i]);
	          result="deleteSuccess";
	       }
	       return result;
	    }
	    
	    @PostMapping("/myPageInfo/address_update")
		 public String myPageInfo_addressUpdatePop(AddressDTO dto, HttpServletRequest request) {
			 HttpSession session = request.getSession();
			 
			 Long m_no = (Long)session.getAttribute("userNO");
			 
			 
			 addressService.addressUpdate(dto);
			 
			 
			 
			 return "redirect:/mypageviews/myPageInfo/myPageInfo_addressManagePop";
		 }
	
}
