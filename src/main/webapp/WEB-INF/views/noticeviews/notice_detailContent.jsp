<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Farm 원두 팜</title>
<link rel="stylesheet" href="../../../resources/css/community/notice/noticeDetail.css">
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


    <br><br>
    <c:forEach var="noticeList" items="${noticeList}">
	<div class="table-container" id="table-container">
		
			<table id="detailTbl">
			
			<thead>
				<tr>
					<td width="15%">작성자</td>
					<td width="62%">제목</td>
					<td width="8%">조회</td>
					<td width="15%">날짜</td>
				</tr>
			</thead>
				
			<tbody>	
				<tr>
					<td data-title="작성자">${noticeList.manager_no}</td>
					<td data-title="제목">${noticeList.notice_title}</td>
					<td data-title="조회">${noticeList.notice_view_count}</td>
					<td data-title="날짜"><fmt:formatDate value="${noticeList.notice_reg_date}" pattern="yyyy/MM/dd"/></td>
				</tr>
			</tbody>

				<tr>
					<td colspan="4" class="noticeDetail" style="padding: 0;"><div id="noticeDetail_div">${noticeList.notice_content}</div></td>
				</tr>

			</table>
				</div>
			
			
			<div id="btnGroup">
			<c:if test= "${adminID ne null}">
				<button type="button" onclick="location.href='/noticeviews/notice_updateView?notice_no=${noticeList.notice_no}'" class="button2" id="upbtn">수정하기</button>
				<button type="button" onclick="location.href='/noticeviews/notice_delete?notice_no=${noticeList.notice_no}'" class="button2" id="delbtn">삭제하기</button>
			</c:if>
				<button type="button" onclick="location.href='/noticeviews/notice_view'" class="button2" id="backbtn">돌아가기</button>
			</div>
			
			
		</c:forEach>

</div>


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
$(function() {
	
	/* 조회수 새로고침을 위한 함수 (안쓰면 조회수가 안올라감-새로고침 하여야 올라감) */
	var thisUrl = location.href;
	
	
	/* 끝자리를 비교하여 #이 아니라면 reload시켜서 조회수 증가 */
	if(thisUrl.substring(thisUrl.length - 1, thisUrl.length) != '#'){
		$(location).attr('href', thisUrl + '#');
		location.reload();
	}

	
	
})
</script>

</body>
</html>

