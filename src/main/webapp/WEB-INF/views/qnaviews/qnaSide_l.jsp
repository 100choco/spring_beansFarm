<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/qnaSide.css">

				<div id="con1">
                    <h3>고객센터</h3>
                    <br>
                    
                    <ul>
                    
                    	<!-- 경로입력 -->
                        <li class="notice"><a href="/noticeviews/notice_view">공지사항</a></li>
                        
                        <!-- 미 로그인시 qna 접근제어(로그인화면으로) -->
                        <c:choose>
                        	<c:when test="${adminID ne null && userID eq null}">
				               	<li class="qna"><a href="/qnaviews/qna_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
				            
				            <c:when test="${adminID eq null && userID ne null}">
				               	<li class="qna"><a href="/qnaviews/qna_user_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
         
                        	<c:otherwise>
	                        	<li class="qna"><a href="/memberloginviews/memberLogin_view">1:1문의하기(Q&A)</a></li>
	                        </c:otherwise>
                        </c:choose>
                        
                        <li class="faq"><a href="/faqviews/faq_view">자주묻는질문(FAQ)</a></li>
                        
                    </ul>
                    
                    <br><br><br><br><br><br><br><br><br><br>
                    
                    <hr width="50%">
                    <h4>고객상담센터</h4>
                    <p>053-123-4567</p>
                    <p>AM 9:00 ~ PM 6:00</p>
                    <p>Holiday 토요일/일요일/법정공휴일</p>
                    <p>Lunch PM 13:00 ~ 14:00</p>

                    <br><br>

                    <hr width="50%">
                    <h4>은행계좌 안내</h4>
                    <p>대구은행</p>
                    <p>182-07-011131-3</p>
                    <p>[예금주 : (주)원두 팜]</p>
                  
                </div>