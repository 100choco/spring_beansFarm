<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/member/memberIdFind.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/member/idFind.js" ></script>

<div id="conter">
    <div id="content">
        <h1>아이디찾기</h1>

        <br>
        <br>

        <table id="idFindTbl">
            <tr>
                <td>
                    <input type="text" name="m_email" id="m_email" placeholder="이메일 입력">
                    <br>
                    <label id="emailText"></label>
                </td>
            </tr>
            
          
            
            <tr>
                <td>
                    <br><br>
                    <button id="idFindBtn" >아이디찾기</button>
                </td>
            </tr>

            <tr>
                <td>
                    <br>
                    <button id="previousBtn" onClick="location.href='/memberloginviews/memberLogin_view'">이전으로</button>
                </td>
            </tr>
        </table>
    </div>  
</div>