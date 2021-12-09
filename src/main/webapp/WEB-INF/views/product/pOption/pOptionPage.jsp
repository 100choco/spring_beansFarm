<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/product/pOption.css">

<div id="opInsetUpdateBox">
	<!-- 옵션 등록 파트 -->
	<div id="opInsert">
		<form action="/product/pOption/op_insert" method="get">
			<table>
				<tr>
					<td>옵션명 :</td>
					<td><input type="text" name="op_name"></td>
				</tr>
				<tr>
				<td>제품 :</td>
				<td>
					<select name="p_no">
						<c:forEach var="List" items="${productList}">
							<option value="${List.p_no}">${List.p_name}</option>
						</c:forEach>
					</select>
				</td>
				</tr>
				<tr>
					<td>가격 :</td>
					<td><input type="number" name="op_price"></td>
				</tr>
				<tr>
					<td>재고 :</td>
					<td><input type="number" name="op_stock"></td>
				</tr>
				<tr>
					<td>옵션분류 :</td>
					<td><select name="oc_no">
							<c:forEach var="ocList" items="${ocList}">
								<option value="${ocList.oc_no}">${ocList.oc_name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="옵션 생성" id="pOpBtn"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 옵션 수정 파트 -->
	<div id="opUpdate">
		<form action="/product/pOption/op_update" method="get">
			<table>
				<tr>
					<td>번호 :</td>
					<td>
						<select name="op_no">
							<c:forEach var="opList" items="${opList}">
							<option value="${opList.op_no}">${opList.op_no}</option>
							</c:forEach>
						</select>

					</td>
				</tr>
				<tr>
					<td>옵션명 :</td>
					<td><input type="text" name="op_name"></td>
				</tr>
				<tr>
					<td>가격 :</td>
					<td><input type="number" name="op_price"></td>
				</tr>
				<tr>
					<td>재고 :</td>
					<td><input type="number" name="op_stock"></td>
				</tr>
				<tr>
					<td>옵션분류 :</td>
					<td>
						<select name="oc_no">
							<c:forEach var="ocList" items="${ocList}">
								<option value="${ocList.oc_no}">
									${ocList.oc_name}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
					<input type="submit" value="수정하기" id="pOpBtn">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<br><br>


<!-- 옵션 목록(view)단 -->
<table border="1" id="optionsTbl">
	<tr>
		<td width="3%">번호</td>
		<td width="5%">제품번호</td>
		<td width="10%">옵션명</td>
		<td width="10%">가격</td>
		<td width="5%">재고수</td>
		<td width="5%">분류번호</td>
		<td width="3%">삭제</td>
	</tr>
	<c:forEach var="opList" items="${opList}">
		<tr>
			<td>${opList.op_no}</td>
			<td>${opList.p_no}</td>
			<td>${opList.op_name}</td>
			<td>${opList.op_price}</td>
			<td>${opList.op_stock}</td>
			<td>${opList.oc_no}</td>
			<!-- 옵션 삭제 -->
			<td><a href="/product/pOption/op_delete?op_no=${opList.op_no}"><button id="pOpBtn">삭제</button></a></td>
		</tr>
	</c:forEach>
</table>