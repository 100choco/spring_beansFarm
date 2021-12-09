<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/mypage/myPageInfoPW.js" ></script>
<div>
       <p>비밀번호를 입력해주세요</p>
       <c:forEach var="listOne" items="${listOne}">
       <table>
           <tr>
               <td><span>PW</span></td>
               
               <td>
               		<input type="hidden" name="m_id" id="m_id" value="${listOne.m_id}">
               		<input type="password" name="m_pw" id="m_pw">
               </td>
               <td rowspan="2"><button id="pwchk">확인</button></td>
           </tr>

       </table>
       </c:forEach>
   </div>