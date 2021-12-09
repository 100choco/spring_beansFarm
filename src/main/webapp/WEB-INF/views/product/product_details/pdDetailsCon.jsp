<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/product/pdDetailsCon.css">

<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/product/pdDetailsCon.js" ></script>
<script src="../../../../resources/js/product/pdDetailsCon2.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>



	<div id="content">
          <div id="con1">
              <div class="top_r">
                  <img src="/upload/product/${productDTO.p_image}" alt="제품 이미지">
              </div>
              <div class="top_l">
             
                  <h3 class="p_name">${productDTO.p_name}</h3>
                  <hr>

                  <table class="tb_title">
                      <tr>
                          <th><span>제조사</span></th>
                          <td><span>${productDTO.p_manufacturer}</span></td>
                      </tr>
                      <tr>
                          <th><span>포인트</span></th>
                          <td>
                              <i class="fab fa-product-hunt" id="p"></i>
                              <span id = "point"><fmt:formatNumber value="${productDTO.p_price/10}" pattern="#,###" /></span>
                          </td>
                      </tr>
                      <tr>
                          <th><span>유통기한</span></th>
                          <td><span>제조일로부터 1년</span></td>
                      </tr>
                      <tr>
                          <th><span>용량선택</span></th>
                          <td>
                             <select name="op_no1" id="amountOp"  class="op1">
							<option value="0">[필수] 옵션을 선택해 주세요</option>
							<option value="0">----------------------------------------</option>

							<c:forEach var="opList" items="${opList}">
								<c:if test="${opList.oc_no eq 1}">
									<option value="${opList.op_no}" class="opSelect">${opList.op_name}(
										<c:if test="${opList.op_price > 0}">+</c:if><fmt:formatNumber value="${opList.op_price}" pattern="#,###" /> )
									</option>
								</c:if>
							</c:forEach>

					</select>
                          </td>
                      </tr>
                      <tr>
                          <th><span>분쇄선택</span></th>
                          <td>
                              <select name="op_no2" id="crushingOp" class="op2">
							<option value="0">[필수] 옵션을 선택해 주세요</option>
							<option value="0">----------------------------------------</option>
							<c:forEach var="opList" items="${opList}">
								<c:if test='${opList.oc_no eq 2}'>
									<option value="${opList.op_no}" class="opSelect">${opList.op_name}(
										<c:if test="${opList.op_price > 0}">+</c:if><fmt:formatNumber value="${opList.op_price}" pattern="#,###" /> )
									</option>
								</c:if>
							</c:forEach>
					</select>
                          </td>
                      </tr>
                      <tr>
					<th><span>판매가</span></th>
					<td><span><fmt:formatNumber value="${productDTO.p_price}" pattern="#,###" /></span></td>
					<input type="hidden" id="productPrice" value="${productDTO.p_price}"></input>
				</tr>
                  </table>


                  <hr>
                  <h4 class="p_opName">제품옵션</h4>
			<table class="tb_op" id="tb_op">
				<tr>
					<th>PRODUCT NAME</th>
					<th>QUANTITY</th>
					<th>PRICE</th>
				</tr>
			</table>
			<table class="tb_total">
				<tr>
					<td><h4>TOTAL :</h4></td>
					<td><h4 id="totalPrice">0원</h4></td>
				</tr>
			</table>


                  <table class="tb_btn">
                      <tr>
                          <td>
                        		  <!-- 장바구니로 넘겨줄 폼 데이터 -->

								<form id="goToCart" method="get" action="#">
									
									<input type="hidden" name="m_no" id="m_no" value="${userNO}">
									<input type="hidden" name="p_no" id="p_no" value="${pdDTO.p_no}">
									<input type="hidden" name="op_no1" id="op_no1" value="">
									<input type="hidden" name="option_quantity1" id="option_quantity1" value="">
									<input type="hidden" name="op_no2" id="op_no2" value="">
									<input type="hidden" name="order_price" id="order_price" value="">
									<button type="button" id="basketBtn" class="btn-open-popup"><b>장바구니</b></button>
								</form>
	                        
	                          
	                          	
	                          
	                          
                          
                          </td>
                          
                          
                          <td><button type="button" id="buyBtn"><b>바로구매</b></button></td>
                      </tr>
                  </table>
                  
                  <!-- 모달 생성 시작 -->
                  
                  <div class="modal" draggable="true"> 
                  	<div class="modal_body">
                  		장바구니에 상품이 등록이 되었습니다<br><br>
                  		장바구니로 이동하시겠습니까?<br><br>
                  		
                  		<button id="yes">예</button>
                  		<button id="no">아니요</button>
                  	</div> 
                  </div>

                  <!-- 모달 생성  끝-->
                  
              </div>
          </div>
				
		<!-- 변경사항 -->
	<div id="con2">

		<div class="tab_basic">
			<div class="tab_list_wrap">
				<div class="tab_list tab_active" data-tabnum="0">
					<a href="#">제품상세정보</a>
				</div>
				<div class="tab_list" data-tabnum="1">
					<a href="#">배송안내</a>
				</div>
				<div class="tab_list" data-tabnum="2">
					<a href="#">리뷰(${reviewCount})</a>
				</div>
			</div>
			<div class="tab_container">
				<div class="tab_content">
						
				</div>
				<div class="tab_content">
				
				</div>
				
				<div class="tab_content">
					<div id="myShoppingListForm">
						<table class="mypageTabel">
							<tr>
								<th width="40%" colspan="2">후기</th>
								<th width="40%" colspan="2">내용</th>
								<th width="20%">별점</th>


							</tr>

							<!-- 상품사진,아카시아,날짜,주문번호, 금액+수량, 후기작성버튼. -->
							<c:forEach var="list" items="${list}">
								<input type="hidden" id="test" value="${list.p_no}">
								<tr class="mypageTableHo">
									<td width="20%">
											<img src="/upload/review/${list.r_thumbnail}" width="150px"
											height="150px">
									</td>
									<td width="20%">${list.p_name}</td>
									<td width="40%" colspan="2">
										<ul>
											<li>제목 : ${list.r_title}</li>
											<li>내용 : ${list.r_content}</li>
										</ul>
									</td>


									<td width="20%">
										<c:choose>
											<c:when test="${list.r_star == 1}">
												<img src="../../../../resources/images/1-grade.png">
											</c:when>

											<c:when test="${list.r_star == 2}">
												<img src="../../../../resources/images/2-grade.png">
											</c:when>

											<c:when test="${list.r_star == 3}">
												<img src="../../../../resources/images/3-grade.png">
											</c:when>

											<c:when test="${list.r_star == 4}">
												<img src="../../../../resources/images/4-grade.png">
											</c:when>

											<c:when test="${list.r_star == 5}">
												<img src="../../../../resources/images/5-grade.png">
											</c:when>
										</c:choose>
									</td>

								</tr>
							</c:forEach>


						</table>
						
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
					
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<input type="hidden" name="p_no" id="ttt">
				
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
      
      