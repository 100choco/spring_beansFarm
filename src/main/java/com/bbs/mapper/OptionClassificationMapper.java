package com.bbs.mapper;

import java.util.List;

import com.bbs.model.OptionClassificationDTO;


public interface OptionClassificationMapper {
	
	public void insert(OptionClassificationDTO dto);
	
	public List<OptionClassificationDTO> selectByAll();
	
	public void update(OptionClassificationDTO dto);
	
	public void delete(int oc_no);
}
