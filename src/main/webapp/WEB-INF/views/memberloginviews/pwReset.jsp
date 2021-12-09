<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/member/memberPWFind.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/member/pwReset.js" ></script>

<div id="conter">
        <div id="content">
            <h1>비밀번호 재설정</h1>
    
            <br>
            <br>
    
            <table id="pwFindTbl">
    			
    			<tr>
                    <td>
                        <input type="text" name="m_id" id="m_id" placeholder="아이디">
                    </td>
                </tr>
                
                <tr>
                    <td>
                    	<br>
                        <input type="password" name="m_pw1" id="m_pw1" placeholder="비밀번호">
                    	<br>
                    	<label class="pwChkText1"></label>
                    </td>
                </tr>
    
                <tr>
                    <td>
                        <br>
                        <input type="password" name="m_pw" id="m_pw" placeholder="비밀번호 확인">
                    	<br>
                    	<label class="pwChkText2"></label>
                    </td>
                </tr>
    
                <tr>
                    <td>
                        <br><br>
                        <button id="pwRestBtn">비밀번호 변경하기</button>
                    </td>
                </tr>
            </table>
        </div>  
    </div>