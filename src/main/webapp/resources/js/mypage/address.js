window.onload = function(){
	$("#grad2").hide();
};



function addrMove(){
	let checkboxs = document.querySelectorAll('[name="RowCheck"]:checked');
	
	if(checkboxs.length != 1){
		alert("하나만 선택해주세요.");
		return;
	}

	// let parent = checkboxs[0].parentNode.parentNode;
	let parent = checkboxs[0].closest('tr');
	let move = parent.querySelector(".move");

	// let postNum = move.dataset.postnum;
	// let address = move.dataset.address;
	// let detailedAddress = move.dataset.detailedAddress;

	// console.log(postNum + address + detailedAddress);

    let address = {
        postNum: move.dataset.postnum,
        address: move.dataset.address,
        detailedAddress: move.dataset.detailedAddress
    };

	window.opener.setAddress(address);
    window.close();

}

// 회원수정 주소목록 페이징
$(function(){
		let moveForm = $('#moveForm');
			
		$(".pagination a").on("click", function(e){
 
	        e.preventDefault();
	        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	        moveForm.attr("action", "/myPageInfo/myPageInfo_addressManagePop");
	        moveForm.submit();
        
    	});
});

// 주소 값 넣기
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
             document.getElementById("postnum").value = data.zonecode; // 우편번호 넣기
             document.getElementById("address").value = data.address; // 주소 넣기
             document.querySelector("input[name=detailed_address]").focus(); //상세입력 포커싱
          }
      }).open();
}

// 체크박스
$(function() {

	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function() {
		var selected_listArr = $("input[name='RowCheck']");
		for (var i = 0; i < selected_listArr.length; i++) {
			selected_listArr[i].checked = this.checked;
		}
	});
	
	$("input[name='RowCheck']").click(function() {
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

// 주소삭제		
function select_Delete() {
	 var url = "/mypageviews/myPageInfo/deletePopUpAddress_List"; // Controller로 보내고자 하는 URL 
     var valueArr = new Array();
     var list = $("input[name='RowCheck']");
     for (var i = 0; i < list.length; i++) {
        if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
           valueArr.push(list[i].value);
        }
     }
     if (valueArr.length == 0) {
        alert("선택된 글이 없습니다.");
     } else {
        var chk = confirm("정말 삭제하시겠습니까?");
        
           if(chk == true){
           
           $.ajax({
              url : url, // 전송 URL
              type : 'POST', // GET or POST 방식
              traditional : true,
              data : {
                 valueArr : valueArr
              // 보내고자 하는 data 변수 설정
              },
              success : function(jdata) {
                 if (jdata = "deleteSuccess") {
                    alert("삭제 성공");
                    location.reload();
                    
                 } else {
                    alert("삭제 실패");
                 }
              }
           });
        }else{
           alert("취소되었습니다.");
        }
     }
  }

//주소 수정		
function select_update() {
	var selected_chk_arr = new Array();
	var selected_chk = $("input[name='RowCheck']");
	for (var i = 0; i < selected_chk.length; i++) {
		if(selected_chk[i].checked){
			selected_chk_arr.push(selected_chk[i].value);
		}
	}

	if(selected_chk_arr.length == 0){
		alert("선택된 글이 없습니다.")
	}else if(selected_chk_arr.length > 1){
		alert("1개만 선택해 주세요.")
	}else{
		$("#grad2").show();
		document.getElementById('addr_no').setAttribute( 'value', selected_chk_arr);
	}
	
}

// 주소 수정 창 숨김		
function divHide(){
	$("#grad2").hide();
}

         	