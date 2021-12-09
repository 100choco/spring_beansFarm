<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/notice/noticeInsert.css">

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
			<!-- 입력 폼 시작 -->

			
                  <form action="/noticeviews/notice_insert" method="post">
                  <div class="table-container" id="table-container">
                      <table id="insertTbl" class="table1">
                      	
                      	<thead>
			            <tr>
			            	<th width="10%">고정여부</th>
		                	<th width="80%">제목</th>
		                	<th width="10%" class="insertTbl1">작성자</th>
		                </tr>
                       </thead>
                     
                     <tbody>
                       <tr>	                     
                       	<td width="10%" data-title="고정 여부">
                       	<!-- 상단 공지에 고정 유무 -->
                          <input type="checkbox" value="n" id="notice_fix">
                        
                       	</td>
                  			<td width="80%" data-title="제목"><input type="text" name="notice_title" size="100%" id="notice_title"></td>

                  			<td width="10%" data-title="작성자">관리자</td>
              			<tr>
              		</tbody>
              		
					<tr>
						<td colspan="3" width="90%" style="padding: 0;">
							<textarea rows="20" style="width:100%" name="notice_content" id="notice_content" class="notice_content"></textarea>
						</td>
					</tr>
					
				</table>
				</div>
				
				<!-- 작성자 세션값으로 manager_no가져옴 -->
				<c:if test= "${adminNO ne null}">	                        
                      <td><input type="hidden" name="manager_no" id="manager_no" value="${adminNO}"></td>
                </c:if>
				
				<div id="btnGroup">
                       <input type="submit" value="작성하기" class="button2" id="insert">
                       <button type="button" onclick="location.href='/noticeviews/notice_view'" class="button2" id="back">돌아가기</button>
                     	</div>
                  </form>
          
   			</div>
             