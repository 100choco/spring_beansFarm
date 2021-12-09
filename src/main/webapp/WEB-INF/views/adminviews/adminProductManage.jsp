<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/productManage.css">

		
		<div id="con2">
		
			<div>
				<br>
				<h1>제품관리</h1><br>
				<div>
					<!-- 컨트롤러에서 import하면됨 jsp로 하면 데이터는 안날라감 -->
					<!-- redirect부분 url입력하면 됨 -->
					<c:import url="/product/product/product_list"></c:import>
				</div>
			</div>	
		</div>