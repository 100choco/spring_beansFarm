package com.bbs.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString   //데이터는 생성자까지 잡아주기때문에 안쓴다. 
public class ViewPage {

   private int startPage;      // 기준점으로부터 시작페이지임 1페이지를 말하는게아님 1(시작)~10(끝)페이지보여주다가 다음으로 넘어가면 11(시작)~20(끝)보여지는거처럼. 
   private int endPage;
   private boolean prev;      // 이전버튼
   private boolean next;      // 다음버튼
                        // 내가 만약에 한페이지에 10개만 넣을꺼야 내가 가진 게시물의 수는 12960개다 페이지버튼은 1296개가 될꺼다. 
   private int total;         // 전체 게시물의 수.
   private Criteria cri;      // 페이징할때 기준점이 될 아이가 필요한데 이 아이를 쓴다.      
   
   public ViewPage(Criteria cri, int total) {
      
      this.cri = cri;
      this.total = total;
      
      this.endPage = (int)Math.ceil(cri.getPageNum()/10.0)*10;      // 페이지넘버가 1이라고 치자. 1나누기10은 0.1 math에 Math.ceil(total) 올림을 하면 1 거기에 곱하기10하면 10이된다.
                                                      // 메스 세일(올림) 이게 반환타입이 더블이니까 int로 형변환해준다. 
                                                      // 이렇게되면 페이지넘버가 1일때 끝페이지가 10이 되는거다.
      this.startPage = this.endPage - 9;   // 끝페이지가 위에서 10으로 정해졌기때문에 총 10페이지가 선택되게할려면 -9를해서 1~10까지 보여지게 된다.
      
      int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));      // 총게시물에서 내 디비에서 총 몇개가있는지 뽑아낼꺼다. 이럼 최종값이 뽑힌다. 
      
      if(realEnd < this.endPage) {
         this.endPage = realEnd;
      }
      
      this.prev = this.startPage > 1;         // 진짜 시작헤이진데 이전페이지가 나오면 안되니까 불린값이 트루or펄스가 나오게 하기위함
      this.next = this.endPage < realEnd;      // 진짜 끝페이진데 다음페이지가 나오면 안되니까 불린값이 트루or펄스가 나오게 하기위함
   }
}