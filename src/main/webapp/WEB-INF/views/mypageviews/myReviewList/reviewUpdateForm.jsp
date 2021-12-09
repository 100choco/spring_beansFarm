<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<meta charset="UTF-8">
<link rel="stylesheet" href="../../../../resources/css/view.css">
<link rel="stylesheet" href="../../../../resources/css/mypage/reviewWriteForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../../../../resources/js/reviewWriteForm_view.js" ></script>


	<div id="reviewWriteFormCenter">
	<form action="/mypageviews/myReviewList/reviewUpdate" method="post" id="reviewUpdate" enctype="multipart/form-data" > 
		<table class="mypageTabel">
			<tr >
				<td style="width: 20%">(사진)</td><td style="width: 80%">제품이름설명 </td>
			</tr>		
			<tr>
				
				<td style="width: 20%">후기제목</td>
				
				<td style="width: 80%">
				
				<input type="text" name="r_title" value="${dto.r_title}" style="width: 31.5rem">
				
				 </td>
			</tr>
			<tr>
				<td style="width: 20%">후기내용</td>
				
				<td style="width: 80%"> 
				
				<textarea name="r_content" style="resize:none;" rows="15" cols="70" name="r_content" wrap="hard" >${dto.r_content}</textarea>
				
				 </td>
			</tr>
			<tr>
				<td style="width: 20%">후기사진</td>
				<td style="width: 80%">
				
					<div class="uploadDiv">
				<!-- 사진은 하나만 받아옵니다 멀티플 제거 -->
					<div class="inputArea">
						 <label for="gdsImg">이미지</label>		<!-- 또는 accept=".jpg, .png" -->
						 <input type="file" id="r_photoupdate" name="r_photoupdate" accept="image/jpg, image/png" >
						
						
						 
						 <div class="select_img"><img src="/upload/review/${dto.r_thumbnail}" /></div>
						
						 <script>
						  $("#r_photoupdate").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $(".select_img img").attr("src", data.target.result).width(500);        
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						 </script>
						 
						</div>
					
				</div>
				
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
				
				</td>
			</tr>
			<tr>
				<td style="width: 20%">별점</td>
				<td style="width: 80%">
				
			<span class="star-input">
						<span class="input">
					    	<input type="radio" name="r_star" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="r_star" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="r_star" value="3" id="p3" checked>
					    	<label for="p3">3</label>
					    	<input type="radio" name="r_star" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="r_star" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
					  	<output for="star-input"><b>3</b>점</output>						
					</span>
				
				</td>
			</tr>
			
			
			
			<tr>
				<td>등록</td><td> <input type="submit" id="reviewUpdateCheck" value="수정하기"> </td>
			</tr>	
		</table>
		
				<input type="hidden" name="r_no" value="${dto.r_no}" readonly="readonly">
				<input type="hidden" name="m_no" value="${dto.m_no }" readonly="readonly"> 
				<input type="hidden" name="order_no" value="${dto.order_no }" readonly="readonly"> 
				
		</form>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
