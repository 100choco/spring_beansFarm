$(function() {
	
	
	/* 멤버쉽 등급 추가 */
	$("#msInsertBtn").on("click", function(){
		var ms_no = $("#membership_no").val();
		var ms_name = $("#membership_name").val();
		var ms_ratio = $("#point_ratio").val();
				
		$.ajax({
			type : 'post',
			data: {membership_no:ms_no,
				   membership_name:ms_name,
				   point_ratio:ms_ratio},
			url : '/adminviews/memberShip/insert',
			success : function(result) {
				alert("추가되었습니다");
				location.reload();
				
			} 
		})
		
	});
	
	
	
	
	
	/* 멤버쉽 등급 수정 */
	$("#msUpdateBtn").on("click", function(){
		var ms_no = $("#membership_no").val();
		var ms_name = $("#membership_name").val();
		var ms_ratio = $("#point_ratio").val();
				
		$.ajax({
			type : 'post',
			data: {membership_no:ms_no,
				   membership_name:ms_name,
				   point_ratio:ms_ratio},
			url : '/adminviews/memberShip/update',
			success : function(result) {
				alert("수정이되었습니다");
				location.reload();
				
			}
		})
		
	});
	
	
	
	
	/* 멤버쉽 등급 삭제 */
	$("#msDeleteBtn").on("click", function(){
		var ms_no = $("#membership_no").val();
		
		alert("삭제");
		alert(ms_no);
		$.ajax({
			type : 'post',
			data: {membership_no:ms_no},
			url : '/adminviews/memberShip/delete',
			success : function(result) {
				alert("삭제되었습니다");
				location.reload();
				
			}
		})
		
	});
	
	
});