$(function() {
	
	$("#m_logninBtn").on("click", function(){
		var m_id = $("#m_id").val();
		var m_pw = $("#m_pw").val();
		
		$.ajax({
			
			url : 'loginchkAjax',
			method : 'POST',
			data : {m_id:m_id, m_pw:m_pw},
			success : function(res) {
			
			if(res == "leaveChk") {
				alert("탈퇴된 회원입니다");
				
			}else if(res == "loginChk") {
				alert(m_id+"님 환영합니다");
				$(location).attr('href', '/');
				
			}else if(res == "pwError") {
				alert("비밀번호를 확인해 주세요");
				$("#m_pw").val('');
				
			}else if(res == "idError") {
				alert("아이디를 확인해 주세요");
				$("#m_id").val('');
				$("#m_pw").val('');
				
			}
				
			}
			
		})
		
	});
});