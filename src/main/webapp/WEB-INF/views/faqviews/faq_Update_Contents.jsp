<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/faq/faqUpdate.css">

<div id="con2">
	<h1>FAQ수정 페이지</h1>

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

	<form id="modifyForm" action="/faqviews/faq_modify" method="post">
		
		<div class="table-container" id="table-container">
		<table id="noticeTbl">
		
			<thead class="bg-light">
				<tr>
					<th width="15%" id="faq_no_width">번호</th>
					<th width="85%">제목</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td width="15%" data-title="번호"><input type="text" id="faq_no" name="faq_no" readonly="readonly" size="" value='<c:out value="${fdto.faq_no}"/>'></td>
					<td width="85%" data-title="제목"><input type="text" id="faq_title" name="faq_title" size="74%" value='<c:out value="${fdto.faq_title}"/>'></td>
				</tr>
			</tbody>
			
				<tr>
					<td width="100%" colspan="2" style="padding: 0;"><textarea rows="20" style="width:95%" id="faq_content" name="faq_content"><c:out value="${fdto.faq_content}" /></textarea></td>
				</tr>

		</table>
		</div>
		
		
		<div id="btnGroup">
			<button type="button" class="button2" id="list_btn">목록 페이지</button> 
			<button type="button" class="button2" id="modify_btn">수정 완료</button> 
			<button type="button" class="button2" id="delete_btn">글 삭제</button>
		</div>
	</form>
	
	<form id="infoForm" action="/faq_modify" method="get">
		<input type="hidden" id="faq_no" name="faq_no" value='<c:out value="${fdto.faq_no}"/>'>
	</form>

</div>


<script>
	let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e) {
		form.find("#faq_no").remove();
		form.attr("action", "/faqviews/faq_view");
		form.submit();
	});

	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e) {
		mForm.submit();
	});

	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e) {
		form.attr("action", "/faqviews/faq_delete");
		form.attr("method", "GET");
		form.submit();
	});
</script>