package com.bbs.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString  
public class ProductDetailsViewPage {

   private int startPage;     
   private int endPage;
   private boolean prev;    
   private boolean next;     
                       
   private int total;       
   private ProductDetailsCriteria cri;   
   
   public ProductDetailsViewPage(ProductDetailsCriteria cri, int total) {
      
      this.cri = cri;
      this.total = total;
      
      this.endPage = (int)Math.ceil(cri.getPageNum()/10.0)*10;   
                                                    
                                                     
      this.startPage = this.endPage - 9;   
      
      int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));     
      
      if(realEnd < this.endPage) {
         this.endPage = realEnd;
      }
      
      this.prev = this.startPage > 1;        
      this.next = this.endPage < realEnd;    
   }
}