<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- 제품등록 form -->
<form action="/product/product/product_insert" method="POST" >
	<!-- 제품 등록할 이미지에 중복방지를 위한 UUID -->
	<%UUID uuid = UUID.randomUUID();%>
	<input type="hidden" name="uuid" id="uuid" value="<%=uuid.toString()%>">
	<table>
		<tr>
			<td>카테고리 :</td>
			<td>
			<select name="category_no">
				<!-- forEach == 반복문 -->
				<c:forEach var="List" items="${categoryList}">
				<option value="${List.category_no}">${List.category_name}</option>
				</c:forEach>
				
			</select>
			</td>
		</tr>
		<tr>
			<td>제품이름 :</td>
			<td><input type="text" name="p_name"></td>
		</tr>
		<tr>
			<td>가격 :</td>
			<td><input type="number" name="p_price"></td>
		</tr>
		<tr>
			<td>제조사 :</td>
			<td><input type="text" name="p_manufacturer" value="원두 팜"></td>
		</tr>
		<tr>
			<!-- 등록했던 원산지 불러와서 선택하게 함 -->
			<td>원산지 :</td>
			<td>
			<select name="origin_no">
				<c:forEach var="List" items="${originList}">
					<option value="${List.origin_no}">${List.origin_name}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<!-- 이미지 업로드 -->
			<td><input type="file" name="p_image" ></td>
		</tr>
		<tr>
			<td><input type="submit" id="productInsertBtn" value="제품 등록"></td>
			<td><input type="button" value="전체목록" onclick="location.href='/adminviews/adminProductManage_view'"></td>
		</tr>


	</table>
</form>

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="../../../../resources/js/product/productUpload.js"></script>

