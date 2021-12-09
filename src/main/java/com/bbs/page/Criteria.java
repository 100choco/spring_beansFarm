package com.bbs.page;

import java.util.Arrays;

public class Criteria {
	
   private int pageNum;   // 내가 원하는 페이지 넘버   
   
   private int amount;      // 한페이지당 보여질 개수
   
   private int skip;      // 페이지건너띌때 쓸꺼
   
   private String type;   // 검색 타입
   
   private String[] typeArr;   // 검색 타입 배열
    
   private String keyword;	//검색 키워드
   
   public Criteria() {
      this(1,10);
      this.skip = 0;
   }
   


// select * from board limit 0, 10;   -- 처음부터 열개를 뽑아낸다.
//                          skip, amount
   public Criteria(int pageNum, int amount) {      // 매개변수랑 위에있는 전역변수랑은 다른거지만 같은값이 들어올꺼기때문에 일치시켜준다.
      
      this.pageNum = pageNum;
      this.amount = amount;
      this.skip = (pageNum-1) * amount; //1페이지는 (1-1) * 10 = 0  , 2페이지는 (2-1) * 10 = 10 이렇게 공식을 짠다. 
   }

   public int getPageNum() {
      return pageNum;
   }

   public void setPageNum(int pageNum) {
      this.skip = (pageNum-1) *this.amount;
      this.pageNum = pageNum;
   }

   public int getAmount() {
      return amount;
   }

   public void setAmount(int amount) {
      this.skip = (pageNum-1) * amount;
      this.amount = amount;
   }

   public int getSkip() {
      return skip;
   }
   
   public void setSkip(int skip) {
      this.skip = skip;
   }
   
   
   
   public String getType() {
	return type;
   }



	public void setType(String type) {
		this.type = type;
	}
	
	
	
	public String[] getTypeArr() {
		return typeArr;
	}
	
	
	
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
	
	
	public String getKeyword() {
			return keyword;
		}

   public void setKeyword(String keyword) {
		this.keyword = keyword;
   }



	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", type=" + type + ", typeArr="
				+ Arrays.toString(typeArr) + ", keyword=" + keyword + "]";
	}

   
   // 이러고나서 src/main/java -> com.bbs.mapper -> BoardMapper.java로 간다.
   
   
   
   
}