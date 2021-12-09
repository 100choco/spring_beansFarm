package com.bbs.mapper;

import java.util.List;

import com.bbs.model.QnaDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

public interface QnaMapper {
//	Q&A 전체 목록
	public List<QnaDTO> viewAll();
	
//	Q&A 페이징
	public List<QnaDTO> listPaging(Criteria cri);
//	public List<QnaDTO> listPaging(QnaCriteria cri, int userNo);
	public int getTotal();
	
	public void insert(QnaDTO dto);

	public QnaDTO viewOne(Long qno);

	public void delete(Long qno);

	public void update(QnaDTO dto);

	public void answer(QnaDTO dto);

	public void answerajax(QnaDTO dto);

	public void answerDeleteAjax(QnaDTO dto);

	public List<QnaDTO> view_user(MypageCriteria cri);

}
