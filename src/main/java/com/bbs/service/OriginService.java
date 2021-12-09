package com.bbs.service;

import java.util.List;

import com.bbs.model.OriginDTO;

public interface OriginService {
	
	public void insert(OriginDTO dto);
	
	public List<OriginDTO> selectByAll();
	
	public void update(OriginDTO dto);
	
	public void delete(int origin_no);
}
