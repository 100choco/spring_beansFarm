<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/notice/noticeContent.css">

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

	<!-- 검색 추가 -->
	
	<div class="searchBox">
            <select name="type" id="type">
                <option value="T" <c:out value="${pageMakger.cri.type eq 'T'?'selected':''}"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
            </select>
            <input type="text" name="keyword" id="keyword" placeholder="검색할 내용을 입력하세요" 
            		value="${pageMaker.cri.keyword}" size="50%">
            <button id="searchBtn">검색</button>
        </div>
        
        
	

	<br><br><br>

	<!-- 글쓰기 버튼 css 생성 -->
	<c:if test= "${adminID ne null}">
		<a href="/noticeviews/notice_insertView"><button id="writeBtn" class="button2">글쓰기</button></a>
	</c:if>

	
<div class="table-container" id="table-container">

		<form action="" method="post">
			<table id="noticeTbl" class="noticeTbl">
				
				<thead>
					<tr id="noti_th">
						<th width="10%">번호</th>
						<th width="18%">작성자</th>
						<th width="52%">제목</th>
						<th width="10%">날짜</th>
						<th width="5%">조회</th>
					</tr>
				</thead>
				
				<tbody>
				<!-- 글 내용 나타나야하는 공간 -->
				<!-- 상단 고정  -->
				<c:forEach var="fixList" items="${fixList}">
				<!-- notice_fix의 값이 y값 일떄만 고정 -->
				<c:if test="${fixList.notice_fix eq 'y'}">
					<tr id="fixTbltr" class="fixTbltr">
						<td data-title="공지" class="hide_td">공지</td>
						<td data-title="작성자" class="hide_td">관리자</td>
						<td class="txtShort" data-title="제목" >
							<a href="/noticeviews/notice_detail?notice_no=${fixList.notice_no}">
							${fixList.notice_title}</a>
						</td>
						<td data-title="날짜" class="hide_td">
							<fmt:formatDate value="${fixList.notice_reg_date}" pattern="yyyy.MM.dd"/>
						</td>
						<td data-title="조회" class="hide_td">${fixList.notice_view_count}</td>
					</tr>
				</c:if>	
				</c:forEach>
				</tbody>
			</table>
			<!-- 고정 외 10개 부분 -->
			<div class="table-container2" id="table-container2">
				<table id="noticeTbl2" class="noticeTbl">
					
					<thead id="thead_hi">
						<tr id="noti_th">
							<th width="10%">번호</th>
							<th width="20%">작성자</th>
							<th width="55%">제목</th>
							<th width="10%">날짜</th>
							<th width="5%">조회</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="noticeList" items="${noticeList}">
						<tr>
							<td width="10%" class="hide_td" data-title="번호">${noticeList.notice_no}</td>
							<td width="20%" data-title="작성자" class="hide_td">관리자</td>
							<td width="55%" class="txtShort2" data-title="제목"><a href="/noticeviews/notice_detail?notice_no=${noticeList.notice_no}">${noticeList.notice_title}</a></td>
							<td width="10%" data-title="날짜" class="hide_td"><fmt:formatDate value="${noticeList.notice_reg_date}" pattern="yyyy/MM/dd"/></td>
							<td width="5%" data-title="조회" class="hide_td">${noticeList.notice_view_count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
</div>
	<div class="pageInfo">

		<c:if test="${pageMaker.prev}">
			<li><a href="${pageMaker.startPage-1}">이전</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li><a href="${num}">${num}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li><a href="${pageMaker.endPage+1}">다음</a></li>
		</c:if>

	</div>
	
	
	
		<form method="get" class="moveForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
	/* 페이지 함수 */
	$(function() {
		
		/* var moveForm = $(".moveForm"); */
		
		$("#thead_hi").hide();
	

	
	/* 검색 함수 */
	  $("#searchBtn").on("click", function(e){
        e.preventDefault();
        var moveForm = $(".moveForm");
      
        let type = $(".searchBox select").val();
        let keyword = $("input[name='keyword']").val();
        
		if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        } 
        
        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.attr("action", "/noticeviews/notice_view");
        moveForm.submit();
    }); 
		
	  $(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var moveForm = $(".moveForm");
			
			
			moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/noticeviews/notice_view");
			moveForm.submit();
		});
	
    	
});
</script>