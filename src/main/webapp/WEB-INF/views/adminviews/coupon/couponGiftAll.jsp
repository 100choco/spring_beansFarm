<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/admin/adminMemberList.css">

<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/admin/adminMemberList.js" ></script>

	<div id="con2">
        <h1>회원 쿠폰 지급하기</h1>

        <br><br>
        
		<!-- 검색기능 -->
        <div class="searchBox">
            <select name="type" id="type">
                <option value="s_id" <c:out value="${pageMaker.cri.type eq 's_id'?'selected':'' }"/>>아이디</option>
                <option value="s_tier" <c:out value="${pageMaker.cri.type eq 's_tier'?'selected':'' }"/>>등급</option>
            </select>
            <input type="text" name="keyword" id="keyword" placeholder="검색할 내용을 입력하세요" 
            		value="${pageMaker.cri.keyword}">
            <button id="searchBtn">검색</button>
        </div>
        
        <br><br><br>
		
        <div>
        
        	<!-- <button type="button" id="couponBtn">쿠폰지급</button> -->
                <table id="adminTbl">
                    <tr>
                        <th width="2%"><input type='checkbox' name='memberAll' id='memberAll'/></th>
                        <th width="3%"><span>번호</span></th>
                        <th width="10%"><span>닉네임</span></th>
                        <th width="10%"><span>아이디</span></th>
                        <th width="10%"><span>휴대폰</span></th>
                        <th width="10%"><span>등급</span></th>
                        <th width="15%"><span>이메일</span></th>
                        <th width="10%"><span>가입일</span></th>
                        <th width="5%"><span>탈퇴여부</span></th>
                        <th width="30%"><span>관리</span></th>
                    </tr>
                    
                    <c:forEach var="memberList" items="${memberList}">
                    <tr>
                        <td><input type="checkbox" name='memberchk' class='memberchk' value="${memberList.m_no}"></td>
                        <td>
                        	${memberList.m_no}
                        	<input type="hidden" name="m_no" id="m_no" value="${memberList.m_no}">
                        </td>
                        <td>${memberList.m_name}</td>
                        <td>
                        	${memberList.m_id}
                        	<input type="hidden" name="m_id" id="m_id" value="${memberList.m_id}">
                        </td>
                        <td>${memberList.m_phone}</td>
                        <td>${memberList.membership_name}</td>
                        <td>${memberList.m_email}</td>
                        <td><fmt:formatDate value="${memberList.m_reg_date}" type="both" pattern="yyyy. MM. dd" /></td>
                        <td>${memberList.m_leave}</td>
                        <td>
                        	<button type="button" class="memberInfo">회원보기</button>
                        	<button type="button" class="couponBtn">쿠폰지급</button>
                        	<button type="button" class="memberpwReset">비번초기화</button>
                        	<button type="button" class="memberdelete">회원탈퇴</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                
        </div>
        
        <br><br>
        
        <!-- 페이징처리 -->
        <div class="pageInfo">
		
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.startPage -1}">이전</a></li>
			</c:if>
			
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li><a href="${num}">${num}</a></li>
			</c:forEach>
			
			
			<c:if test="${pageMaker.next}">
				<li><a href="${pageMaker.endPage +1}">다음</a></li>
			</c:if>
			
		</div>
		
		
		
        <form method="get" class="moveForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
		
        
        
        
        <div>
        <table>
        
        	<tr>
                <td><span>회원번호</span></td>
                <td><input type="text" name="m_noCoupon" id="m_noCoupon"></td>
            	<td><button id="choiceBtn">선택완료</button>
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
                	<button id=couponAllBtn>쿠폰지급하기</button>
                </td>
            </tr>
            
        </table>
    </div>
    </div>