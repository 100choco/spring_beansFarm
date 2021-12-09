$(function(){
	alert("122121")
	$(".reviewBtn").on("click",function(){
	
		var order_no = $(this).closest('td').find('.order_no').val();
		alert(order_no);
		
		$.ajax({
		
		        url: '/mypageviews/myPagereviewCountAjax',
		        type: 'POST',
				dataType : 'json',
		        data: {order_no:order_no},
				success : function(result) {
					alert(result);
					if(result == 0){
					
						$(".reviewChk").submit();
					
					}else{
					
						alert("해당상품에 대한 리뷰를 작성하셨습니다.");
						
					}
					
					
				}
			
		})
			
	})	
	
		$(".reDelBtn").on("click",function(event){
			
			
			
			var r_no = $(this).closest('tr').find('.reDelBtn').val();
			
			
			
			if(confirm('정말 삭제하시겠습니까?')){
				
	      		alert("삭제되었습니다!");

				$(location).attr("href", "/mypageviews/reviewDelete?r_no="+r_no);		
				

		     	return true;		

		
			    		}else {
	
						alert("취소되었습니다!");
						alert(r_no);
						event.preventDefault();
		     			return false;
			      }
			
		});
		
	
	$("#search").click(function() {
	    $("#popup").fadeIn();
	    $(".realSearch").focus();
    });

	$("#popup").click(function() {
		$("#popup").fadeOut();
    });

	$(".iBar").click(function() {
		alert("!!");
	});
	
	$(".iBar").click(function() {
		alert("!!");
	});

	


});