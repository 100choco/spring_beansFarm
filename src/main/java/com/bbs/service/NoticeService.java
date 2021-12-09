package com.bbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbs.model.NoticeDTO;
import com.bbs.page.Criteria;


@Service
public interface NoticeService {

	public List<NoticeDTO> noticeSelectByAll();
	
	public List<NoticeDTO> listAll(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public void noticeInsert(NoticeDTO dto);
	
	public List<NoticeDTO> noticeDetail(int notice_no);
	
	public void noticeDelete(int notice_no);
	
	public void noticeUpdate(NoticeDTO dto);
	
	public void updateviewcnt(int notice_no);
	
	public List<NoticeDTO> noticeFixSelect();
	
}
