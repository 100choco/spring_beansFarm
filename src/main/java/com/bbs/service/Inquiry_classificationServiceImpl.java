package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.Inquiry_classificationMapper;
import com.bbs.model.Inquiry_classificationDTO;

@Service
public class Inquiry_classificationServiceImpl implements Inquiry_classificationService{
	
	@Autowired
	public Inquiry_classificationMapper mapper;
	
	@Override
	public List<Inquiry_classificationDTO> listAll() {
		
		return mapper.listAll();
	}

	@Override
	public void ic_insert(Inquiry_classificationDTO dto) {
			mapper.ic_insert(dto);
	}

	@Override
	public void ic_update(Inquiry_classificationDTO dto) {
			mapper.ic_update(dto);
	}

	@Override
	public void ic_delete(int ic_no) {
			mapper.ic_delete(ic_no);
	}
	
	
}
