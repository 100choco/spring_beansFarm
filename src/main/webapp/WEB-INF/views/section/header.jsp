<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/header.css">


<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/header.js" ></script>

<!-- 헤더에 아이콘(검색, 로그인, 장바구니, 리스트) -->
<script src="https://kit.fontawesome.com/fea8ea66bc.js" crossorigin="anonymous"></script>




   <div id="popup">
    <i class="fas fa-times fa-3x" id="searchFormx"></i>
        <div class="searchForm">
            <form action="" method="get" id="mainSF">

                <input type="text" name="keyword" class="realSearch" placeholder="상품검색">
                <i class="fas fa-search fa-3x" id="searchAction"></i>
                <hr>
               

            </form>
        </div>
    </div>
    
    
    <!-- 최상단 -->    
    <div id="top"></div>
    
    <!-- 아이콘 -->    
    <div class="top">

            <a href="#top"><i class="fas fa-chevron-circle-up fa-2x"></i></a>   
            
        </div>

        <div class="header">

               <div class="m_logo">
                   <a href="/">
                   		<img src="../../../resources/images/logo/logo_icon.png" alt="m_logo" width="38" height="38">
                   </a>
               </div>
               
               <div class="logo" >
                    <a href="/"><img src="../../../resources/images/logo/logo.png" alt="logo"></a>
                 

                </div>
                <nav class="nav">
               
               
         
         
                    <div class="menu">
        
                        <ul>
                            <li class="mainmenu">
                                <a href="#">About</a>
                            </li>
        
                            <li class="mainmenu">
                               <a href='/product/product_view?keyword='>Product</a>
        
                                <ul class="hoMenu">
                                	<c:forEach var="categoryList" items="${categoryList}">
                                    <li><a href="/product/product_view?keyword=&type=${categoryList.category_no}">${categoryList.category_name}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
        
                            <li class="mainmenu">
                                <a href="/noticeviews/notice_view">Community</a>

                                <ul class="hoMenu">
                                    <li><a href="/noticeviews/notice_view">공지사항</a></li>
                                    
                                    <!-- 미 로그인시 qna 접근제어(로그인화면으로) -->
			                        <c:choose>
			                        	<c:when test="${adminID ne null && userID eq null}">
							               	<li><a href="/qnaviews/qna_view">Q&A</a></li>
							            </c:when>
							            
							            <c:when test="${adminID eq null && userID ne null}">
							               	<li><a href="/qnaviews/qna_user_view">Q&A</a></li>
							            </c:when>
			         
			                        	<c:otherwise>
				                        	<li class="qna"><a href="/memberloginviews/memberLogin_view">Q&A</a></li>
				                        </c:otherwise>
			                        </c:choose>
                                    
                                    <li><a href="/faqviews/faq_view">FAQ</a></li>
                                </ul>
                            </li>
        
                        
        
                        </ul>
        
                    </div>
        
                    <div class="i">
                    <div id="i_all">
                     <c:choose>
                     <c:when test="${userID eq null && adminID eq null}">
                             <div class="loginBlank"></div>
                     </c:when>
                     <c:when test="${userID ne null}">
                             <div class="loginBlank">${userName}님 안녕하세요</div>
                             <input type="hidden" name="m_id" id="m_id" value="${userID}">
                             <input type="hidden" name="m_name" id="m_name" value="${userName}">
                             
                     </c:when>
                     <c:when test="${adminID ne null}">
                             <div class="loginBlank">관리자님 안녕하세요</div>
                     </c:when>
                  </c:choose>
                        <c:choose>
                          <c:when test="${userID eq null && adminID eq null}">
                             <div id="notlogin">
                             
                                 <i class="fas fa-search fa-lg" id="search"></i>
                                 <a href="/cartviews/cart_view"><i class="fas fa-shopping-cart fa-lg"></i></a>
                                 <a href="/memberloginviews/memberLogin_view"><i class="iuserInfo fas fa-user-alt fa-lg" id="iuserInfo"></i></a> 
                              </div>
                          </c:when>
                          <c:when test="${userID ne null}">
                              <div id="login">
                                 <i class="fas fa-search fa-lg" id="search"></i>
                                 <a href="/cartviews/cart_view"><i class="fas fa-shopping-cart fa-lg"></i></a>
                                 <a href="/mypageviews/mypage/mypage_view"><i class="iuserInfo fas fa-user-alt fa-lg" id="iuserInfo"></i></a>
                                 <a href="#"><i class="fas fa-sign-out-alt fa-lg" id="logout"></i></a>
                                 
                              </div>
                           </c:when>   
                           
                            <c:when test="${adminID ne null}">
                              <div id="login">
                              	 <a href="/adminviews/adminMain_view"><i class="fas fa-user-cog fa-lg"></i></a>
                                 <i class="fas fa-search fa-lg" id="search"></i>
                                 <a href="/cartviews/cart_view"><i class="fas fa-shopping-cart fa-lg"></i></a>
                                 <a href="#"><i class="fas fa-sign-out-alt fa-lg" id="logout"></i></a>
                                 
                              </div>
                           </c:when>
                        </c:choose>
                     </div>
                        
                  <div class="headerSide">
                        <input type="checkbox" id="menuicon">
                   <label for="menuicon">
                       <span></span>
                       <span></span>
                       <span></span>
                   </label>
                   <div class="sidebar">
                    <div class="logo" >
                    <a href="/"><img src="../../../resources/images/logo/logo.png" alt="logo"></a>
                 

                   </div>
                     <div class="sidebarlist">
                        
                     <c:choose>
                        <c:when test="${userID eq null && adminID eq null}">
                                <a href="/memberloginviews/memberLogin_view"><h2>로그인</h2></a>
                               </c:when>
                        <c:when test="${userID ne null}">
                                <a href="/mypageviews/mypage/mypage_view"><h2>마이페이지</h2></a>
                                </c:when>   
                     </c:choose>
                        
                        
                        
                           <h3>product</h3>
                           <hr>
                           <ul>
					           <li><a href="/product/product_view">전체상품 </a></li>
					           <c:forEach var="categoryList" items="${categoryList}">
	                           <li><a href="/product/product_view?type=${categoryList.category_no }">${categoryList.category_name }</a></li>
	                           </c:forEach>
				           </ul>
               
                           <h3>community</h3>
                           <hr>
                           <ul>
                           
                               <li>
                                  <a href="/noticeviews/notice_view"> 공지사항 </a>
                               </li>
                               
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
		                        
                                <li>
                                   <a href="/faqviews/faq_view"> 자주하는 질문 </a>
                                </li>
               
                           </ul>
               
                       </div>

                     </div> 
            </div>
                   
                        
                  
                    </div>

                </nav>
           
        </div>