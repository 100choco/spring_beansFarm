<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="false"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/myReview/myReviewCenterCon.css">
<script src="../../../../resources/js/mypage.js" ></script>

                <div id="con2">
                    <h1>내 후기</h1>
	
                    <br>

                    
                   <br><br>
                    
                    <br><br>
                    <div id="myreviewListForm">
                        <table class="mypageTabel">
                            <tr>
                                <th width="30%" colspan="2" style="">상품정보</th>
                                <th width="45%" >내용</th>
                                <th width="5%" >별점</th>
                                <th width="10%">수정</th>
                                <th width="10%">삭제</th>
                                
                            </tr>
                            
                         <c:forEach var="myreviewListAll" items="${myreviewListAll}">
                
                            <tr class="mypageTableHo">
              
                                <td width="10%"> 
                                <img src="/upload/review/${myreviewListAll.r_thumbnail}" width="150px" height="150px"></td>
                                <td width="20%" >상품내용</td>
                                
                                <td width="45%">
                                
                                	<ul> 
                                		<li class="txtShort">제목 : ${myreviewListAll.r_title}</li>
                                		<li class="txtShort">내용 : ${myreviewListAll.r_content}</li>
                                	
                                	<li> <input type="hidden" id="r_photo2" value="${myreviewListAll.r_photo}"> </li>
                                		<li> <input type="hidden" id="r_thumbnail2" value="${myreviewListAll.r_thumbnail}"> </li>
                                	</ul>
                                	
                                </td>
                                <td width="5%" >${myreviewListAll.r_star} 점</td>
                                <td width="10%"><button id="reviewUpdateBtn2" onclick="location.href='/mypageviews/myReviewList/reviewUpdateForm_view?r_no=${myreviewListAll.r_no}'">수정</button></td>
                                <td width="10%" ><button class="reDelBtn" id="reviewDeleteBtn" value="${myreviewListAll.r_no}">삭제</button></td>

                            </tr>
							
                            <!-- 글 내용 나타나야하는 공간 -->
                        </c:forEach>
                        
                        
                        
                        </table>
                        
                        
                        
                        
                    </div>
                    <br>
                    <div class="pageInfo">
				
						<c:if test="${pageMaker.prev}">
							<li><a href="${pageMaker.startPage -1}">이전</a></li>
							<!-- 이전버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
						</c:if>
				
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li><a href="${num}">${num}</a></li>
						</c:forEach>
				
						<c:if test="${pageMaker.next}">
							<li><a href="${pageMaker.endPage +1}">다음</a></li>
							<!-- 다음버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
						</c:if>
				
					</div>
					
                    <form method="get" class="moveForm">
					
						<!-- 엑션이 있어야지 값이 넘어가잖아 하지만 a태그를 눌렀을 때 액션이라는걸 추가해서 요 버튼을 눌렀을 때  -->
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
					</form>

                </div>
                	
                