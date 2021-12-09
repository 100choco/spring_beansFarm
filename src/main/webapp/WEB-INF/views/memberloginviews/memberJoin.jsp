<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/member/memberJoin.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/member/addressAPI.js" ></script>
<script src="../../../resources/js/member/daummapapi.js" ></script>
<script src="../../../resources/js/member/memberJogin.js" ></script>


	<div id="content">
        <h1>회원가입</h1>

        <br>
        <br>
        <br>
        
        <form action="#" method="post" id="joinCheck">
            <table id="memberTbl">
                <tr>
                    <th><span>아이디</span></th>
                    <td>
                        <input type="text" name="m_id" id="m_id" maxlength="10">
                        <label class="idChkText"></label>
                    </td>
                </tr>

                <tr>
                    <th><span>비밀번호</span></th>
                    <td>
                        <input type="password" name="m_pw1" id="m_pw1" maxlength="20">
                        <label class="pwChkText1"></label>
                    </td>
                </tr>

                <tr>
                    <th><span>비밀번호 확인</span></th>
                    <td>
                        <input type="password" name="m_pw" id="m_pw">
                        <label class="pwChkText2"></label>
                    </td>
                </tr>

                <tr>
                    <th><span>닉네임</span></th>
                    <td>
                    	<input type="text" name="m_name" id="m_name" maxlength="10" >
                    	<label class="nameChkText"></label>
                   </td>
                	
                </tr>

                <tr>
                    <th><span>전화번호</span></th>
                    <td>
                        <input type="text" name="m_phone1" id="m_phone1" value="010" size="3" maxlength="3" style="text-align: center;"> - 
                        <input type="text" name="m_phone2" id="m_phone2" size="4" maxlength="4"> - 
                        <input type="text" name="m_phone3" id="m_phone3" size="4" maxlength="4">
                        <label class="phoneChkText"></label>
                    </td>
                </tr>

                <tr>
                    <th rowspan="2"><span>우편번호</span></th>
                    <td>
                        <input type="text" name="m_postnum" id="m_postnum" placeholder="우편번호" disabled>
                        <button type="button" id="addressFindBtn" onclick="postcode();">우편번호 찾기</button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="text" name="m_address" id="m_address" placeholder="상세주소1" size="50"><br>
                        <input type="text" name="m_detailed_address" id="m_detailed_address" placeholder="상세주소2" size="50">
                    </td>
                </tr>

                <tr>
                    <th rowspan="2"><span>이메일</span></th>
                    <td>
                        <input type="text" name="m_email1" id="m_email1" size="15"> @
                        <select name="m_email2" id="m_email2">
                            <option value="naver.com">naver.com</option>
                        </select>
                        <button type="button" id="getNumberBtn"  >인증번호받기</button>
                        
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="text" name="m_emailChkNumber" id="m_emailChkNumber" size="15" disabled>
                        <button type="button" id="getNumberChkBtn" disabled >인증하기</button>
                        <label class="emailChkText"></label>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <br>
                        
                        <button type="button" id="m_join" >가입하기</button>
                        <button type="button" id="homeBtn" onclick = "location.href = '/' ">홈</button>
                        <input type="reset" name="m_joinreset" id="m_joinreset" value="다시작성">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    