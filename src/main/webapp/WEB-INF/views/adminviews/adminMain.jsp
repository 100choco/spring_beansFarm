<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/adminMain.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/admin/adminMemberList.js" ></script>

	<div id="con2">
		
		<div class="order">
		<br><br>
			<h1>제품주문</h1>
		</div>
		
			    
		<div class="member">
		<br><br>
			<h1>회원관리</h1>
			
			<br><br><br>
			
			<table id="adminTbl">
				<tr>
					<th width="15%">번호</th>
					<th width="20%">아이디</th>
					<th width="20%">닉네임</th>
					<th width="20%">등급</th>
					<th width="25%">가입일</th>
				</tr>
				
				<c:forEach var="memberList" items="${memberList}">
				<tr>
					<td>${memberList.m_no}</td>
					<td>${memberList.m_id}</td>
					<td>${memberList.m_name}</td>
					<td>${memberList.membership_name}</td>
					<td><fmt:formatDate value="${memberList.m_reg_date}" type="both" pattern="yyyy. MM. dd" /></td>
				</tr>
				</c:forEach>
			</table>
			
			<br><br>
			
			<!-- 페이징처리 -->
	        <div class="pageInfo">
			
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage -1}">이전</a></li>
				</c:if>
				
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li><a href="${num}">${num}</a></li>
				</c:forEach>
				
				
				<c:if test="${pageMaker.next}">
					<li><a href="${pageMaker.endPage +1}">다음</a></li>
				</c:if>
				
			</div>
			
			
			
			<form method="get" class="moveForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			</form>
			
		</div>
		
		
	                    
	</div>
