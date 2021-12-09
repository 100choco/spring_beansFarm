<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="../../../resources/css/community/faq/faqinfoInquiry.css">
	<div id="con2">
		<h1>FAQ 상세보기</h1>
	
		<br>
	
		<div id="menu_m">
			<ul>
				<li class="notice"><a href="/noticeviews/notice_view">공지사항</a></li>

                       <!-- 미 로그인시 qna 접근제어(로그인화면으로) -->
                       <c:choose>
                        	<c:when test="${adminID ne null && userID eq null}">
				               	<li><a href="/qnaviews/qna_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
				            
				            <c:when test="${adminID eq null && userID ne null}">
				               	<li><a href="/qnaviews/qna_user_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
         
                        	<c:otherwise>
	                        	<li class="qna"><a href="/memberloginviews/memberLogin_view">1:1문의하기(Q&A)</a></li>
	                        </c:otherwise>
                        </c:choose>

				<li class="faq"><a href="/faqviews/faq_view">FAQ</a></li>
			</ul>
		</div>

	
		<br> 
		
		<div class="table-container">
		
		<table id="noticeTbl">
		

			<tr>
				<th width="20%">제목</th>
				<td width="80%"><input name="faq_title" id="faq_title" readonly="readonly" value='<c:out value="${fdto.faq_title}"/>'></td>
			</tr>

			<tr>
				<td colspan="2" width="100%" id="faq_content">${fdto.faq_content}</td>
			</tr>

		</table>
		</div>
	
		<div id="btnGroup">
			<button type="button" class="button2" id="list_btn">목록 페이지</button> <button type="button" class="button2" id="modify_btn">수정하기</button>
		</div>
	
	
		<form id="infoForm" action="/faq_updateForm" method="get">
			<input type="hidden" id="faq_no" name="faq_no" value='<c:out value="${fdto.faq_no}"/>'>
		</form>
	
	</div>

<script>
	var form = $("#infoForm");

	$("#list_btn").on("click", function(e) {
		form.find("#faq_no").remove();
		form.attr("action", "/faqviews/faq_view");
		form.submit();
	});

	$("#modify_btn").on("click", function(e) {
		form.attr("action", "/faqviews/faq_update_View");
		form.submit();
	});
</script>