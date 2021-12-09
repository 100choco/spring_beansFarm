$(function(){
	
	//등업하기
	$("#gradeUpBtn").on("click",function(){
		var m_id = $('#m_id').val();
		var msName = $('#membershipName').val();
		
		alert(m_id);
		alert(msName);
		$.ajax({
			url:'/adminviews/memberInfoupdate',
			type:'POST',
			data : {m_id:m_id, msName:msName},
			success : function(data) {
				alert(m_id + "님의 등업이 완료 되었습니다");
				location.reload();
			}
		})
		
		
	});
	
	//이전
	$("#backBtn").on("click",function(){
		
		$(location).attr("href", "/adminviews/adminMemberList_view");
		
	});
	
	//회원완전삭제
	$("#memberdeleteBtn").on("click",function(){
		var m_id = $(this).closest('tr').find('#m_id').val();
		
		if(confirm(m_id+ "님의 회원을 탈퇴하겠습니까?")) {
		$.ajax({
			url:'/adminviews/memberInfodelete',
			type:'POST',
			data : {m_id:m_id},
			success : function(data) {
				alert(m_id + "님이 삭제 되었습니다");
				location.reload();
				}
			})
		
		}else {
			alert(m_id + "님이 삭제가 취소되었습니다");
		}
	});
	
});
