<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../../resources/css/myShopping/myShoppingview.css">
<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/mypage.js" ></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<body>
<div id="wapper">
	
	<!-- header -->
	<jsp:include page="../../section/header.jsp"></jsp:include>
	
	<div id="content"> 
		<!-- contents -->
		<!-- 사이드 왼쪽  -->
		<jsp:include page="myShoppingSide_l.jsp"></jsp:include>
		
		<!-- 사이드 오른쪽 -->
		<jsp:include page="myShopping_contents.jsp"></jsp:include>
		
	</div>
	
	
	<!-- footer -->
	<jsp:include page="../../section/footer.jsp"></jsp:include>

</div>
</body>
</html>