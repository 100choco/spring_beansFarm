package com.bbs.page;

import java.util.Arrays;

public class ProductDetailsCriteria {
	
   private int pageNum;   // 내가 원하는 페이지 넘버   
   
   private int amount;      // 한페이지당 보여질 개수
   
   private int skip;      // 페이지건너띌때 쓸꺼
   
 
   
   private String type;   // product
   
   private String[] typeArr;   // 검색 타입 배열
    
   private String keyword;	//검색 키워드
   
   private Long p_no;
   
   public Long getP_no() {
	   return p_no;
   }


	public void setP_no(Long p_no) {
		this.p_no = p_no;
	}


	public ProductDetailsCriteria() {
	      this(1,5, 0L);
	      this.skip = 0;
   }
   

   public ProductDetailsCriteria(int pageNum, int amount, long p_no) {     
      
	  this.p_no = p_no;
      this.pageNum = pageNum;
      this.amount = amount;
      this.skip = (pageNum-1) * amount;
      
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
	return "ProductDetailsCriteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", type=" + type
			+ ", typeArr=" + Arrays.toString(typeArr) + ", keyword=" + keyword + ", p_no=" + p_no + "]";
}



	
   
   
}