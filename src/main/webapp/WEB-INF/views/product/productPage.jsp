<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/product/product.css">

	<div class="content">

            <div class="product">
                <div>
            		<c:choose>
            			<c:when test='${pageMaker.cri.type == ""}'>
            				<h1>전체 상품</h1>
            			</c:when>
            			<c:otherwise>
            				<c:forEach var="categoryList" items="${categoryList}">
            					<c:if test="${categoryList.category_no == pageMaker.cri.type}"><h1>${categoryList.category_name}</h1></c:if>
            				</c:forEach>
            			</c:otherwise>
            		
            		</c:choose>
            		
                    
                    
                    
                </div>
 
                        <div class="imgAll">
        					<c:set var="productListLength" value="${fn:length(productList)}"/>
        					<c:forEach var="productList" items="${productList}">
	        					<c:set var="i" value="${i+1}" />
	        					<c:if test="${i==1 || i == 5 || (i-5)%4 == 0}"> <div class="idx"> </c:if>
	                           		<div class="p_img" >
	                           			<a href="/product/product/pdDetailsCon_view?p_no=${productList.p_no}">
	                           			<img src="/upload/product/${productList.p_thumbnail}" style="max-width:100%; height:auto;">
	                           			<p id="productName">${productList.p_name}</p>
	                           			<p id="productPrice"><fmt:formatNumber value="${productList.p_price}" pattern="#,###"/> </p>
	                           			</a>
	                           		</div>
	                           		 
								<c:if test="${i % 4 == 0 || i == productListLength}"> </div> </c:if>
							</c:forEach>
                        </div>
                        
                      
					<!-- 페이징처리 -->
					
        <div class="pageInfo">
		
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.startPage -1}">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<c:choose>
			
					<c:when test="${num eq pageMaker.cri.pageNum}">
							<li id="selectNum">${num}</li>
					</c:when>
					<c:otherwise>
						<li><a href="${num}">${num}</a></li>
					</c:otherwise>
				
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li><a href="${pageMaker.endPage +1}">다음</a></li>
			</c:if>
			
		</div>

		
			<form method="get" class="moveForm">
					
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			</form>
           
    </div>
    
<script src="../../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../../resources/js/product/productPage.js"></script>

