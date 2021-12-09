<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Beans Farm insert view</title>
<link rel="stylesheet" href="../../../resources/css/community/noticeview.css">

</head>
<body>
<div id="wapper">
	
	<!-- header -->
	<jsp:include page="../section/header.jsp"></jsp:include>
	
	<div id="content"> 
		<!-- contents -->
		<!-- 사이드 왼쪽  -->
		<jsp:include page="noticeSide_l.jsp"></jsp:include>
		
		<!-- 사이드 오른쪽 -->
		<jsp:include page="notice_insertContent.jsp"></jsp:include>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="../section/footer.jsp"></jsp:include>

</div>
</body>
</html>