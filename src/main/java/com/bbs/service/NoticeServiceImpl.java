package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.NoticeMapper;
import com.bbs.model.NoticeDTO;
import com.bbs.page.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> noticeSelectByAll() {
		return noticeMapper.noticeSelectByAll();
	}

	@Override
	public List<NoticeDTO> listAll(Criteria cri) {
		return noticeMapper.listAll(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return noticeMapper.getTotal(cri);
	}

	@Override
	public void noticeInsert(NoticeDTO dto) {
		noticeMapper.noticeInsert(dto);
	}

	@Override
	public List<NoticeDTO> noticeDetail(int notice_no) {
		return noticeMapper.noticeDetail(notice_no);
	}

	@Override
	public void noticeDelete(int notice_no) {
		noticeMapper.noticeDelete(notice_no);
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		noticeMapper.noticeUpdate(dto);
		
	}
//	https://victorydntmd.tistory.com/333

	@Override
	public void updateviewcnt(int notice_no) {
		noticeMapper.updateviewcnt(notice_no);
	
	}

	@Override
	public List<NoticeDTO> noticeFixSelect() {
		return noticeMapper.noticeFixSelect();
	}



}
