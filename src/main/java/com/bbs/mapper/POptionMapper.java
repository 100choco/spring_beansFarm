package com.bbs.mapper;

import java.util.List;

import com.bbs.model.POptionDTO;


public interface POptionMapper {
	
	public void insert(POptionDTO dto);
	
	public List<POptionDTO> selectByAll();
	
	public void update(POptionDTO dto);
	
	public void delete(int op_no);
	
	public void pNoDelete(long p_no);

	public List<POptionDTO> selectByPNo(Long p_no);	
	
	public POptionDTO selectByOpNo(int op_no);
}
