package com.bbs.service;

import java.util.List;

import com.bbs.model.AddressDTO;
import com.bbs.page.MypageCriteria;

public interface AddressService {
//	팝업창 페이징
	public List<AddressDTO> addrPopupList(MypageCriteria cri);

//	팝업창 게시판 게시글 총 개수
	public int getTotal();

//	팝업창 주소 삭제
	public void deletePopUpAddress(String m_no);
	
//	팝업창 주소 수정
	public void addressUpdate(AddressDTO dto);
	
	

}
