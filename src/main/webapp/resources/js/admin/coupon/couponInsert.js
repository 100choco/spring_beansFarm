$(function() {
	
	//쿠폰지급하기
	$("#couponInsert").on("click", function(){
		
		var m_no = $("#m_no").val();
		var c_name = $("#c_name").val();
		var date = $("#date").val();
		var c_content = $("#c_content").val();
		var c_discount = $("#c_discount").val();
		
		alert(date);
		
		if(confirm("쿠폰을 지급하시겠습니까?")) {
			$.ajax ({
				
				url:"/adminviews/control/couponInsert",
				method:"POST",
				data :{m_no:m_no, c_name:c_name,
						date:date,
						c_content:c_content,
						c_discount:c_discount
						},
				success:function(res) {
					alert("쿠폰 지급이 완료 되었습니다");
					$(location).attr("href","../adminMemberList_view");
				}
				
			})
			
		}else {
			alert("지급이 취소 되었습니다");
		}
		
	});
	
});