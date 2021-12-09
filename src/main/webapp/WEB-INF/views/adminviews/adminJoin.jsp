<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/adminJoin.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/admin/adminJogin.js" ></script>

	<div id="content">
        <h1>관리자 회원가입</h1>

        <br>
        <br>
        <br>
        <form action="#" method="post" id="adminAct">
	       <table id="adminTbl">
	           <tr>
	               <th><span>아이디</span></th>
	               <td>
	                   <input type="text" name="manager_id" id="manager_id">
	                   <label class="idChkText"></label>
	               </td>
	           </tr>
	
	           <tr>
	               <th><span>비밀번호</span></th>
	               <td>
	                   <input type="password" name="manager_pw1" id="manager_pw1">
	                   <label class="pwChkText1"></label>
	               </td>
	           </tr>
	
	           <tr>
	               <th><span>비밀번호 확인</span></th>
	               <td>
	                   <input type="password" name="manager_pw" id="manager_pw">
	                   <label class="pwChkText2"></label>
	               </td>
	           </tr>
	
	           <tr>
	               <th><span>닉네임</span></th>
	               <td>
	               		<input type="text" name="manager_name" id="manager_name">
	               		<label class="nameChkText"></label>
	               </td>
	           </tr>
	
	           <tr>
	               <td colspan="2" align="center">
	                   <br>
	                   <button id="joinBtn">가입하기</button>
	                   <button type="button" id="homeBtn" onClick="location.href='/adminviews/admin_B'">홈</button>
	                   <input type="reset" name="mag_joinreset" id="mag_joinreset" value="다시작성">
	               </td>
	           </tr>
	       </table>
		</form>
    </div>