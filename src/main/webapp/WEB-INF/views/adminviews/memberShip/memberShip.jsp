<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/admin/memberShip.css">

<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/admin/memberShip/memberShip.js"></script>

	<div id="con2">
		<h1>회원 멤버쉽 관리</h1>
		
		<br><br><br>
		
        <table>
            <tr>
                <th>등급번호</th>
                <td><input type="text" name="membership_no" id="membership_no"></td>
            </tr>

            <tr>
                <th>등급이름</th>
                <td><input type="text" name="membership_name" id="membership_name"></td>
            </tr>

            <tr>
                <th>포인트율</th>
                <td><input type="text" name="point_ratio" id="point_ratio"></td>
            </tr>

            <tr>
                <th>관리</th>
                <td>
                    <button id="msInsertBtn">추가</button>
                    <button id="msUpdateBtn">수정</button>
                    <button id="msDeleteBtn">삭제</button>
                </td>
            </tr>
        </table>

        <br><br><br>

        <table>
            <tr>
                <th>등급번호</th>
                <th>등급이름</th>
                <th>포인트율</th>
                
            </tr>
            
			<c:forEach var="msList" items="${msList}">
            <tr>
            	
	                <td><input type="text" name="membership_no" id="membership_no" value="${msList.membership_no}"></td>
	                <td><input type="text" name="membership_name" id="membership_name" value="${msList.membership_name}"></td>
	                <td><input type="text" name="point_ratio" id="point_ratio" value="${msList.point_ratio}"></td>
            	
            </tr>
            </c:forEach>
        </table>
    </div>