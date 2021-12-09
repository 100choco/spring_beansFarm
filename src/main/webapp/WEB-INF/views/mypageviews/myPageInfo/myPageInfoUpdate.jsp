<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/myPageInfo/myPageInfoCon.css">




<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/member/addressAPI.js" ></script>
<script src="../../../../resources/js/member/daummapapi.js" ></script>
<script src="../../../../resources/js/mypage/myPageInfoUpdate.js" ></script>



	<div id="con2">
        <h1>회원정보보기</h1>

        <br><br>

        <h3>프로필</h3>
        

        <div id="memberInfo">
            
            <br><br>
        	
            <i class="iuserInfo fas fa-user-alt fa-8x" id="iuserInfo"></i>
            <div id="info">
            
                <c:forEach var="listOne1" items="${listOne}">
                <table id="memberInfoTbl1">
                    <tr>
                        <th><span>아이디</span></th>
                        <td><input type="text" name="m_id" id="m_id" readonly value="${listOne1.m_id}"></td>
                    </tr>
                    <tr>
                        <th><span>포인트</span></th>
                        <td><input type="text" name="membership_name" id="membership_name" readonly value="${listOne1.m_point}"></td>
                    </tr>
                    <tr>
                        <th><span>등급</span></th>
                        <td>
                        	<input type="text" name="m_point" id="m_point" readonly value="${listOne1.membership_name}">
	                    </td>
                    </tr>
                    <tr>
                        <th><span>가입일</span></th>
                        <td><fmt:formatDate value="${listOne1.m_reg_date}" type="both" pattern="yyyy.MM.dd" /></td>
                    </tr>
                </table>
            </c:forEach>
                
            
            </div>
        </div>
		
		<c:forEach var="listOne2" items="${listOne}">
        <table id="memberInfoTbl2">
            <tr>
                <th><span>이름/닉네임</span></th>
                <td>
                	<input type="hidden" name="m_id" id="m_id" value="${listOne2.m_id}">
                	<input type="text" name="m_name" id="m_name" readonly value="${listOne2.m_name}"></td>
            </tr>
            
            <tr>
                <th><span>전화번호</span></th>
                <td><input type="text" name="m_phone" id="m_phone" class="line" value="${listOne2.m_phone}"></td>
            </tr>

            <tr>
                <th><span>주소</span></th>
                <td>
                    <input type="text" name="m_postnum" id="m_postnum" class="line" value="${listOne2.m_postnum}">
                    <button id="addressFindBtn" onclick="postcode();">우편번호</button><br>
                    <input type="text" name="m_address" id="m_address" class="line" value="${listOne2.m_address}"><br>
                    <input type="text" name="m_detailed_address" id="m_detailed_address" class="line" value="${listOne2.m_detailed_address}">
                </td>
            </tr>

            <tr>
                <th><span>이메일</span></th>
                <td><input type="text" name="m_email" id="m_email" readonly value="${listOne2.m_email}">
            </tr>

            <tr>
               	<th colspan="2">
                    <button id="UpdeteBtn">수정완료</button>
                    
                    <!-- 주소목록 관리 팝업창 -->
                    <input id="m_no_input" name="m_no" type="hidden">
					<button class="m_no_btn">주소목록</button>
					
                </th>
            </tr>
        </table>
        </c:forEach>
        </div>