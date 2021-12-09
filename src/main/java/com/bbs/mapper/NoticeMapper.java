package com.bbs.mapper;

import java.util.List;

import com.bbs.model.NoticeDTO;
import com.bbs.page.Criteria;


public interface NoticeMapper {

	public List<NoticeDTO> noticeSelectByAll();
	
	public void noticeInsert(NoticeDTO dto);
	
	public List<NoticeDTO> listAll(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<NoticeDTO> noticeDetail(int notice_no);
	
	public void noticeDelete(int notice_no);
	
	public void noticeUpdate(NoticeDTO dto);
	
	public void updateviewcnt(int notice_no);
	
	public List<NoticeDTO> noticeFixSelect();
}
