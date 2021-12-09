<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/adminLogin.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/admin/adminLogin.js" ></script>

<div id="conter">
    <div id="content">

        <h1>관리자</h1>

        <br>
        <br>
		<form action="#" method="post" id="adminLogin">
		    <table id="loginTbl">
		        <tr>
		            <td class="border"><input type="text" name="manager_id" id="manager_id" placeholder="ID" style="border: 0;"></td>
		        </tr>
		
		        <tr>
		            <td class="border"><input type="password" name="manager_pw" id="manager_pw" placeholder="PASSWORD" style="border: 0;"></td>
		        </tr>
		
		        <tr>
		            <td>
		                <br>
		                <button type="button" name="a_logninBtn" id="a_logninBtn">Login</button>
		            </td>
		        </tr>
		        
		        <tr>
		            <td>
		                <br>
		                <a href="/adminviews/adminJoin">관리자 회원가입</a>
		            </td>
		        </tr>
		    </table>
	    </form>
    </div>
</div>