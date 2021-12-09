<%@page import="com.fasterxml.jackson.databind.deser.std.UUIDDeserializer"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!-- 제품 수정(form) -->
<form action="/product/product/product_update" method="post">
	<!-- 상세 이미지에 중복방지를 위한 UUID -->
	<%UUID uuid = UUID.randomUUID();%>
	<input type="hidden" name="uuid" id="uuid" value="<%=uuid.toString()%>">
	<table>
		<tr>
			<td>제품번호</td>
			<td>${productDto.p_no}<input type="hidden" name="p_no" value="${productDto.p_no}"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><select name="category_no">
					<c:forEach var="list" items="${categoryList}">
						<option value="${list.category_no}"
							<c:if test="${list.category_no == productDto.category_no}">selected</c:if>>
							${list.category_name}
						</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>제품이름</td>
			<td><input type="text" name="p_name"
				value="${productDto.p_name}"></td>
		</tr>
		<tr>
			<td>판매가격</td>
			<td><input type="number" name="p_price"
				value="${productDto.p_price}"></td>
		</tr>
		<tr>
			<td>제조사</td>
			<td><input type="text" name="p_manufacturer"
				value="${productDto.p_manufacturer}"></td>
		</tr>
		<tr>
			<td>원산지</td>
			<td><select name="origin_no">
					<c:forEach var="list" items="${originList}">
						<option value="${list.origin_no}"
							<c:if test="${list.origin_no == productDto.origin_no}">selected</c:if>>
							${list.origin_name}
						</option>

					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><input type="file" name="p_image"></td>
		</tr>
		<tr>
			<td><input type="submit" id="productInsertBtn" value="제품 수정"></td>
			<td><input type="button" value="전체목록" onclick="location.href='/adminviews/adminProductManage_view'"></td>
		</tr>
		

	</table>
</form>

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="../../../../resources/js/product/productUpload.js"></script>

