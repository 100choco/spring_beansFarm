package com.bbs.mapper;

import java.util.List;

import com.bbs.model.Inquiry_classificationDTO;

public interface Inquiry_classificationMapper {

	public List<Inquiry_classificationDTO> listAll();

	public void ic_insert(Inquiry_classificationDTO dto);

	public void ic_update(Inquiry_classificationDTO dto);

	public void ic_delete(int ic_no);

}
