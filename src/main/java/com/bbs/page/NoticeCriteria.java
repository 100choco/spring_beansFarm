package com.bbs.page;

import java.util.Arrays;

public class NoticeCriteria {
	private int pageNum; //현재 페이지
	
	private int amount; // 한페이지당 보여질 게시물 갯수
	
	private int skip;
	
	private String type; // 검색 타입
	
	private String[] typeArr; // 검색 타입 배열 변환
	
	private String keyword; // 검색 키워드
	 
	public String getKeyword() { return keyword; }
	 
	public void setKeyword(String keyword) { this.keyword = keyword; }
	
	public String getType() { return type; }
	
	public void setType(String type) { this.type = type; this.typeArr = type.split(""); }
	
	public String[] getTypeArr() { return typeArr; }
	
	public void setTypeArr(String[] typeArr) { this.typeArr = typeArr; }
	
	public NoticeCriteria() {
		this(1, 10);
		this.skip = 0;
	}
	
	public NoticeCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1) * amount;
	}


	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	@Override 
	public String toString() { return "NoticePage [pageNum=" + pageNum
		 + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword +
		", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]"; }
	
}
