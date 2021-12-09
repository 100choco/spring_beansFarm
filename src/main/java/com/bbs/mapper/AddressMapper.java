package com.bbs.mapper;

import java.util.List;

import com.bbs.model.AddressDTO;
import com.bbs.page.MypageCriteria;

public interface AddressMapper {

	// 주소목록 팝업게시판 페이징	
	public List<AddressDTO> addrPopupList(MypageCriteria cri);

	public int getTotal();
	
	// 주소목록 팝업창 주소삭제	
	public void deletePopUpAddress(String m_no);
	
	//	주소목록 팝업창 주소수정	
	public void addressUpdate(AddressDTO dto);


}
