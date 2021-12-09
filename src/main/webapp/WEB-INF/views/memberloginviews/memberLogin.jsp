<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/member/memberLogin.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/member/memberLogin.js" ></script>

<div id="conter">
    <div id="content">

        <h1>Login</h1>

        <br>
        <br>

        <form action="#" method="post" id="loginCheck">
            <table id="loginTbl">
                <tr>
                    <td class="border"><input type="text" name="m_id" id="m_id" placeholder="ID" style="border: 0;"></td>
                </tr>

                <tr>
                    <td class="border"><input type="password" name="m_pw" id="m_pw" placeholder="PASSWORD" style="border: 0;"></td>
                </tr>

                <tr>
                    <td>
                        <br>
                        <button type="button" name="m_login" id="m_logninBtn" value="Login">Login</button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <a href="/memberloginviews/memberJoin_view">회원가입</a> |
                        <a href="/memberloginviews/memberidFind_view">아이디</a> |
                        <a href="/memberloginviews/memberPwFind_view">비밀번호 재설정</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>