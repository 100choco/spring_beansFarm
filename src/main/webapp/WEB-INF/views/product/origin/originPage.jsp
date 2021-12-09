<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/product/pOption.css">

<!-- 원산지 등록 form -->
<form action="/product/origin/origin_insert" method="get">
	<input type="text" name="origin_name"> <input type="submit"	value="원산지 작성" id="oriBtn">
</form>

<!-- 원산지 수정 form -->
<form action="/product/origin/origin_update" method="get">
		<select name="origin_no">
			<c:forEach var="originList" items="${list}">
				<option value="${originList.origin_no}">${originList.origin_no}</option>
			</c:forEach>
		</select> 
		
		<input type="text" name="origin_name"> 
		
		<input type="submit" value="수정하기" id="oriBtn">
</form>
<br>
<!-- 원산지 목록(view)단 -->
<table border="1" id="optionsTbl">

	<tr>
		<td>번호</td>
		<td>원산지명</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="originList" items="${list}">
		<tr>
			<td>${originList.origin_no}</td>
			<td>${originList.origin_name}</td>
			<!-- 원산지 삭제 -->
			<td><a href="/product/origin/origin_delete?originNum=${originList.origin_no}"><button id="oriBtn">삭제</button></a></td>
		</tr>
	</c:forEach>

</table>