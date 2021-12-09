	package com.bbs.service;

import java.util.List;

import com.bbs.model.QnaDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

public interface QnaService {

	public List<QnaDTO> viewAll();
	
	public List<QnaDTO> listPaging(Criteria cri);
	
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
