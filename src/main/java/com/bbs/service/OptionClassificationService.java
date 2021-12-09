package com.bbs.service;

import java.util.List;

import com.bbs.model.OptionClassificationDTO;

public interface OptionClassificationService {

	public void insert(OptionClassificationDTO dto);

	public List<OptionClassificationDTO> selectByAll();

	public void update(OptionClassificationDTO dto);

	public void delete(int oc_no);
}
