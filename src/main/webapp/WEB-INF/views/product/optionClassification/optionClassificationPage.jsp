<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/product/pOption.css">

<!-- 옵션분류 등록 -->
<form action="/product/optionClassification/optionClassification_insert" method="get">
	<input type="text" name="oc_name"> <input type="submit"	value="옵션분류 작성" id="ocBtn">
</form>

<!-- 옵션분류 수정 -->
<form action="/product/optionClassification/optionClassification_update" method="get">
		<select name="oc_no">
			<c:forEach var="ocList" items="${list}">
				<option value="${ocList.oc_no}">${ocList.oc_no}</option>
			</c:forEach>
		</select> 
		
		<input type="text" name="oc_name"> 
		
		<input type="submit" value="수정하기" id="ocBtn">
</form>
<br>
<!-- 옵션분류 목록(view)단 -->
<table border="1" id="optionsTbl">

	<tr>
		<td>번호</td>
		<td>분류명</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="ocList" items="${list}">
		<tr>
			<td>${ocList.oc_no}</td>
			<td>${ocList.oc_name}</td>
			<!-- 옵션분류 삭제 -->
			<td><a href="/product/optionClassification/optionClassification_delete?ocNum=${ocList.oc_no}"><button id="ocBtn">삭제</button></a></td>
		</tr>
	</c:forEach>

</table>

