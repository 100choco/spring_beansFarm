<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/product/pOption.css">
<script type="text/javascript"
	src="../../../../../resources/js/jquery-3.6.0.min.js"></script>


<!-- 카테고리 등록 -->
<form action="/product/category/category_insert" method="get">
	<input type="text" name="category_name"> <input type="submit"
		value="카테고리 작성" id="cateBtn">
</form>

<!-- 카테고리 수정 -->
<form action="/product/category/category_update" method="get">
		<select name="category_no">
			<c:forEach var="categoryList" items="${list}">
				<option value="${categoryList.category_no}">${categoryList.category_no}</option>
			</c:forEach>
		</select> 
		
		<input type="text" name="category_name"> 
		
		<input type="submit" value="수정하기" id="cateBtn">
</form>
<br>
<!-- 카테고리 목록(view)단 -->
<table border="1" id="optionsTbl">

	<tr>
		<td>번호</td>
		<td>카테고리명</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="categoryList" items="${list}">
		<tr>
			<td>${categoryList.category_no}</td>
			<td>${categoryList.category_name}</td>
			<!-- 카테고리 삭제 -->
			<td><a href="/product/category/category_delete?categoryNum=${categoryList.category_no}"><button id="cateBtn">삭제</button></a></td>
		</tr>
	</c:forEach>

	

</table>