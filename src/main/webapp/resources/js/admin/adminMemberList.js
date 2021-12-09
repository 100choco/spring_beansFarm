$(function(){
   
   
   
   // 검색기능
   $("#searchBtn").on("click", function(){
      var moveForm = $(".moveForm");
      
        
      let type = $(".searchBox select").val();
        let keyword = $("input[name='keyword']").val();

      alert("type : " + type);
      alert("keyword : " + keyword);
      
      if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }   

      moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1).attr("href");
      moveForm.attr("action", "/adminviews/adminMemberList_view");
        moveForm.submit();
    });



   // 페이징
   $(".pageInfo a").on("click",function(e) {
      var moveForm = $(".moveForm");
      
      e.preventDefault();
      moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
      moveForm.attr("action", "/adminviews/adminMemberList_view");
      moveForm.submit();
      
      
   })
   
   
   
   
   //쿠폰지급(회원번호 선택하기)
   $("#choiceBtn").on("click",function(){
      
      var m_noCheckArr = new Array();
   
      $("input[name='memberchk']:checked").each(function(i){
         m_noCheckArr.push($(this).val());
         // 체크된 것만 값을 뽑아서 배열에 push
      })
      
      alert(m_noCheckArr);
      $('input[name=m_noCoupon]').attr('value', m_noCheckArr);
         
   });
   
   
   
   // 쿠폰지급
   $("#couponAllBtn").on("click",function(){
      var m_noList = new Array();
      var c_name = $("#c_name").val();
      var date = $("#date").val();
      var c_content = $("#c_content").val();
      var c_discount = $("#c_discount").val();
      
      $("input[name='member']:checked").each(function(i){
         m_noList.push($(this).val());
      })
      
      
      
      
      if(confirm("선택한 회원에게 쿠폰을 지급하시겠습니까?")) {
         alert(m_noList);
         $.ajax({
              url: '/adminviews/coupon/couponAllInsert',
              type: 'POST',
              data: {m_noList:m_noList,
                  c_name:c_name,
                  date:date,
                  c_content:c_content,
                  c_discount:c_discount,

                  },
            traditional:true,
            success : function(result) {
               
               alert(result);
               alert("쿠폰 지급이 완료 되었습니다");
               location.reload();
               
            }
               
          })
      }else {
         alert("지급이 취소 되었습니다");
      }
   });
   
   
   
   
   // 체크박스선택
    $("#memberAll").click(function(){
   
        if($("input[name=memberAll]").prop("checked")){
           $("input[name=memberchk]").prop("checked",true);

      	}else{
            $("input[name=memberchk]").prop("checked",false);
      }
    })


   // 개별 체크박스선택
   $(".memberchk").click(function(){
      var memberchk = $(this).closest('tr').find('.memberchk').val();
      
	    if($(memberchk).prop("checked",false)){
	     	$(memberchk).prop("checked",false);
	        $("input[name=memberAll]").prop("checked",false);

	  	}else if($("input[name=memberchk]").prop("checked",true)) {
			$("input[name=memberAll]").prop("checked",true);
		}
      
    })



   
   
   
   //회원 정보 보기
   $(".memberInfo").on("click", function(){
      var m_id = $(this).closest('tr').find('#m_id').val();
      
      var result = confirm(m_id +'님의 회원 정보를 보시겠습니까?');
            if(result){
      
            $.ajax({
               url:'/adminviews/control/memberInfo_view',
               type:'Get',
               data : {m_id:m_id},
               success : function(data) {
                  $(location).attr("href", "/adminviews/control/memberInfo_view?m_id="+m_id);
                  
               }
            })
         }
   });
   
   
   
   
   // 쿠폰지급(한 회원당 지급하기)
   $(".couponBtn").on("click", function(){
      var m_no = $(this).closest('tr').find('#m_no').val();
      alert(m_no);
      $(location).attr("href", "/adminviews/control/couponGift_view?m_no="+m_no);
      
   });
   
   
   
   //비밀번호초기화
   $(".memberpwReset").on("click", function(){
      var m_id = $(this).closest('tr').find('#m_id').val();
      /*var m_id = $("#m_id").val();*/
      
      $.ajax({
         url:'/adminviews/memberpwReset',
         type:'POST',
         data : {m_id:m_id},
         success : function(data) {
            alert(m_id + "님의 비밀번호가 초기화 되었습니다");
            alert(m_id + "님의 초기화 된 비번은 1234 입니다");
            location.reload();
         }
      })
   });
   
   
   
   // 회원삭제
   $(".memberdelete").on("click", function(){
      var m_id = $(this).closest('tr').find('#m_id').val();
      /*var m_id = $("#m_id").val();*/
      
      $.ajax({
         url:'/adminviews/memberdelete',
         type:'POST',
         data : {m_id:m_id},
         success : function(data) {
            alert(m_id + "님의 회원이 삭제 되었습니다");
            location.reload();

         }
      })
   });
   
   
   
   
   
   
   
   
   
   
   
});