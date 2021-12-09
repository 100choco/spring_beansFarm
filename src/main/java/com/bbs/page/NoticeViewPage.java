package com.bbs.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeViewPage {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private NoticeCriteria np;
	
	public NoticeViewPage(NoticeCriteria np, int total) {
		this.np = np;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(np.getPageNum()/10.0))*10;
		this.startPage = endPage - 9;
		
		int realEnd = (int)(Math.ceil(total * 1.0/np.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
	}
	
	
}
