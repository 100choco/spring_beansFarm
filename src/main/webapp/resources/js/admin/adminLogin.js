$(function() {
	
	$("#a_logninBtn").on("click", function(){
		var manager_id = $("#manager_id").val();
		var manager_pw = $("#manager_pw").val(); 
		
		$.ajax({
			
			url : '/adminviews/adminloginchkAjax',
			method : 'POST',
			data : {manager_id:manager_id, manager_pw:manager_pw},
			success : function(res) {
			
			if(res == "2") {
				alert(manager_id+"(관리자)님 로그인 하셨습니다");
				$(location).attr('href', '/adminviews/loginAfter_view')
				
			}else if(res == "3") {
				alert("비밀번호를 확인해 주세요");
				$("#manager_pw").val('');
				
			}else if(res == "4") {
				alert("아이디를 확인해 주세요");
				$("#manager_id").val('');
				$("#manager_pw").val('');
			}
				
			}
			
		})
		
	});
});