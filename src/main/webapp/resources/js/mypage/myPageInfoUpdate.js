$(function(){
	
	// 회원수정
	$("#UpdeteBtn").on("click", function(){
		var m_id = $("#m_id").val();
		var m_name = $("#m_name").val();
		var m_phone = $("#m_phone").val();
		var m_postnum = $("#m_postnum").val();
		var m_address = $("#m_address").val();
		var m_detailed_address = $("#m_detailed_address").val();
		
		$.ajax({
			
			url : '/mypageviews/myPageInfo/myPageInfoUpdateAjax',
			method : 'POST',
			data : {m_id:m_id, m_name:m_name,
					m_phone:m_phone, m_postnum:m_postnum,
					m_address:m_address, m_detailed_address:m_detailed_address},
			success : function(res) {
				alert("회원수정 완료");
				$(location).attr('href', '/mypageviews/myPageInfo/myPageInfo_view')
			}
		
		
		})


	});
	
	// 회원수정 주소목록	
	$('.m_no_btn').on("click",function(e){
		e.preventDefault();
		let popUrl = "/mypageviews/myPageInfo/myPageInfo_addressManagePop";
		let popOption = "width = 700px, height=650px, top=260px, left=950px, scrollbars=yes";
		
		window.open(popUrl,"주소 찾기",popOption);
		
	});
	

});

// 자식창(팝업창)에서 오는 값을 부모창에 넣는 기능(지우지마)
function setAddress(address){
	console.log(address);

	document.querySelector("#m_postnum").value = address.postNum;
	document.querySelector("#m_address").value = address.address;
	document.querySelector("#m_detailed_address").value = address.detailedAddress;

}