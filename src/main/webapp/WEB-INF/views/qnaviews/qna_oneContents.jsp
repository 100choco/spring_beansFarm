<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/qna/qnaOneContent.css">
<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/qna/qna.js" ></script>

                <div id="con2">
                    <h1>1:1문의하기(Q&A)</h1>
                    
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

                <div class="table-container" id="table-container">  
                     
                       <div class="userTbl">
					
							<table id="noticeTbl" class="noticeTbl"> 
								<thead>
									<tr>
										<th width="32%">문의 번호</th>
										<th width="35%">문의 제목</th>
										<th width="35%">문의 날짜</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td data-title="문의 번호">${dto.q_no}</td>
										<td data-title="문의 제목">${dto.q_title}</td>
										<td data-title="문의 날짜"><fmt:formatDate pattern="yyyy.MM.dd" value="${dto.q_reg_date}"/></td>
									</tr>
								</tbody>
							
								<tr>
                                	<td colspan="3" id="qna_content" style="padding: 0;">
	                                	<div id="qna_con_mh">
		                                	<c:if test="${dto.q_image ne 'null'}">
		                                		<div id="qna_content_div">
		                                			<img src="/upload/qna/${dto.q_image}">
		                                		</div>
		                                	</c:if>
			                                
			                                ${dto.q_content}
		                                </div>
	                                </td>
                            	</tr>
	
							</table>
						</div>
                       
                </div>    
                       <br><br>
                       

                       <!-- 답변 테이블 -->
                     
                      <div class="answerTbl">
 						<span>관리자</span> | 
 						<span><fmt:formatDate pattern="yyyy.MM.dd" value="${dto.q_answer_date}"/></span>
 						<br>
				        <p>${dto.q_answer}</p>
 						
 						
                      <%-- <table id="noticeTbl" class="noticeTbl">
                        	<tr>
                        		<th width="50%">작성자</th>
                        		<!-- <th width="30%">답변 상태</th> -->
                                <th width="50%">답변 날짜</th>
                            </tr>

                        	 <tr>
                        	 	<td>관리자</td>
                        	 	<td><fmt:formatDate pattern="yyyy.MM.dd" value="${dto.q_answer_date}" /></td>                                
                            </tr>
                            
                            <tr>
                            	<td colspan="3"  id="q_answer" class="q_answer"><div id="q_answer_div">${dto.q_answer}</div></td>
                            </tr>
  
                        </table> --%>
                        </div>
                        
                       	<input type="hidden" value="${dto.q_no}" id="q_no" name="q_no">
                        <input type="hidden" id="answer" value="${dto.q_status}">
                        	<br>
        	
     					 <div class="table-container"> 
					 	<c:choose>
					 	                      
	                        <c:when test="${userID ne null}">
		                        <div class="answer_user">
		            			
		                        	<button type="button" onclick="location.href='/qnaviews/qnaUpdateView?q_no=${dto.q_no}'" id="upbtn" class="button2">수정 하기</button>
		                        	<button type="button" id="deleteBtn" class="button2">삭제 하기</button>
			                        <button type="button" onclick="location.href='/qnaviews/qna_view'" class="button2">돌아가기</button>
			                    </div>
	                        </c:when>
	                        <c:when test="${adminID ne null}">
	                        
								<div id="answerForm">
									<h3 align="left">관리자 댓글 입력</h3><br>
									<textarea rows="5" style="width:100%" id="answerContext" name="answerContext"></textarea>
									<input type="hidden" value="1" id="manager_no" name="manager_no">
								<br>
									<button type="button" id="answerBtn" class="button2">답변 하기</button>
			                        <button type="button" onclick="location.href='/qnaviews/qna_view'" class="button2">돌아가기</button>
								</div>
								
								<div>
									<form id="modifyForm">
										<textarea rows="5" style="width:100%" id="modifyContext" name="modifyContext" placeholder="수정할 댓글의 내용을 입력하세요"></textarea>
										<input type="hidden" value="1" id="manager_no" name="manager_no">
									<br>
										<button type="button" id="modifyBtn" class="button2">답변 수정</button>
										<button type="button" id="ansDelBtn" class="button2">답변 삭제</button>
				                        <button type="button" onclick="location.href='/qnaviews/qna_view'" class="button2">돌아가기</button>
									</form>
								</div>
								
							</c:when>
	
	                    </c:choose> 
		                        
				</div>
	
	</div>
<script>                
$(document).ready(function(){

	var re = "${result}";
		checkAlert(re);
		
		function checkAlert(re) {
		if(re == ''){
			return;
		}
		
		if(re == "qna 게시글 수정"){
			alert("수정이 완료 되었습니다.")
		}
		
	}
		
});

$(function(){


 	$('#answerBtn').on('click', function(){
 		
 	 	var q_no = $("#q_no").val();
 	 	var q_answer = $("#answerContext").val();
 		var manager_no = $("#manager_no").val();

 		$.ajax({
			
			url :'/qnaviews/qna_answer',
			data : {"q_no":q_no, "q_answer":q_answer, "manager_no":manager_no}, 
			type : 'POST',
			dataType : 'text',
			success : function(data){
				alert("답변 작성 완료")
				location.reload();

			}
			
		})
	
	})
	
	$('#modifyBtn').on('click', function(){
 		
 	 	var q_no = $("#q_no").val();
 	 	var q_answer = $("#modifyContext").val();
 		var manager_no = $("#manager_no").val();

 		$.ajax({
			
			url :'/qnaviews/qna_answer',
			data : {"q_no":q_no, "q_answer":q_answer, "manager_no":manager_no}, 
			type : 'POST',
			dataType : 'text',
			success : function(data){
				alert("답변 수정 완료")
				location.reload();

			}
			
		})
	
	})
	
	$('#ansDelBtn').on('click', function(){
 	
 		var q_no = $("#q_no").val();
 	 	var q_answer = "";
 		var manager_no = $("#manager_no").val();

 		var del = confirm("정말 삭제 하시겠습니까?")

			if(del == true){
				
				$.ajax({
					
					url :'/qnaviews/qna_delAjax',
					data : {"q_no":q_no, "q_answer":q_answer, "manager_no":manager_no}, 
					type : 'POST',
					dataType : 'text',
					success : function(data){
						alert("답변 삭제 완료")
						location.reload();

					}
					
				})
				
			}else{
				alert("취소되었습니다.");
			}

	}) 
	

 	    $('#answerContext').on('keyup', function() {

 	        if($(this).val().length > 1024) {

 	          $(this).val($(this).val().substring(0, 1024));
 	            alert("최대 글자 수를 초과하였습니다."); 
 	        }
 	    });
 	
	    $('#modifyContext').on('keyup', function() {

 	        if($(this).val().length > 1000) {

 	          $(this).val($(this).val().substring(0, 1024));
 	            alert("최대 글자 수를 초과하였습니다."); 
 	        }
 	    });

})
</script>