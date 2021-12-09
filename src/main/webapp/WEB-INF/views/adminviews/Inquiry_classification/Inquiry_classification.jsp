<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/admin/inquiry_classification.css">


<div id="con2">

		<h1>문의 분류 관리</h1>
		
		
	<div id="list">

	
	<!-- 문의 분류 리스트 -->
	
	<h4>문의 분류 리스트 출력</h4>
	<select name="Inquiry_classification" id="Inquiry_classification">
		<c:forEach var="dto" items="${dto}">
			<option value="${dto.ic_no}">${dto.ic_name}</option>
		</c:forEach>
	</select>
	</div>
	
	<br><br>
	<!-- 문의 분류 추가	 -->
	<div id="insert">
	<h4>문의 분류 추가</h4>
	<form action="/qnaviews/Inquiry_insert" method="get">
		문의분류 번호 : <input type="number" name="ic_no">
		
		<br>
		
		문의분류 이름 : <input type="text" name="ic_name">
		
		<br>
		
		<input type="submit" value="추가하기">
	
	</form>
	</div>
	
	<br><br>
	<!--  문의 분류 수정 -->
	<div id="update">
	<h4>문의 분류 수정</h4>
 	<form action="/qnaviews/Inquiry_update" method="get">
		
		
		문의분류 번호 :
		
		<select name="ic_no">
			<c:forEach var="dto" items="${dto}">
				<option value="${dto.ic_no}">${dto.ic_no}</option>
			</c:forEach>
		</select>
		
		<br>
		
		문의분류 이름 : <input type="text" name="ic_name">
		
		<br>
		
		<input type="submit" value="수정 하기">
		
	</form>

	</div>

	<br><br>
	<!-- 문의 분류 삭제	 -->
	<div id="delete">
		<h4>문의 분류 삭제</h4>
			<table>
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>버튼</td>
					</tr>
				<c:forEach var="dto" items="${dto}">	
					<tr>
						<td>${dto.ic_no}</td>
						<td>${dto.ic_name}</td>
						<td>
						<button type="button" onclick="location.href='/qnaviews/Inquiry_delete?ic_no=${dto.ic_no}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
</div>