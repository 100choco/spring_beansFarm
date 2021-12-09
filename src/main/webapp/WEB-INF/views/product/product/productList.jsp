<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../../resources/css/product/productCRUD.css">
<br>
<div id="insertSearch">
	
	<!-- 검색기능 -->
	<div class="p_searchBox">
	    
	    <select name="type" id="type">
	    	<option value ="c_id" <c:out value="${pageMaker.cri.type eq 'c_id'?'selected':''}" />>카테고리명</option>
	    	<option value ="pname_id" <c:out value="${pageMaker.cri.type eq 'pname_id'?'selected':''}" />>제품이름</option>
	    	<option value ="ori_id" <c:out value="${pageMaker.cri.type eq 'ori_id'?'selected':''}" />>원산지</option>
	    </select>
	    <input type="text" name="keyword" id="keyword" placeholder="검색할 내용을 입력하세요"
	    		value="${pageMaker.cri.keyword }">
	    <button id="p_searchBtn">검색</button>
	    <!-- 검색이후 전체보기 돌아가기 -->
	    <c:if test="${pageMaker.cri.keyword != null}">
	    	<button id="fullList" onclick="location.href='/adminviews/adminProductManage_view'">전체목록</button>
	    </c:if>
	</div>
	<div class="pInsert">
		<a href="/product/product/product_insert_form"><button id="proBtn">제품등록</button></a>
	</div>
	<!-- 데이터 히든으로 숨기고 값넘기기 -->
	<form method="get" class="moveForm">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
</div><br><br>
<!-- view단에 보여줄 table -->
<table border="1" id="produtTbl">
	<tr>
		<td>제품번호</td>
		<td>카테고리번호</td>
		<td>제품이름</td>
		<td>판매가격</td>
		<td>제조사</td>
		<td>원산지번호</td>
		<td>제품이미지</td>
		<td>수정</td>
		<td>삭제</td>
		<td>상세이미지</td>
		<td>제품상세수정</td>
		<td>제품상세삭제</td>
		<td>리스트 등록여부</td>
	</tr>
	<!-- model의 name 값을 items 에서 사용 var 에서 "list"로 지정 이후 $list.로 값을 불러옴 -->
	<c:forEach var="List" items="${productList}">
		<tr>
			<td>${List.p_no}</td>
			<td>${List.category_no}
				<c:forEach var="cList" items="${categoryList}">
					<!-- (ProductDTO의 c_no == category의 c_no면 c_no옆에 (c_name 출력)) -->
					<c:if test="${List.category_no == cList.category_no}">(${cList.category_name})</c:if>
				</c:forEach>
			</td>
			<td>${List.p_name}</td>
			<td>${List.p_price}</td>
			<td>${List.p_manufacturer}</td>
			<td>${List.origin_no}
			<!-- model의 name 값을 items 에서 사용 var 에서 "oList"로 지정 이후 $oList.로 값을 불러옴 -->
			<c:forEach var="oList" items="${originList}">
				<!-- (ProductDTO의 o_no == origin의 o_no면 c_no옆에 (o_name 출력)) -->
				<c:if test="${List.origin_no == oList.origin_no}">(${oList.origin_name})</c:if>
			</c:forEach>
			</td>
			<td><img src="/upload/product/${List.p_thumbnail}"></td>
			<td>
				<!-- 제품 수정 -->
				<form action="/product/product/product_update_form" method="post">
					<input type="hidden" value="${List.p_no}" name="p_no"> 
					<input type="submit" value="수정" id="proBtn2">
				</form>
			</td>
			<td>
				<!-- 제품 삭제 -->
				<form action="/product/product/product_delete" method="post">
					<!-- productDTO list에 저장한 값 불러오기 -->
					<input type="hidden" value="${List.p_no}" name="p_no"> 
					<input type="hidden" value="${List.p_image}" name="p_image"> 
					<input type="hidden" value="${List.p_thumbnail}" name="p_thumbnail"> 
					<!-- 상세이미지도 불러와서 삭제 -->
					<!-- model의 name 값을 items 에서 사용 var 에서 "oList"로 지정 이후 $oList.로 값을 불러옴 --> 
					<c:forEach var="pdList" items="${pdList}">
						<!-- 상세이미지가 있을경우와 없을 경우 이미지 삭제 -->
						<c:choose>
							<c:when test="${pdList.p_no == List.p_no}">
								<input type="hidden" value="${pdList.pd_image}" name="pd_image">
							</c:when>
							<c:otherwise>
								<input type="hidden" value="" name="pd_image">
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					<input type="submit" value="삭제" id="proBtn2">
				</form>
			
			</td>

<!-- =====================================제품상세============================================================= -->


			<!-- 상세이미지 -->
			<td id="pdImg">
			<!-- c:set JSTL을 활용한 변수 설정 (var == 변수명, value == 값 입력과 EL사용 가능)-->
			<c:set var="pdInsertCheck" value="false"></c:set>
				<!-- ProductDetail의 list 값 불러옴 -->
				<c:forEach var="pdList" items="${pdList}">
					<!-- ProductDetail의 p_no와 product의 p_no가 같다면 이미지출력 -->
					<c:if test="${pdList.p_no == List.p_no}">
						<img src="/upload/pd/${pdList.pd_image}">
						<c:set var="pdInsertCheck" value="true"></c:set>
					</c:if>
				</c:forEach>
				<!-- 상세이미지가 없다면 상세페이지 등록을 보이게함 -->
				<c:if test="${pdInsertCheck eq false}">
					<a href="/product/product/pd_insert_form?p_no=${List.p_no}"><button>상세페이지등록</button></a>
				</c:if>
				
			</td>
			<td>
				<c:forEach var="pdList" items="${pdList}">
					<!-- ProductDetail의 p_no와 product의 p_no가 같다면 -->
					<c:if test="${pdList.p_no == List.p_no}">
						<!-- 제품상세수정 생성 -->
						<form action="/product/product/product_details_update_form" method="post">
							<!-- 수정할 번호 값 가져오기 -->
							<input type="hidden" value="${pdList.p_no}" name="p_no">
							<input type="submit" value="수정" id="proBtn3">
						</form>
					</c:if>
				</c:forEach>
			</td>
			<td>
				<c:forEach var="pdList" items="${pdList}">
					<!-- ProductDetail의 p_no와 product의 p_no가 같다면 -->
					<c:if test="${pdList.p_no == List.p_no}">
						<!-- 제품상세삭제 form 실행 -->
						<form method="post" action="/product/product/product_details_delete">
							<!-- 삭제할 번호와 이미지 값 가져오기 -->
							<input type="hidden" value="${pdList.p_no}" name="p_no">
							<input type="hidden" value="${pdList.pd_image}" name="pd_image">
							<input type="submit" value="삭제" id="proBtn3">
						</form>
					</c:if>
				</c:forEach>
			</td>
			<td>
				<!-- 리스트 등록 여부 -->
				<c:set var="doneLoop" value="false"></c:set> 
				<c:set var="regCheck" value="false"></c:set> 
				<c:forEach var="pdList" items="${pdList}">
					<c:if test="${not doneLoop}">
						<c:if test="${pdList.p_no == List.p_no}">
							<!-- c:set 태그는 EL에서 사용되어질 수 있는 Bean, Map등에 값을 설정을 하거나, 일반 변수를 생성해서 값을 할당
  							value 속성 : 값을 입력, EL을 사용할 수 있습니다.
							var 속성 : 값이 저장되는 변수명. -->
							<c:set var="regCheck" value="true"></c:set>
							<c:set var="doneLoop" value="true"></c:set>
						</c:if>
					</c:if>
				</c:forEach> <c:if test="${regCheck eq true}">
					<p>등록</p>
				</c:if> <c:if test="${regCheck eq false}">
					<p>미등록</p>
				</c:if>
			</td>

		</tr>
	</c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function () {
		
		/* 검색시스템 함수 */
		$("#p_searchBtn").on("click", function(e) {
			e.preventDefault();
			
			var moveForm = $(".moveForm");
			
			let type = $(".p_searchBox select").val();
			let keyword = $("input[name='keyword']").val();
			
			
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
			moveForm.attr("action", "/adminviews/adminProductManage_view");
			moveForm.submit();
		});
		
		$()
		
	});
</script>

