$(function(){
	
	
	
	// 검색기능
	$("#searchBtn").on("click", function(e){
		e.preventDefault();
		var moveForm = $(".moveForm");
		
        
		let type = $(".searchBox select").val();
        let keyword = $("input[name='keyword']").val();

		alert("type : " + type);
		alert("keyword : " + keyword);
		
		if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }   

		moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
		moveForm.attr("action", "/adminviews/adminMemberList_view");
        moveForm.submit();
    });



	// 페이징
	$(".pageInfo a").on("click",function(e) {
		var moveForm = $(".moveForm");
		
		e.preventDefault();
		moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/adminviews/adminMemberList_view");
		moveForm.submit();
		
		
	})
	
	
	
	//회원 정보 보기
	$(".memberInfo").on("click", function(){
		var m_id = $(this).closest('tr').find('#m_id').val();
		
		var result = confirm(m_id +'님의 회원 정보를 보시겠습니까?');
	         if(result){
		
				$.ajax({	
					url:'/adminviews/memberInfo_view',
					type:'Get',
					data : {m_id:m_id},
					success : function(data) {
						$(location).attr("href", "/adminviews/memberInfo_view?m_id="+m_id);
						
					}
				})
			}
	});
	
	
	
	//비밀번호초기화
	$(".memberpwReset").on("click", function(){
		var m_id = $(this).closest('tr').find('#m_id').val();
		/*var m_id = $("#m_id").val();*/
		
		$.ajax({
			url:'/adminviews/memberpwReset',
			type:'POST',
			data : {m_id:m_id},
			success : function(data) {
				alert(m_id + "님의 비밀번호가 초기화 되었습니다");
				alert(m_id + "님의 초기화 된 비번은 1234 입니다");
			
			}
		})
	});
	
	
	
	// 회원삭제
	$(".memberdelete").on("click", function(){
		var m_id = $(this).closest('tr').find('#m_id').val();
		/*var m_id = $("#m_id").val();*/
		
		$.ajax({
			url:'/adminviews/memberdelete',
			type:'POST',
			data : {m_id:m_id},
			success : function(data) {
				alert(m_id + "님의 회원이 삭제 되었습니다");
				location.reload();

			}
		})
	});
	
	
	
	
	
	
	
	
	
	
	
});
