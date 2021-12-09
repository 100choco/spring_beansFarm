<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 제품상세 수정 form -->
<form action="/product/product/product_details_update" method="post">
	<!-- 수정할 이미지에 중복방지를 위한 UUID -->
	<%UUID uuid = UUID.randomUUID();%>
	<input type="hidden" name="uuid" id="uuid" value="<%=uuid.toString()%>">
	제품 : <input type="hidden" value="${pdDTO.p_no}" name="p_no"> ${productDTO.p_name} <br>
	<input type="file" name="pd_image"> <br>
	<input type="submit" value="수정하기" id="pdInsertBtn">
	<input type="button" value="전체목록" onclick="location.href='/adminviews/adminProductManage_view'">
</form>

<script src="../../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../../resources/js/product/productDetailsUpload.js"></script>