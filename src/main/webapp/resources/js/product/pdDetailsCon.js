$(function(){
	
		//3단 분리
	    var tabList = document.querySelectorAll('.tab_list_wrap .tab_list')
	
			Array.prototype.forEach.call(tabList, function(list) {
			list.children[0].addEventListener('click', function(e) {
				
			e.preventDefault()
		
			var tabContent = document.querySelectorAll('.tab_container .tab_content')
			var tabNum = this.parentElement.getAttribute('data-tabnum')
			Array.prototype.forEach.call(tabContent, function(cont, i) {
				
				cont.style.display = 'none'
				tabList[i].className = 'tab_list'
			})
		
			tabContent[tabNum].style.display = 'block'
		
			if(list.className.indexOf('tab_active') == -1) {
			list.className = 'tab_list tab_active'
			}
			})
		})
		
		//리뷰 페이징
		var moveForm = $(".moveForm");
		var testNum = $("#test").val();
		$("#ttt").attr("value", testNum);
				
				$(".pageInfo a").on("click", function(e) {
							alert("a");
							e.preventDefault(); // 기본 이벤트 막기
							moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
							moveForm.attr("action", "/product/product_details/pdDetailsCon_view");
							moveForm.submit();
	
						})
		
		
		
		
		
		
		
		//모달창 만들기
		const modal = document.querySelector('.modal'); 
		const btnOpenPopup = document.querySelector('.btn-open-popup'); 
		btnOpenPopup.addEventListener('click', function(){ 
			
			if(orderChk() == true){
			
			var m_no = $("#m_no").val();
			var p_no = $("#p_no").val();
			var op_no1 = $("#op_no1").val();
			var option_quantity1 = $("#option_quantity1").val();
			var op_no2 = $("#op_no2").val();
			var order_price = $("#order_price").val();
		
					
			$.ajax({
				url : '/cartviews/goToCart',
				type : 'POST',
				dataType : 'json',
				data : {m_no:m_no, 
						p_no:p_no,
						op_no1:op_no1,
						option_quantity1:option_quantity1,
						op_no2:op_no2,
						order_price:order_price
						},
				success : function(data) {
				
					
				}
				
			})
			
			modal.style.display = 'block';
			 
				
				
				
				
			}
			
			
			
			});
		
		$(".modal").draggable();
		
		$('#yes').on("click",function(){
			location.href="/cartviews/cart_view";
		});
		
		$('#no').on("click",function(){
			location.reload();
		});
		
		// 체크
		function orderChk() {
		if($("#m_no").val() == ""){
			alert("로그인 해주세요.");
			return false;
		}else if($("#op_no1").val() == ""){
			alert("용량을 선택해주세요.");
			return false;
		}else if($("#op_no2").val() == ""){
			alert("분쇄를 선택해주세요.");
			return false;
		}else{
			return true;
		}
	}		
	
	
 
		
  
});