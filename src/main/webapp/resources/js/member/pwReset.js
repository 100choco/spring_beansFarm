$(function() {
	var pwchk = 2;
	
	//비번 특수문자 확인 여부
	$("#m_pw1").on("keyup", function(){
		var m_pw1 = $("#m_pw1").val();
		var pwReg = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/;
    	
		if(m_pw1.length < 8 || m_pw1.length > 20){
	        pwchk = 0;
	        $(".pwChkText1").text("8글자이상 입력해주세요");
	        $(".pwChkText1").css("color", "red");
	        
	    }else if(!pwReg.test(m_pw1)){
	        pwchk = 0;
	        $(".pwChkText1").text("특수문자를 포함해서 입력해주세요");
	        $(".pwChkText1").css("color", "red");
	        
	    }else {
			pwchk = 1;
	        $(".pwChkText1").text("조건에 만족 합니다");
			$(".pwChkText1").css("color", "blue");
	    }

	});
	
	
	
	//비번 특수문자 확인 여부, 일치확인
	$("#m_pw").on("keyup", function(){
		var m_pw1 = $("#m_pw1").val();
		var m_pw = $("#m_pw").val();
		
    		    
		if(!(m_pw1 == m_pw)) {
			pwchk = 0;
			$(".pwChkText2").text("비밀번호가 일치 하지 않습니다");
			$(".pwChkText2").css("color", "red");
		}else {
			pwchk = 1;
			$(".pwChkText2").text("비밀번호가 일치 합니다");
			$(".pwChkText2").css("color", "blue");
		}

	});
	
	
	// 비밀번호 변경하기
	$("#pwRestBtn").on("click", function(){
		var m_id = $("#m_id").val();
		var m_pw = $("#m_pw").val();
				
		$.ajax({
			url : '/memberloginviews/pwUpdateajax',
			type: 'POST',
			data:{m_id:m_id, m_pw:m_pw},
			
			success : function(data) {
				
				if(pwchk == 0) {
					alert("비밀번호가 조건에 맞지 않습니다");
				}else if(data == 0) {
					alert("회원 정보가 없습니다");
				}else if(data == 1) {
					alert("비밀번호가 변경이 되었습니다");
					$(location).attr('href', '/memberloginviews/memberLogin_view');
				}
			}
		})
	});
	
});