<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/admin/coupon/couponInsert.js" ></script>




	<div>
        <table>
        
        	<tr>
                <td><span>회원번호</span></td>
                <td><input type="text" name="m_no" id="m_no" readonly value="${m_no}"></td>
            </tr>
            
            <tr>
                <td><span>쿠폰이름</span></td>
                <td><input type="text" name="c_name" id="c_name"></td>
            </tr>

            <tr>
                <td><span>만료일자</span></td>
                <td><input type="text" name="date" id="date"></td>
            </tr>

            <tr>
                <td><span>쿠폰내용</span></td>
                <td><input type="text" name="c_content" id="c_content"></td>
            </tr>

            <tr>
                <td><span>할인율</span></td>
                <td><input type="text" name="c_discount" id="c_discount"></td>
            </tr>
            
            <tr>
                <td colspan="2">
                	<button id=couponInsert>쿠폰지급하기</button>
                </td>
            </tr>
            
        </table>
    </div>