<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/mypage/mypageCenterCon.css">
<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/mypage.js" ></script>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy.MM.dd" /></c:set>

                <div id="con2">
                    <h1>마이페이지</h1>

                    <br>

                    <br><br>
					
                    <h3>주문내역 조회</h3>
                    
                    <br><br>
                    
                    <div id="myShoppingListForm">
                        <table class="mypageTabel">
                            <tr>
                                <th width="40%" colspan="2">상품정보</th>
                                <th width="13%">주문일자</th>
                                <th width="13%">주문번호</th>
                                <th width="14%" colspan="2">주문금액(수량)</th>
                                <th width="20%" >후기작성</th>
                            </tr>
							<!-- 상품사진,아카시아,날짜,주문번호, 금액+수량, 후기작성버튼. -->
							<c:forEach var="myOrderHistory" items="${myOrderHistory}">
		             			
				                <tr class="mypageTableHo">
								<td width="10%"> <a href="/product/product_details/pdDetailsCon_view?p_no=${myOrderHistory.p_no}"> <img src="src=/upload/review/${myOrderHistory.p_image}" width="150px" height="150px"></a> </td>
								<td width="10%">${myOrderHistory.p_name}</td>
                                <td width="15%"><fmt:formatDate value="${myOrderHistory.order_reg_date}" pattern="yyyy-MM-dd" /></td>
                                <td width="15%">${myOrderHistory.order_no}</td> 
                                <td width="25%" colspan="2">
	                                 <ul>
	                                  	<li>${myOrderHistory.order_price}</li>
	                                  	<li>${myOrderHistory.product_quantity}</li>
	                                 </ul>
                            	</td>
                                <td width="20%">
                                 <form action="/mypageviews/myReviewList/reviewWriteForm_view" method="post" id="reviewChk" class="reviewChk">
                                	<input type="hidden" name="order_no" class="order_no" value="${myOrderHistory.order_no}"> 
                            	</form>
                            	<button class="reviewBtn">후기작성</button>
                            	
                                 </td>
                               
							</tr>
             				</c:forEach>
							
                            
                        </table>
                    </div>
                    
                    
     <!-- 쿠폰  -->
             
             <br><br>
             
             <h3 id="mycucu">내 쿠폰</h3>
             <br>
             <div id="myShoppingListForm">
             
             
                 <table class="mypageTabel">
                     <tr>
                         <th width="10%" colspan="2">쿠폰번호</th>
                         <th width="40%">쿠폰명</th>
                         <th width="15%">할인금액</th>
                         
                         <th width="20%" colspan="2">유효기간</th>
                     </tr>
                     <c:forEach var="couponlistOne" items="${couponlistOne}">
		             <c:set var="c_expiration_date"><fmt:formatDate value="${couponlistOne.c_expiration_date}" pattern="yyyy.MM.dd" /></c:set>
		                 <c:if test="${c_expiration_date > date}">
		                     <tr class="mypageTableHo">
		                         <td width="10%" colspan="2">${couponlistOne.c_no}</td>
		                         <td width="40%">${couponlistOne.c_name}</td>
		                         <td width="15%">${couponlistOne.c_discount}%</td>
		                         
		                         <td width="20%" colspan="2">
		                         	<fmt:formatDate value="${couponlistOne.c_reg_date}" type="both" pattern="yyyy. MM. dd" />
				                      ~ 
				                     <fmt:formatDate value="${couponlistOne.c_expiration_date}" type="both" pattern="yyyy. MM. dd" />
		                         </td>
		                     </tr>
						</c:if>
             		</c:forEach>
                 </table>
             </div>
                        
                        
           <!-- 후기 -->
                    
                      <br><br>
                    <h3 id="myreivewList">내 후기</h3>   
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
                         <c:forEach var="myreviewList" items="${myreviewList}">
                            <tr class="mypageTableHo">
                                <td width="10%"> 
                                <img src="/upload/review/${myreviewList.r_thumbnail}" width="150px" height="150px"></td>
                                <td width="20%" >상품내용</td>
                                <td width="45%">
                                	<ul> 
                                		<li class="txtShort">제목 : ${myreviewList.r_title}</li>
                                		<li class="txtShort">내용 : ${myreviewList.r_content}</li>
                                		<li> <input type="hidden" id="r_photo" value="${myreviewList.r_photo}"> </li>
                                		<li> <input type="hidden" id="r_thumbnail" value="${myreviewList.r_thumbnail}"> </li>
                                		<li> <input type="hidden" id="r_no" value="${myreviewList.r_no}"> </li>
                                	</ul>
                                </td>
                                <td width="5%" >${myreviewList.r_star} 점</td>
                                <td width="10%"><button type="button" id="reviewUpdateBtn"  onclick="location.href='/mypageviews/myReviewList/reviewUpdateForm_view?r_no=${myreviewList.r_no}'">수정</button></td>
                                <td width="10%" ><button class="reDelBtn" id="reviewDeleteBtn" value="${myreviewList.r_no}">삭제</button></td>
                            </tr>
							<!-- onclick="location.href='/mypageviews/reviewDelete?r_no=${myreviewList.r_no}'" -->
                            <!-- 글 내용 나타나야하는 공간 -->
                        </c:forEach>
                        </table>
                        
                        
                        
                        
                    </div>
                    

                </div>