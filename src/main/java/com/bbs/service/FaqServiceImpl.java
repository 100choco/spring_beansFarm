package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.FaqMapper;
import com.bbs.model.FaqDTO;
import com.bbs.page.Criteria;


@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;

	/* 게시글 등록 */
	@Override
	public void faq_enroll(FaqDTO fdto) {
		faqMapper.faq_enroll(fdto);

	}

	/* 게시판 목록 */
	@Override
	public List<FaqDTO> getList() {
		return faqMapper.getList();
	}

	/* 게시판 조회 */
	@Override
	public FaqDTO getPage(Long fno) {
		return faqMapper.getPage(fno);
	}
	
	
	/* 게시판 수정 */
	@Override
	public int faq_modify(FaqDTO fdto) {
		return faqMapper.faq_modify(fdto);
	}
	
	/* 게시판 삭제 */
	@Override
	public int faq_delete(int faq_no) {
		return faqMapper.faq_delete(faq_no);
	}
	
	/* 페이징 */
	@Override
	public List<FaqDTO> getListPaging(Criteria cri) {
		return faqMapper.getListPaging(cri);
	}
	
	 /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return faqMapper.getTotal(cri);
    }   



	


}
