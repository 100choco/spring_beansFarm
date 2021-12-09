<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="../../../resources/css/community/faq/faq.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

	<div id="con2">
			
			<h1>자주묻는질문(FAQ)</h1>
			
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
				
			

			<!-- 검색기능 -->				
			<div class="searchBox">
	            <select name="type" id="type">
	                <option value="faq_title" <c:out value="${pageMaker.cri.type eq 'faq_title'?'selected':''}"/>>제목</option>
		            <option value="ic_name" <c:out value="${pageMaker.cri.type eq 'ic_name'?'selected':''}"/>>카테고리</option>
	            </select>
	            <input type="text" name="keyword" id="keyword" placeholder="검색할 내용을 입력하세요" 
	            		value="${pageMaker.cri.keyword}" size="50%">
	            <button id="searchBtn">검색</button>
        	</div>
        	
        	<br><br>

			
			<!-- 관리자 로그인 시 보이는 부분 ??? 수정 -->
			
			<c:if test="${adminID ne null}">
				<button type="button" id="writeBtn" class="button2">FAQ글 등록</button>
			</c:if>
			
			<!-- 관리자 로그인 아직 구현이 안되어 있어서 임의로 넣은 부분(구현시 삭제) -->
			<!-- <button type="button" id="writeBtn" class="button2">FAQ글 등록</button> -->
			
			<br><br>
			
			<!-- FAQ게시판 -->		
			<form action="" method="post">
			<div class="table-container" id="table-container">
			
				<table id="noticeTbl">
				
					<thead>
						<tr class="table-info">
							<th width="10%">번호</th>
							<th width="10%" id="th_width">카테고리</th>						
							<th width="70%">제목</th>
							<th width="10%"></th>
						</tr>
					</thead>
		
					<!-- 글 내용 나타나는 공간 -->
					
				
					<c:forEach var="faq_contents" items="${faq_contents}">
						<tr>
							<td data-title="번호"><c:out value="${faq_contents.faq_no}" /></td>
							<td data-title="카테고리"><c:out value="${faq_contents.ic_name}" /></td>
							
								<td class="txtShort" data-title="제목">
								<!-- 관리자시 -->
									<c:if test="${adminID ne null}">
										<a href="/faqviews/faq_infoInquiry_Contents?faq_no=${faq_contents.faq_no}" style="text-decoration: none; color: black; cursor: pointer;">
											<c:out value="${faq_contents.faq_title}" />
										</a>
									</c:if>
									<c:out value="${faq_contents.faq_title}" />
								</td>
								
							<td></td>
							
						</tr>
					
					
						<tr>
							<td colspan="4">	
							
								<p id="faqContent">
									<c:out value="${faq_contents.faq_content}" />
								</p>	
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</form>
		
		
		
		
			<!-- 페이징 -->
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
			
			<!-- 페이징 -->
			<form id="moveForm" action="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
	</div>




<script>
/* 아코디언 테이블 */
	$(document).ready(function() {

		$("#noticeTbl tr:odd").addClass("odd");
		$("#noticeTbl tr:not(.odd)").hide();
		$("#noticeTbl tr:first-child").show(); //열머리글 보여주기
		$("#noticeTbl tr.odd").click(function() {
			$(this).next("tr").toggle();
		});

	});
	
	
/*  FAQ게시판 crud 알림창 */	
	$(document).ready(function() {
		let result = '<c:out value="${result}"/>';
		checkAlert(result);

		function checkAlert(result) {
			if (result == '') {
				return;
			}
			if (result == "faq 게시글 등록 성공") {
				alert("등록이 완료 되었습니다.")
			}

			if (result === "faq 게시글 수정 성공") {
				alert("수정이 완료되었습니다.");
			}

			if (result === "faq 게시글 삭제 성공") {
				alert("삭제가 완료되었습니다.");
			}
		}

	});
	
	
/* Faq게시글 등록 */
	$(document).ready(function(){
		$("#writeBtn").click(function(){
			location.href = "${path}/faqviews/faq_enroll_View";
		});
	});
	


/* a태그 상세페이지 넘어가는 부분 제약 */
	   function preventClick(e){
  			if(${not empty sessionScope.manager_id}){
   				alert("관리자 로그인했음");   
  			}else{
  				e.preventDefault();
  			}
 	   }
	
</script>


<!-- 페이징 및 검색  -->
<script type="text/javascript">
	$(function() {

		// 검색기능
		$("#searchBtn").on("click", function(e){
			e.preventDefault();
			var moveForm = $("#moveForm");
			
	        
			let type = $(".searchBox select").val();
	        let keyword = $("input[name='keyword']").val();

			alert("type : " + type);
			alert("keyword : " + keyword);
			
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
			moveForm.attr("action", "/faqviews/faq_view");
			alert("들어오니?")
	        moveForm.submit();
			alert("올거야 말거야?")
	    });



		// 페이징
		$(".pageInfo a").on("click",function(e) {
			var moveForm = $("#moveForm");
			
			e.preventDefault();
			moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/faqviews/faq_view");
			moveForm.submit();
			
			
		})
		
		
	});
</script>