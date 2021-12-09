<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../resources/css/admin/adminview.css">

</head>
<body>
<div id="wapper">

	<!-- header -->
	<jsp:include page="../section/header.jsp"></jsp:include>
	
	<!-- contents -->
	<div id="content">
	
		<!-- 왼쪽 -->
		<jsp:include page="adminSide.jsp"></jsp:include>
		
		<!-- 오른쪽 -->
		<jsp:include page="adminMemberList.jsp"></jsp:include>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../section/footer.jsp"></jsp:include>
	
</div>
</body>
</html>