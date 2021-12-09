$(function() {
		
	var idchk = 2;
	var pwchk = 2;
	var phonechk = 2;
	var emailchk = 2;
	var emailNumchk = 2; 
	var number = "";
	
	
	//아이디 중복체크 확인
	$("#m_id").on("keyup", function(){
		var m_id = $("#m_id").val();
		var idReg = /^[a-zA-Z0-9]{3,10}$/g;
		
		$.ajax({
			
			url : '/memberloginviews/idchkAjax',
			method : 'POST',
			dataType : "json",
			data : {m_id:m_id},
			success : function(data) {
				if(!idReg.test(m_id)) {
					idchk = 1;
                    $(".idChkText").text("첫 글자는영숫자, 최소3글자 이상 입력하세요");
                    $(".idChkText").css("color", "red");

				}else if(data == 1) {
					$(".idChkText").text("아이디가 중복 입니다");
					$(".idChkText").css("color", "red");
					
				}else{
					idchk = 0;
                    $(".idChkText").text("사용가능한 아이디 입니다");
                    $(".idChkText").css("color", "blue");
                }
			}
			
		})
		
	});
	
	
	//비번 특수문자 확인 여부
	$("#m_pw1").on("keyup", function(){
		var m_pw1 = $("#m_pw1").val();
		var pwReg = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/;
    	
		if(m_pw1.length < 8 || m_pw1.length > 20){
	        pwchk = 1;
	        $(".pwChkText1").text("8글자이상 입력해주세요");
	        $(".pwChkText1").css("color", "red");
	        
	    }else if(!pwReg.test(m_pw1)){
	        pwchk = 1;
	        $(".pwChkText1").text("특수문자를 포함해서 입력해주세요");
	        $(".pwChkText1").css("color", "red");
	        
	    }else {
			pwchk = 0;
	        $(".pwChkText1").text("조건에 만족 합니다");
			$(".pwChkText1").css("color", "blue");
	    }

	});
	
	
	
	//비번 특수문자 확인 여부, 일치확인
	$("#m_pw").on("keyup", function(){
		var m_pw1 = $("#m_pw1").val();
		var m_pw = $("#m_pw").val();
		
    		    
		if(!(m_pw1 == m_pw)) {
			pwchk = 1;
			$(".pwChkText2").text("비밀번호가 일치 하지 않습니다");
			$(".pwChkText2").css("color", "red");
		}else {
			pwchk = 0;
			$(".pwChkText2").text("비밀번호가 일치 합니다");
			$(".pwChkText2").css("color", "blue");
		}

	});
	
	
	
	//전화번호(끝자리) 숫자만 기입가능
	$("#m_phone3").on("keyup", function(){
		var m_phone2 = $("#m_phone2").val();
		var m_phone3 = $("#m_phone3").val();
		
		var reg_check_tel2=/^[0-9]{3,4}$/;   //휴대폰 번호 두번째
		var reg_check_tel3=/^[0-9]{4,4}$/;   //휴대폰 번호 세번째
    	
		if(!reg_check_tel2.test(m_phone2)) {
			phonechk = 1;
			$(".phoneChkText").text("숫자로 입력해주세요");
			$(".phoneChkText").css("color", "red");
			
		}else if(!reg_check_tel3.test(m_phone3)) {
			phonechk = 1;
			$(".phoneChkText").text("정확한 전화번호를 기입해주세요");
			$(".phoneChkText").css("color", "red");
			
		}else {
			phonechk = 0;
			$(".phoneChkText").text("");
			$(".phoneChkText").css("color", "blue");
		}

	});




	//이름 공백
	$("#m_name").on("keyup", function(){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\ '\"\\(\=]/gi;
		var str = $( "#m_name").val();
		var text = str.replace(regExp, "")
		
		$("#m_name").val(text.trim());
		$(".nameChkText").text("공백은 자동으로 제거 됩니다");
		$(".nameChkText").css("color", "red");
		
	});
	
	
	
	
	//우편번호 입력 활성화
	$("#addressFindBtn").on("click", function(){
		
		$("#m_postnum").attr("disabled", false);
		
	});
	
	
	
	//이메일 인증번호 전송
	$("#getNumberBtn").on("click", function(){
	
	var m_email1 = $("#m_email1").val();
	var m_email2 = $("#m_email2").val();
	var m_email = m_email1 + "@" + m_email2;
			
		$.ajax({
			
			url : '/memberloginviews/emailSendAjax',
			type : 'POST',
			dataType : "json",
			data : {m_email:m_email},
			success : function(data) {
				
				if(m_email1 == "") {
					emailchk = 1;
					alert("이메일을 입력하지 않았습니다");
				}else {
					emailchk = 0;
					
					alert("인증번호를 보냈습니다");
					number = data;
					$("#m_emailChkNumber").attr("disabled", false);
					$("#getNumberChkBtn").attr("disabled", false);
				}
				
				
			}
		})
	
	});
	
	
	
	
	//이메일 인증번호 확인
	$("#getNumberChkBtn").on("click", function(){
		var m_emailChkNumber = $("#m_emailChkNumber").val();
		
        if(m_emailChkNumber == "") {
			emailNumchk = 1;
		}else if(!(m_emailChkNumber == number)) {
			emailNumchk = 1;
			$(".emailChkText").text("인증번호가 일치 하지 않습니다");
			$(".emailChkText").css("color", "red");
		}else {
			emailNumchk = 0;
			$(".emailChkText").text("인증번호가 일치 합니다");
			$(".emailChkText").css("color", "blue");
		}
	
	});
	
	
	
	//이메일 중복체크 확인
	$("#m_email1").on("keyup", function(){
		var m_email1 = $("#m_email1").val();
		var m_email2 = $("#m_email2").val();
		var m_email = m_email1 + "@" + m_email2;
		
		$.ajax({
			
			url : '/memberloginviews/emailchkAjax',
			method : 'POST',
			dataType : "json",
			data : {m_email:m_email},
			success : function(data) {
				if(data == 1) {
					emailchk = 1;
					$(".emailChkText").text("이메일이 중복 입니다");
					$(".emailChkText").css("color", "red");
					$("#getNumberBtn").attr("disabled", true);
					
				}else{
					emailchk = 0;
                    $(".emailChkText").text("사용가능한 이메일 입니다");
                    $(".emailChkText").css("color", "blue");
					$("#getNumberBtn").attr("disabled", false);
                }
			}
			
		})
		
	});
	
	
	
	
	// 가입하기
	$("#m_join").on("click",function(){
		
		//널체크 함수 불러오기 1이면 공백이 있고, 0이면 공백이 없다
		var nullRes = nullChk();
		
		//오류체크 함수 불러오기 1이면 있고, 0이면 없다
		var errorRes = errorChk();
				
		//폼 작성 완료 시 전송하기
		if(nullRes == 1) {
			alert("필수 항목을 입력해주세요");
		}else if(errorRes == 0){
			alert("조건에 맞지 않습니다");
		}else {
			alert("회원가입을 축하드립니다!");
			
			$("#joinCheck").attr("action", "/memberloginviews/memberInsert");
			$('#m_join').attr("type", "submit");
		
		}
		
	});


// 널 체크 함수
function nullChk(){
	
	if( ($("#m_id").val() == "") || 
		($("#m_pw1").val() == "") ||
		($("#m_pw").val() == "") ||
		($("#m_name").val() == "") ||
		($("#m_phone2").val() == "") ||
		($("#m_phone3").val() == "") ||
		($("#m_postnum").val() == "") ||
		($("#m_address").val() == "") ||
		($("#m_detailed_address").val() == "")
		
		) {
		return 1;
	}else {
		return 0;
	}
}


//오류 체크 함수
function errorChk(){
	
	if( (idchk == 0) &&
		(pwchk == 0) &&
		(phonechk == 0) &&
		(emailchk == 0) &&
		(emailNumchk == 0)
		
		) {
		return 1;
	}else {
		return 0;
	}
}


});




