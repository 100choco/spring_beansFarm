<%@page import="com.fasterxml.jackson.databind.deser.std.UUIDDeserializer"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="/product/product/pd_insert" method="post">
<%UUID uuid = UUID.randomUUID();%>
<input type="hidden" name="uuid" id="uuid" value="<%=uuid.toString()%>">
제품 : <input type="hidden" name="p_no" value="${p_no}">

<c:forEach var="productList" items="${productList}">
	<c:if test="${p_no == productList.p_no}">${productList.p_name}</c:if>
</c:forEach>

<br>

<input type="file" name="pd_image">

<br>

<input type="submit"  id="pdInsertBtn" value="제품 상세이미지 등록">
</form>


<script src="../../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../../resources/js/product/productDetailsUpload.js"></script>