package com.bbs.mapper;

import java.util.List;

import com.bbs.model.FaqDTO;
import com.bbs.page.Criteria;

public interface FaqMapper {

	
	/* 게시글 등록 */
	public void faq_enroll(FaqDTO fdto);
	
	/* 게시판 목록 */
	public List<FaqDTO> getList();
	
	/* 게시판 조회 */
	public FaqDTO getPage(Long fno);
	
	/* 게시판 수정 */
	public int faq_modify(FaqDTO fdto);
	
	/* 게시판 삭제 */
	public int faq_delete(int faq_no);
	
	/* 게시판 페이징 */
	public List<FaqDTO> getListPaging(Criteria cri);
	
	 /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
	
    

    
    
}
