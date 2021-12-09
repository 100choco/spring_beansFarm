<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/community/qna/qnaInsert.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/qna/qna.js" ></script>
<script src="../../../resources/js/qna/qnaUpload.js" ></script>

		
			<div id="con2">
                    <h1 class="contentTitle">1:1문의 글 작성하기</h1>

                    <br>
                    
					<div id="menu_m">
                        <ul>
                            <li class="notice"><a href="/noticeviews/notice_view">공지사항</a></li>
                            
                       <!-- 미 로그인시 qna 접근제어(로그인화면으로) -->
                       <c:choose>
                        	<c:when test="${adminID ne null && userID eq null}">
				               	<li><a href="/qnaviews/qna_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
				            
				            <c:when test="${adminID eq null && userID ne null}">
				               	<li><a href="/qnaviews/qna_user_view">1:1문의하기(Q&A)</a></li>
				            </c:when>
         
                        	<c:otherwise>
	                        	<li class="qna"><a href="/memberloginviews/memberLogin_view">1:1문의하기(Q&A)</a></li>
	                        </c:otherwise>
                        </c:choose> 

                            <li class="faq"><a href="/faqviews/faq_view">FAQ</a></li>
                        </ul>
                    </div>

                    
                    <br>
                    
					<!-- 입력폼 시작 -->
					
                    <form action="/qnaviews/qna_insert" method="post">
                    
                    <div id="table-container" class="table-container">
                        <table id="noticeTbl" class="noticeTbl">
                        
                        	<thead>
                            <tr>
                                <th width="15%">분류번호</th>
                                <th width="65%">문의 제목</th>
                                <th width="20%">작성자</th>
                            </tr>
                            </thead>
                            
                            <tbody>
                            <tr>
                                <td width="15%" data-title="분류 번호">
	                                <select name="ic_no" id="ic_no">
										<c:forEach var="dto" items="${dto}">
											<option value="${dto.ic_no}">${dto.ic_name}</option> 	
										</c:forEach>
									</select>
								</td>
								<td width="70%" data-title="문의 제목"><input type="text" name="q_title" id="q_title" size="100%" class="q_title" maxlength="100" required="required"></td>
								
								<!-- 입력시 작성자 이름 표기  -->
                                <td width="15%" data-title="작성자" id="writer">${userName}</td>
                                
                            </tr>
							</tbody>


                     		<tr>
                     			<td colspan="3" id="q_content_td" style="padding: 0;">
                     				<textarea rows="25" name="q_content" id="q_content" class="q_content"></textarea>  			
                     			</td>
                     			
                     		</tr>
                     		
                     		<tr>
                     			<td colspan="3">
	                     			<input type="file" id="q_image" name="q_image"><br><br>
                     				<span>첨부파일은 1개, jpg, png만 등록이 가능 합니다.</span>
                     			</td>
                     			
                     		</tr>
                     		
                        </table>
						</div>
						<%UUID uuid = UUID.randomUUID(); %>
						<input type="hidden" name="uuid" id="uuid" value="<%=uuid.toString()%>">
				 		<!-- 작성자 m_no 세션값으로 숨김 -->
                  			<c:if test= "${userNO ne null}">	                        
                       			<td><input type="hidden" name="m_no" id="m_no" value="${userNO}"></td>
                       		</c:if>
						
						
                        <div id="btnGroup">
	                        <input id="insertbtn" type="submit" value="작성하기" class="button2">
	                        <button type="button" onclick="location.href='/qnaviews/qna_view'" class="button2">돌아가기</button>
                        </div>
                        
                    </form>
					
                </div>



<!-- <script type="text/javascript">
$(document).ready(function() {

    $('#q_content').on('keyup', function() {

        if($(this).val().length > 1024) {

          $(this).val($(this).val().substring(0, 1024));
            alert("최대 글자 수를 초과하였습니다."); 
        }
    });
    
    $('#q_content').summernote({
    	
    	height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '내용을 입력해 주세요',	//placeholder 설정
        
		toolbar: [
		// [groupName, [list of button]]
			['fontname', ['fontname']],
			['fontsize', ['fontsize']],
			['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			['color', ['forecolor','color']],
			['table', ['table']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['insert',['picture','link','video']],
			['view', ['fullscreen', 'help']]
				  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		
	});

});
</script> -->
