<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/order/ordercon.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/order/orderCon.js" ></script>


	<div id="content">
        <h1>주문서작성/결제</h1>
        <br>

        <h3>주문상세내역</h3>
        <table id="orderDetailsTbl">
            <tr>
                <th>제품 / 옵션 정보</th>
                <th>수량</th>
                <th>상품금액</th>
                <th>할인/ 적립</th>
                <th>합계금액</th>
                <th>배송비</th>
            </tr>

            <!-- 제품목록이 나타나야한다 -->
            <!-- <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr> -->

        </table>
        <div id="amountBox">
            <div class="price">
                <h4>제품금액</h4><br>
                <h3>0</h3>
            </div>

            <div class="icon1">
                <br><p>-</p>
            </div>

            <div class="discount">
                <h4>할인금액</h4><br>
                <h3>0</h3>
            </div>

            <div class="icon2">
                <br><p>=</p>
            </div>

            <div class="total">
                <h4>결제금액</h4><br>
                <h3>0</h3>
            </div>
        </div>




        <br><br><br>
        <!-- 배송정보 -->
        <div>
            <hr width="10%">
            <h4>배송 정보</h4>
            <table id="shippingTbl">
                <tr>
                    <th>받으시는분</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th rowspan="2">받으실곳</th>
                    <td><input type="text"> <input type="button" value="우편번호 찾기"></td>
                </tr>
                <tr>
                    <td><input type="text" placeholder="기본주소"> <input type="text" placeholder="나머지주소"></td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td><input type="text"> - <input type="text"> - <input type="text"></td>
                </tr>
                <tr>
                    <th>배송메시지</th>
                    <td><input type="text"></td>
                </tr>
            </table>
        </div>

       
       
       
       
       
		<br><br><br>
        <!-- 이용약관 -->
        <div id="conditionBox">
            <h4>쇼핑몰이용약관</h4>
            <iframe src="/orderviews/terms" frameborder="0" name="condition" id="condition" width="100%" height="100px"></iframe><br>
            <div class="chk"><input type="checkbox"><span class="fontRed">(필수)</span>동의</div>
        </div>
        
        
        
        
        
        
		<br><br><br>
        <!-- 결제정보 -->
        <div>
            <hr width="10%">
            <h4>결제정보</h4>
            <table id="paymentInfoTbl">
                <tr>
                    <th>상품합계 금액</th>
                    <td>0원</td>
                </tr>
                <tr>
                    <th>배송비</th>
                    <td>2500원</td>
                </tr>
                <tr>
                    <th>할인 및 적립</th>
                    <td>0원</td>
                </tr>
                <tr>
                    <th>최종 결제 금액</th>
                    <td>0원</td>
                </tr>
            </table>
        </div>




        <br><br><br>
        <!-- 결제수단 -->
        <div>
            <hr width="10%">
            <h4>결제수단</h4>
            <table id="paymentMethodTbl">
                <tr>
                    <th rowspan="2">일반결제</th>
                    <td>
                        <input type="radio" name="passBookchk" id="passBookchk" value="passBookchk" checked> 무통장입금 
                        <input type="radio" name="passBookchk" id="cardChk" value="cardChk"> 신용카드
                    </td>
                </tr>

                <tr>
                    <td>
                        <div id="passBook">
                            <table id="passBookTbl">
                                <p>( 무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다. )</p>
                                <tr>
                                    <th>입금자명</th>
                                    <td><input type="text" name="bankName" id="bankName_w"></td>
                                </tr>
                                <tr>
                                    <th>입금은행</th>
                                    <td>
                                        <input type="text" name="bank" id="bank_w" value="대구은행 182-07-011131-3 [예금주 : (주)원두 팜]">
                                        <input type="text" name="bank" id="bank_m" value="대구은행 182-07-011131-3 원두 팜">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th>현금영수증 발행</th>
                    <td>
                        <input type="radio" name="cashReceipt" id="cashReceiptyes" value="cashReceiptyes" checked> 현금영수증
                        <input type="radio" name="cashReceipt" id="cashReceiptno" value="cashReceiptno"> 신청안함
                    </td>
                </tr>
				
				<tr>
					<th></th>
					<td>
						<button id="paymentBtn">결제하기</button>
					</td>
				</tr>
            </table>
        </div>
    </div>