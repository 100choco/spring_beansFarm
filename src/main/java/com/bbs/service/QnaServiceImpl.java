package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.QnaMapper;
import com.bbs.model.QnaDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public List<QnaDTO> viewAll() {
		return mapper.viewAll();
	}

	@Override
	public void insert(QnaDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public QnaDTO viewOne(Long qno) {
		
		System.out.println(qno);
		return mapper.viewOne(qno);
	}

	@Override
	public void delete(Long qno) {
		mapper.delete(qno);
	}

	@Override
	public void update(QnaDTO dto) {
		mapper.update(dto);
	}

	@Override
	public void answer(QnaDTO dto) {
		mapper.answer(dto);
	}

	@Override
	public List<QnaDTO> listPaging(Criteria cri) {
		return mapper.listPaging(cri);
	}
	
	@Override
	public int getTotal() {
	
		return mapper.getTotal();
	}

	@Override
	public void answerajax(QnaDTO dto) {
		mapper.answerajax(dto);

	}

	@Override
	public void answerDeleteAjax(QnaDTO dto) {
		mapper.answerDeleteAjax(dto);
	}

	@Override
	public List<QnaDTO> view_user(MypageCriteria cri) {
		return mapper.view_user(cri);
	}



}
