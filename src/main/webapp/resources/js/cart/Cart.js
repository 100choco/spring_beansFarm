$(function(){
	
	//전체 금액 나타내기
	$( document ).ready(function() {
		var total = 0;
		
		$(".order_price").each(function(){
			total+=parseInt($(this).val());
		})
		
		
		$("#total_price").val(total)
	});
	
	
	// 체크박스선택
    $("#cartAll").click(function(){
   
        if($("input[name=cartAll]").prop("checked")){
           $("input[name=cartChk]").prop("checked",true);

      	}else{
            $("input[name=cartChk]").prop("checked",false);
      }
    })


   // 개별 체크박스선택
   $(".cartChk").click(function(){
      var cartChk = $(this).closest('tr').find('.cartChk').val();
      
	    if($(cartChk).prop("checked",false)){
	     	$(cartChk).prop("checked",false);
	        $("input[name=cartAll]").prop("checked",false);

	  	}else if($("input[name=cartChk]").prop("checked",true)) {
			$("input[name=cartAll]").prop("checked",true);
		}
      
    })



	//선택삭제 클릭
	$("#choiceBtn").on("click",function(){
		var cart_no = new Array();
      
	      $("input[name='cartChk']:checked").each(function(i){
	         cart_no.push($(this).val());
	      })
		alert(cart_no);
		
		$.ajax({
		    url:'/cartviews/cartOneDelete',
		    type:'post',
		    data:{cart_no:cart_no},
			traditional:true, //배열
		    success: function(data) {
				alert("상품이 삭제 되었습니다");
				location.reload();
		    },
		    error: function(err) {
				alert("선택된 항목이 없습니다");
				location.reload();
		    }
		});

	});
	
	
	//선택삭제 클릭
	$("#allBtn").on("click",function(){
		 if(confirm("전체 상품을 삭제 하겠습니까?")){
		 	location.href='/cartviews/cartAllDelete';
		 }else {
			location.reload();
		 }
	});
	
	// 주문하기로 보내기
	$("#orderBtn").on("click",function(){
		var cart_no = new Array();
      
	      $("input[name='cartChk']:checked").each(function(i){
	         cart_no.push($(this).val());
	      })

		alert(cart_no);
		
			$.ajax({
		    url:'/orderviews/orderCon',
		    type:'post',
		    data:{cart_no:cart_no},
			dataType : text,
			traditional:true, //배열
		    success: function(data) {
				alert(data);
				
		    },
		    error: function(err) {
				alert("선택된 항목이 없습니다");
				
		    }
		});
		
	

	});
	
	
	
		
});