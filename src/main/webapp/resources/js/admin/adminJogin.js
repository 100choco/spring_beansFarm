$(function() {
		
	var idchk = 2;
	var pwchk = 2; 
	
	
	//아이디 중복체크 확인
	$("#manager_id").on("keyup", function(){
		var manager_id = $("#manager_id").val();
		var idReg = /^[a-zA-Z0-9]{3,10}$/g;
		
		$.ajax({
			
			url : '/adminviews/adminidchkAjax',
			method : 'POST',
			dataType : "json",
			data : {manager_id:manager_id},
			success : function(data) {
				if(!idReg.test(manager_id)) {
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
	$("#manager_pw1").on("keyup", function(){
		var manager_pw1 = $("#manager_pw1").val();
		var pwReg = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/;
    	
		if(manager_pw1.length < 8 || manager_pw1.length > 20){
	        pwchk = 1;
	        $(".pwChkText1").text("8글자이상 입력해주세요");
	        $(".pwChkText1").css("color", "red");
	        
	    }else if(!pwReg.test(manager_pw1)){
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
	$("#manager_pw").on("keyup", function(){
		var manager_pw1 = $("#manager_pw1").val();
		var manager_pw = $("#manager_pw").val();
		
    		    
		if(!(manager_pw1 == manager_pw)) {
			pwchk = 1;
			$(".pwChkText2").text("비밀번호가 일치 하지 않습니다");
			$(".pwChkText2").css("color", "red");
		}else {
			pwchk = 0;
			$(".pwChkText2").text("비밀번호가 일치 합니다");
			$(".pwChkText2").css("color", "blue");
		}

	});
	
	
	
	//이름 공백
	$("#manager_name").on("keyup", function(){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\ '\"\\(\=]/gi;
		var str = $( "#manager_name").val();
		var text = str.replace(regExp, "")
		
		$("#manager_name").val(text.trim());
		$(".nameChkText").text("공백은 자동으로 제거 됩니다");
		$(".nameChkText").css("color", "red");
		
	});
	
	
	
	
	// 가입하기
	$("#joinBtn").on("click",function(){
		
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
			
			$("#adminAct").attr("action", "/adminviews/adminInsert");
			$('#joinBtn').attr("type", "submit");
		
		}
		
	});
	
	
	
	


// 널 체크 함수
function nullChk(){
	
	if( ($("#manager_id").val() == "") || 
		($("#manager_pw1").val() == "") ||
		($("#manager_pw").val() == "") ||
		($("#manager_name").val() == "")
		
		) {
		return 1;
	}else {
		return 0;
	}
}


//오류 체크 함수
function errorChk(){
	
	if( (idchk == 0) &&
		(pwchk == 0)
		
		) {
		return 1;
	}else {
		return 0;
	}
}


});




