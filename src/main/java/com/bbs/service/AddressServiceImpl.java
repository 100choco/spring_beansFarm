package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.AddressMapper;      
import com.bbs.model.AddressDTO;
import com.bbs.page.MypageCriteria;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressMapper addrmapper;
	
	
// 팝업창 주소 페이징	
	@Override
	public List<AddressDTO> addrPopupList(MypageCriteria cri) {
		return addrmapper.addrPopupList(cri);
	}
	
	
// 팝업창 주소 총개수
	@Override
	public int getTotal() {
		return addrmapper.getTotal();
	}
	
	
// 팝업창 주소 삭제
	@Override
	public void deletePopUpAddress(String m_no) {
		addrmapper.deletePopUpAddress(m_no);
		
	}
	
//	팝업창 주소 수정	
	@Override
	public void addressUpdate(AddressDTO dto) {
		addrmapper.addressUpdate(dto);
	}




}
