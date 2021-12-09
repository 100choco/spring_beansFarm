<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/qna.css">
<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/qna/qna.js" ></script>

    	<div id="con2">
             <h1 class="contentTitle">1:1문의하기(Q&A)</h1>
             	
             <br><br>

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
                 <!-- <hr> -->
	
		<!-- 여기서 부터 테이블(내용 부분) 시작 -->
                 <br>
                 <c:if test="${userID ne null}">
                 	<button id="btn" type="button" class="button2" onclick="location.href='/qnaviews/qna_insert_view'">작성하기</button>
                 </c:if>
                 <br><br><br>
                 
                 
                 <div class="table-container" id="table-container">
                     <table id="noticeTbl" class="noticeTbl">
                     
                      <thead>
                          <tr>
                              <th width="10%">문의 번호</th>
                              <th width="10%">문의 분류</th>
                              <th width="45%">문의 제목</th>
                              <th width="10%">문의 날짜</th>
                              <th width="10%">작성자</th>
                          	<th width="15%">처리 상태</th>
                          </tr>
                      <thead>
                         
                    <c:forEach var="dto" items="${dto}">
                         
                         <tbody>
                          <tr id="dataTr">
                              <td class="hide_td" data-title="문의 번호">${dto.q_no}</td>
                              <td class="hide_td" data-title="문의 분류">${dto.ic_name}</td>
                              <td data-title="문의 제목" class="txtShort" id="q_content_title">
                              		<a style="width:500px; height:500px;" href="/qnaviews/qna_oneview?q_no=${dto.q_no}">${dto.q_title}</a>
                              </td>
                              <td class="hide_td" data-title="문의 날짜"><fmt:formatDate pattern="yyyy.MM.dd" value="${dto.q_reg_date}"/></td>
                              <td class="hide_td" data-title="작성자">${dto.m_name}</td>
                              <td data-title="처리 상태">
	                              <c:choose>
	                              	<c:when test="${dto.q_status eq '답변완료'}">
		              				  	<input type="text" class="answerChk" disabled="disabled" value="${dto.q_status}">
		              				</c:when>
		              				<c:when test="${dto.q_status eq '답변 대기중'}">
		              				  	<input type="text" class="statusChk" disabled="disabled" value="${dto.q_status}">
		              				</c:when>
		              		      </c:choose>	
	              			  </td>
              				  
              				  
              			</tr>
                         </tbody>
                         
					</c:forEach>

                     </table>
                   </div>
	<br>
	<!--  <hr> -->
	
	<br>
<!-- 페이징 번호 및 버튼 출력 -->
<div class="pageInfo">
	<c:if test="${pageMaker.prev}">
		<li><a href="${pageMaker.startPage -1}">이전</a></li>
	</c:if>
 
 	
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<li><a href="${num}">${num}</a></li>
 	</c:forEach>

  <c:if test="${pageMaker.next}">
 	<li><a href="${pageMaker.endPage +1}">다음</a></li>
 </c:if>
 </div>
 <br>
 
 <!-- 페이지 이동 Form hidden으로 숨김처리 -->
 <form method="get" class="moveForm">
	 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum} ">
	 <input type="hidden" name="amount" value="${pageMaker.cri.amount} ">
 </form>
 
<br>
</div>

<script>

$(document).ready(function(){

 	var re = "${result}";
	checkAlert(re);
	
	function checkAlert(re) {
		if(re == ''){
			return;
		}
		
		if(re == "qna 게시글 등록"){
			alert("등록이 완료 되었습니다.")
		}
		
		if(re == "qna 게시글 삭제"){
			alert("삭제가 완료 되었습니다.")
		}
	}

});
/* 

$(function() {
	var statusChk = $(this).closest('tr').find('.statusChk').val();
	var answerChk = "답변완료"; 
	/* boolean isChk = statusChk.match(answerChk); */
	
	if(statusChk.match(answerChk)) {
		$(".statusChk").css("color", "blue");
	}
	
}); */
</script>