<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/myShopping/myShoppingCenterCon.css">
<script src="../../../../resources/js/myShopping.js" ></script>

                <div id="con2">
                    <h1>주문내역 조회</h1>

                    <br>

                    <br><br>
                    
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
                            
							<tr class="mypageTableHo">
								<td width="10%">(사진)</td>
								<td width="10%">아카시아</td>
                                <td width="15%">2021-11-07</td>
                                <td width="15%">123456789</td>
                                <td width="25%" colspan="2">
	                                 <ul>
	                                  	<li> 14,000원</li>
	                                  	<li> 2개</li>
	                                 </ul>
                                </td>
                                
                                <td width="20%"> <button id="reviewBtn" onclick="location.href='/mypageviews/reviewWriteForm_view'">후기작성</button> </td>
                                
							
							</tr>
                            <!-- 글 내용 나타나야하는 공간 -->
                        </table>
                        
                        <br><br><br><br><br><br>
                        
                        
                    </div>
                  
                        
                        
                        
                        
                    </div>
                    

           