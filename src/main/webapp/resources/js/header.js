$(function(){

	// 헤더 아이콘
	var m_id = $("#m_id").val();
	var m_name = $("#m_name").val();
	
	$("#search").click(function() {
	    $("#popup").fadeIn();
	    $(".realSearch").focus();
    });

	$("#search").click(function() {
		
    });

	$(".iBar").click(function() {
		alert("후기작성하러가기");
	});
	
	$("#logout").click(function() {
		if(confirm("로그아웃 하겠습니까?") == true) {
			
			
			$.ajax({
				url : '/logoutAjax',
				type : 'POST',
				data : {m_id:m_id, m_name:m_name},
				success : function(data) {
					alert(m_name + "님 안녕히 가세요");
					$(location).attr('href', '/');
				}
			})
			
			
		}else {
			return false;
		}


	});
	
	
	//검색기능
	$("#searchAction").click(function(){	
		
		var keyword = $(".realSearch").val(); 
		alert(keyword); 
		
		$.ajax({
				url : '/product/product_view',
				type : 'get',
				data : {keyword:keyword},
				success : function(data) {
					alert(data);
					
					$("#mainSF").attr("action", "/product/product_view");
       				$("#mainSF").submit();
					
				}
			})
		
	});
	
	$("head").append('<link rel="icon" type="image/x-icon" href="/resources/images/favicon.ico">');

});