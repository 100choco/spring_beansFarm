<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/mycucu/mycucuCenterCon.css">
<script src="../../../../resources/js/myCucu.js" ></script>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy.MM.dd" /></c:set>



     <div id="con2">
         <h1>내 쿠폰</h1>

         <br>

         <br><br>
         <div id="myShoppingListForm">
         
             <table class="mypageTabel">
             
                 <tr>
                 
                     <th width="10%" colspan="2">쿠폰번호</th>
                     <th width="40%">쿠폰명</th>
                     <th width="15%">할인율</th>
                     <th width="20%" colspan="2">유효기간</th>
                     
                 </tr>
                 
                 
                 <c:forEach var="couponlistOne" items="${couponlistOne}">
                 <c:set var="c_expiration_date"><fmt:formatDate value="${couponlistOne.c_expiration_date}" pattern="yyyy.MM.dd" /></c:set>
                 <c:if test="${c_expiration_date > date}"> 
                 <tr class="mypageTableHo">
                     <td width="10%" colspan="2">${couponlistOne.c_no}</td>
                     <td width="40%">${couponlistOne.c_name}</td>
                     <td width="15%">${couponlistOne.c_discount}%</td>
                     <td width="20%" colspan="2">
                     
                     
	                     <fmt:formatDate value="${couponlistOne.c_reg_date}" type="both" pattern="yyyy. MM. dd" />
	                      ~ 
	                     <fmt:formatDate value="${couponlistOne.c_expiration_date}" type="both" pattern="yyyy. MM. dd" />
                     </td>
                 </tr>
                 </c:if>
                 </c:forEach>
                 

             </table>
             
             
         </div>

         

     </div>