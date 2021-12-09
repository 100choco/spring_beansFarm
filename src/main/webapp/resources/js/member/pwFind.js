$(function(){
	var emailchk = 2;
	
	
	//emil 확인 체크
	$("#m_email").on("keyup", function(){
		var m_email = $("#m_email").val();
		var m_emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]+\.)+[a-zA-Z]{2,3}$/i;
		
		if(!m_emailReg.test(m_email)) {
			emailchk = 1;
			$("#emailText").text("이메일 형식에 맞춰주세요");
			$("#emailText").css("color", "red");
		}else{
			emailchk = 0;
			$("#emailText").empty();
		}
	});
	
	
	// 비밀번호 재설정
	$("#pwFindBtn").on("click", function(){
		var m_id = $("#m_id").val();
		var m_email = $("#m_email").val();
		
		if(emailchk == 1) {
			alert("이메일 형식에 맞춰주세요");
		}
		
		$.ajax({
			url : '/memberloginviews/pwFindajax',
			type: 'POST',
			data:{m_id:m_id, m_email:m_email},
			
			success : function(data) {
				if(data == "2") {
					$(location).attr('href', '/memberloginviews/memberPwReset_view');
				
				}else {
					alert("회원 정보가 일치 하지 않습니다");
				}
				
			}
			
		})
	});
		
	
});