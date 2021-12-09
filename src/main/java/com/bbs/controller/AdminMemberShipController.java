package com.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.MemberShipDTO;
import com.bbs.service.MembershipService;



@Controller
@RequestMapping("/adminviews/memberShip/*")
public class AdminMemberShipController {

	@Autowired
	private MembershipService membershipService;
	
	
	//멤버쉽관리 페이지 이동
	@GetMapping("/memberShip_view")
	public String memberShip_view(MemberShipDTO msDTO, Model model) {
		
		System.out.println("멤버쉽관리 페이지 이동");
		
		List<MemberShipDTO> msList = membershipService.msList();
		model.addAttribute("msList", msList);
		
		return "/adminviews/memberShip/memberShip_view";
	}
	
	
	
	//멤버쉽 추가등록 
	@PostMapping("/insert")
	@ResponseBody
	public void insert(MemberShipDTO msDTO) {
		System.out.println("멤머쉽 추가");
		
		System.out.println("번호 : " + msDTO.getMembership_no());
		System.out.println("이름 : " + msDTO.getMembership_name());
		System.out.println("할인율 : " + msDTO.getPoint_ratio());
		
		membershipService.msInsert(msDTO);
		
		System.out.println("멤버쉽 추가 완료");
		
	}
	
	
	//멤버쉽 수정
	@PostMapping("/update")
	@ResponseBody
	public String update(MemberShipDTO msDTO) {
		System.out.println("멤머쉽 수정");
		
		System.out.println("번호 : " + msDTO.getMembership_no());
		System.out.println("이름 : " + msDTO.getMembership_name());
		System.out.println("할인율 : " + msDTO.getPoint_ratio());
		
		membershipService.msUpdate(msDTO);
		
		System.out.println("멤버쉽 수정 완료");
		
		return "/adminviews/memberShip/update";
		
	}
	
	
	
	
	//멤버쉽 삭제
	@PostMapping("/delete")
	@ResponseBody
	public String delete(MemberShipDTO msDTO) {
		System.out.println("멤머쉽 삭제");
		
		System.out.println("번호 : " + msDTO.getMembership_no());
		
		membershipService.msDelete(msDTO);
		
		System.out.println("멤버쉽 삭제 완료");
		
		return "/adminviews/memberShip/update";
		
	}
	
	
	
}
