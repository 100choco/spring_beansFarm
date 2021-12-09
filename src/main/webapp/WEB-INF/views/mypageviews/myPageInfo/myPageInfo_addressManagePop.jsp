<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소목록</title>
<link rel="stylesheet" href="../../../../resources/css/myPageInfo/myPageInfo_addressManagePop.css">
<script src="../../../../resources/js/mypage/address.js"></script>
<script src="../../../../resources/js/member/daummapapi.js" ></script>
<!-- 제이쿼리cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>	
</head>
<body>

	<!-- 마이페이지 주소목록 팝업창 -->
	<div id="grad1">
		<i class="icon"><img src="../../../resources/images/logo/logo_icon.png" alt="m_logo" width="50" height="50"></i>주소 목록
	</div>
	<br>
	<br>
	
		<table>
			<thead>
				<tr>
					<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
					<th>배송지명</th>
					<th>수령인</th>
					<th>주소</th>
					<th>연락처</th>
				</tr>
			</thead>
			<tbody>		
				<c:forEach items="${listOne}" var="listOne">
					<tr>    
						<td class="checkbox"><input name="RowCheck" class="selectRow" type="checkbox" value="${listOne.addr_no}" /></td>
						<td><c:out value="${listOne.addr_nickname}"></c:out></td>
						<td><c:out value="${listOne.recipient_name}"></c:out></td>
						<td><a class="move" href='<c:out value="${listOne.m_no}"/>'
							data-postnum='<c:out value="${listOne.postnum}"/>'
							data-address='<c:out value="${listOne.address}"/>'
							data-detailed-address='<c:out value="${listOne.detailed_address}"/>'>
								<c:out value="${listOne.postnum}"></c:out> <c:out
									value="${listOne.address}"></c:out> <c:out
									value="${listOne.detailed_address}"></c:out>
							</a>
						</td>
						<td><c:out value="${listOne.recipient_phone}"></c:out></td>
					</tr>
				</c:forEach>			
			</tbody>
		</table>
		<br>
		<div id="btnCss">
			<input type="button" value="선택삭제" class="button button4" onclick="select_Delete()"> 
			<input type="button" value="주소선택추가" class="button button4" onclick="addrMove()">
			<input type="button" value="주소수정" class="button button4" onclick="select_update()">
		</div>

<%-- 	<!-- 페이지 이동 인터페이스 영역 -->
	<div class="center">
		<div class="pagination" id="pagination">
			<a href="${pageMaker.prev}">&laquo;</a>
			<c:if test="${pageMaker.prev}">
				<a href="/mypageviews/myPageInfo/myPageInfo_addressManagePop?pageNum=${pageMaker.startPage -1}">&laquo;</a>
				<!-- 이전버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
			</c:if>

			<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				 <a class="active" href='<c:url value="/mypageviews/myPageInfo/myPageInfo_addressManagePop?pageNum=${pageNum}"/>'>${pageNum}</a>
			</c:forEach>
			

			<c:if test="${pageMaker.next}">
				<a href="/mypageviews/myPageInfo/myPageInfo_addressManagePop?pageNum=${pageMaker.endPage +1}">&raquo;</a>
				<!-- 다음버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
			</c:if>
			<a href="${pageMaker.next}">&raquo;</a>
		</div>
	</div>

	<form method="get" id="moveForm">

		<!-- 엑션이 있어야지 값이 넘어가잖아 하지만 a태그를 눌렀을 때 액션이라는걸 추가해서 요 버튼을 눌렀을 때  -->
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">

	</form> --%>
	
	<br><br>
	
	<!-- 주소수정  -->
	<div id="grad2">
		<form action="/mypageviews/myPageInfo/address_update" method="post">
			
			<button type="button" id="addressFindBtn" class="button button4" onclick="postcode()">우편번호찾기</button>
			<br> <br>
			
		<table>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="postnum" id="postnum"></td>
			</tr>
				
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address" size="50"></td>	
			</tr>
			
			<tr>
				<td>상세 주소</td>
				<td><input type="text" name="detailed_address" id="detailed_address" size="50"></td>
			</tr>
			
		</table>
		
		<input type="hidden" name="addr_no" id="addr_no">
		<br>
		<div id="updateBtnCss">
			<input type="submit" class="button button4" value="수정하기">
			<button type="button" class="button button4" onclick="divHide()">돌아가기</button>
		</div>
	</form>
	</div>
	
<script>
//체크박스
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

</script>
</body>
</html>