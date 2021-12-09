<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../resources/css/community/notice/noticeUpdate.css">

</head>
<body>
<div id="con2">
	<h1>공지사항</h1>

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
	
	<!-- 여기서 부터 테이블(내용 부분) 시작 -->
    <br>
    
 
    <form action="/noticeviews/notice_updateForm" method="post">
			<c:forEach var="dto" items="${dto}">
			<input type="hidden" name="notice_no" value="${dto.notice_no}">
				  <div class="table-container" id="table-container">  
				<table id="updateTbl">
				
				<thead>
					<tr>
						<th width="15%">글번호</th>
						<th width="15%">고정여부</th>
						<th width="55%">제목</th>
						<th width="15%">작성자</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="15%" data-title="글 번호"><div class="text_aline">${dto.notice_no}</div></td>

						<!-- 고정 여부 수정됨(체크박스) ============================================== -->
						<td width="15%" data-title="고정 여부">
							<div class="text_aline">
                          		<input type="checkbox" value="n" id="notice_fix"<c:if test="${dto.notice_fix eq 'y'}">checked</c:if>>
		                    </div>
	                    </td>
	                    <!--  ================================================================= -->
	                    
						<td width="55%" data-title="제목"><input type="text" name="notice_title" id="notice_title" value="${dto.notice_title}" size="90%"></td>
						<td width="15%" data-title="작성자"><div class="text_aline">관리자</div></td>
					</tr>
				</tbody>	
					
					<tr>
						<td width="90%" colspan="4" style="padding: 0;">
						<textarea rows="20" style="width:100%" name="notice_content" 
						id="notice_content">${dto.notice_content}</textarea></td>
						
					</tr>
				</table>
				</div>
				
				<!-- 관리자 번호 숨김 -->
				<input type="hidden" name="manager_no" id="manager_no" value="${dto.manager_no}">
				
			</c:forEach>

			<div id="btnGroup">
				<input type="submit" value="수정하기" class="button2" id="upbtn">
				<button type="button" onclick="location.href='/noticeviews/notice_view'" class="button2" id="backbtn">돌아가기</button>
			</div>
	</form>

</div>
</body>
</html>