$(function(){

	/* delete 삭제 문구 */
	var q_no = $("#q_no").val();

	$("#deleteBtn").on("click", function() {
		var del = confirm("정말 삭제 하시겠습니까?")

		if(del == true){
			location.href='/qnaviews/qnaDelete?q_no='+q_no;
		}else{
			alert("취소되었습니다.");
		}
		
	});



		/*  답변 보이기 숨기기  */
		
		/* 답변 상태 값 받아서 변수 저장 */
		var rs = $("#answer").val();
	
		/* 변수에 담은 값 일치 확인 (True이면 보여준다.) */
		/* 답변이 완료된 글에는 수정버튼 숨김 */
		
		if(rs == "답변완료"){
			$(".answerTbl").show();
			$("#answerBtn").hide();
			$("#answerForm").hide();
			
			
		}else{
			$(".answerTbl").hide();
			$("#modifyForm").hide();
		}


	/*  페이징 관련 이벤트  */
	
 		var moveForm = $(".moveForm");
 		
 		$(".pageInfo a").on("click", function(e) {
			
 			e.preventDefault();
 		
 			moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
 			moveForm.attr("action", "/qnaviews/qna_view");
 			moveForm.submit();
 			
		})
		
		$("#fileBtn").on("change", function(e){
			console.log("fileName : " + fileObj.name);
			
			alert("이미지 등록 완료");
		});
		
		let regex = new RegExp("(.*?)\.(jpg|png)$")
		
		function fileCheck(fileName, fileSize){
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
			
	}
		
});

