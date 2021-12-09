$(function(){
	
	$("#pwchk").on("click", function(){
		var m_id = $("#m_id").val();
		var m_pw = $("#m_pw").val(); 
		
		$.ajax({
			
			url : '/memberloginviews/loginchkAjax',
			method : 'POST',
			data : {m_id:m_id, m_pw:m_pw},
			success : function(res) {
			if(res == "loginChk") {
				$(location).attr('href', '/mypageviews/myPageInfo/myPageInfoUpdate_view')
				
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