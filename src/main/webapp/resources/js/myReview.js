$(function(){
	
	$("#test").on("click",function(){
		
			var r_no = $('#test').val();
			
			alert(r_no)
		
	});
	
	$(".reDelBtn2").on("click",function(event){
			
			
			var r_photo = $(this).closest('tr').find('#r_photo2').val();
			var r_thumbnail = $(this).closest('tr').find('#r_thumbnail2').val();
			var r_no = $("#reviewDeleteBtn2").val();
			
			
			if(confirm('정말 삭제하시겠습니까?')){
				
	      		alert("삭제되었습니다!");

				$(location).attr("href", "/mypageviews/reviewDelete2?r_no="+r_no+"&r_photo="+r_photo+"&r_thumbnail="+r_thumbnail);		
				

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

	

	
	


	

		var moveForm = $(".moveForm");
			
			$(".pageInfo a").on("click", function(e) {

						e.preventDefault(); // 기본 이벤트 막기
						moveForm.find("input[name = 'pageNum']").val(
				
						$(this).attr("href")); //	위에 벨류값을 뭘로 바꿔줄껀데 인풋네임이 '페이지넘'인아이의 벨류값을 넘길꺼다.
						moveForm.attr("action", "/mypageviews/myReviewList/myReview_view");
						moveForm.submit();

					})

	


});