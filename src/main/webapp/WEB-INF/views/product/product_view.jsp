<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../resources/css/view.css">

</head>
<body>
<div id="wapper">
	<header>
		<!-- header -->
		<jsp:include page="../section/header.jsp"></jsp:include>
	</header>
	
	<div>
		<!-- contents -->
		<jsp:include page="productPage.jsp"></jsp:include>
	</div>
	
	<footer>
		<!-- footer -->
		<jsp:include page="../section/footer.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>