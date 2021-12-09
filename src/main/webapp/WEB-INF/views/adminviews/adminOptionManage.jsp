<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/productManage.css">

	<div id="con2">
		
		<div class="opDetail">
			<br><br><h1>세부옵션</h1> <br><br>
			<div>
				<h3>카테고리</h3> 
				<!-- 컨트롤러에서 import하면됨 jsp로 하면 데이터는 안날라감 -->
				<c:import url="/product/category/category_insert_form"></c:import>
			</div>
			<div>
				<h3>원산지</h3> 
				<c:import url="/product/origin/origin_insert_form"></c:import>    
			</div>
			<div>
				<h4 style="color: red ">옵션1, 옵션2 용량 분쇄로 <br>반드시 고정</h4> 
				<h3>옵션분류</h3>
				<c:import url="/product/optionClassification/optionClassification_insert_form"></c:import>
			</div> 
		</div>
			    
		<div class="pOption">
			<br><br><h1>통합옵션</h1> <br><br>
			<h3>제품옵션</h3>
			<c:import url="/product/pOption/op_insert_form"></c:import>
		</div>
	                    
	</div>
