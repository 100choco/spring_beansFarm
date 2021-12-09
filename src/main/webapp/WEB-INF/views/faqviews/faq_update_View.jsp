<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../resources/css/community/noticeview.css">
<link rel="stylesheet" href="../../../resources/css/community/memberCenterCon.css">

</head>
<body>
<div id="wapper">
   
   <!-- header -->
   <jsp:include page="../section/header.jsp"></jsp:include>
   
   <div id="content"> 
      <!-- contents -->
      <!-- 사이드 왼쪽  -->
      <jsp:include page="faqSide_l.jsp"></jsp:include>
      
      <!-- 사이드 오른쪽 -->
      <jsp:include page="faq_Update_Contents.jsp"></jsp:include>
   </div>
   
   
   <!-- footer -->
   <jsp:include page="../section/footer.jsp"></jsp:include>

</div>
</body>
</html>