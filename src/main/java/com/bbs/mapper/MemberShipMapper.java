package com.bbs.mapper;

import java.util.List;

import com.bbs.model.MemberShipDTO;

public interface MemberShipMapper {

	public void msInsert(MemberShipDTO msDTO);

	public List<MemberShipDTO> msList();

	public void msUpdate(MemberShipDTO msDTO);

	public void msDelete(MemberShipDTO msDTO);

}
