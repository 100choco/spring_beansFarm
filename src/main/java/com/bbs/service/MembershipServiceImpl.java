package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.MemberShipMapper;
import com.bbs.model.MemberShipDTO;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MemberShipMapper membershipMapper;

	@Override
	public void msInsert(MemberShipDTO msDTO) {
		
		membershipMapper.msInsert(msDTO);
	}

	@Override
	public List<MemberShipDTO> msList() {
		
		return membershipMapper.msList();
	}

	@Override
	public void msUpdate(MemberShipDTO msDTO) {
		
		membershipMapper.msUpdate(msDTO);
		
	}

	@Override
	public void msDelete(MemberShipDTO msDTO) {
		
		membershipMapper.msDelete(msDTO);
		
	}

	

}
