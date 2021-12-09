<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../../resources/css/view.css">
<link rel="stylesheet" href="../../../../resources/css/mypage/reviewWriteForm.css">
<script src="../../../../resources/js/header.js" ></script>

</head>
<body>
<div id="wapper">
	
	<!-- header -->
	<jsp:include page="../../section/header.jsp"></jsp:include>
	
	<div id="content">
	
	<jsp:include page="myReviewSide_l.jsp"></jsp:include>
	
	<jsp:include page="review_contents.jsp"></jsp:include>
	
	</div>
	
	<!-- footer -->
	<jsp:include page="../../section/footer.jsp"></jsp:include>

</div>
</body>
</html>