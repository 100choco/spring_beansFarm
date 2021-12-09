<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>  
<link rel="stylesheet" href="../../../resources/css/community/faq/faqEnroll.css">      
        <div id="con2">
        <h1>FAQ 작성하기(FAQ)</h1>

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

        <form action="/faqviews/faq_enroll" method="post">
        <div class="table-container" id="table-container">
            <table id="noticeTbl">
            
            	<thead>
	                <tr>
	                    <th width="15%">카테고리</th>
	                    <th width="85%" class="ic_no">제목</th>
	                </tr>
                </thead>
                
                <tbody>
	                <tr>
	                	<!-- 문의 분류 추가 -->
	                    <td width="15%" data-title="카테고리">
	                    	<select name="ic_no" id="ic_no">
		                        <c:forEach var="dto" items="${dto}">
									<option value="${dto.ic_no}">${dto.ic_name}</option> 	
								</c:forEach>
	                        </select>
	                   </td>
	                    <td width="85%" data-title="제목"><input type="text" name="faq_title" id="faq_title" size="91%"></td>
	                </tr>
	             </tbody>

	               <tr>
	                  <td width="100%" colspan="2" style="padding: 0;"><textarea rows="15" style="width:95%" name="faq_content" id="faq_content"></textarea></td>
	               </tr>
	            </table>
            </div>
            
            <br>
            <div id="btnGroup">
	            <button type="submit" class="button2">등록</button>
	            <button type="button" class="button2" onclick="location.href='/faqviews/faq_view'">돌아가기</button>
            </div>
        </form>
   
    </div>