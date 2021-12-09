<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/mypage/reviewWriteForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../../../../resources/js/reviewWriteForm_view.js" ></script>
<div id="reviewWriteFormCenter">
	
	<h3>후기작성</h3>
	<form action="/mypageviews/myReviewList/reviewInsert" method="post" id="reviewWriteForm" enctype="multipart/form-data"> 
		<table class="mypageTabel">
			<tr >
				<td style="width: 20%">(사진)</td><td style="width: 80%">제품이름설명 </td>
			</tr>		
			<tr>
				
				<td style="width: 20% ">후기제목</td>
				
				<td style="width: 80%">
				
				<input type="text" name="r_title" class="r_title">
				
				 </td>
			</tr>
			<tr>
				<td style="width: 20%">후기내용</td>
				
				<td style="width: 80%"> 
				
				<textarea style="resize:none;" rows="15" cols="70" name="r_content" wrap="hard" ></textarea>
				
				 </td>
			</tr>
			<tr>
				<td style="width: 20%">후기사진</td>
				<td style="width: 80%">
				<div class="uploadDiv">
				<!-- 사진은 하나만 받아옵니다 멀티플 제거 -->
					<div class="inputArea">
						 <label for="gdsImg">이미지</label>		<!-- 또는 accept=".jpg, .png" -->
						 <input type="file" id="r_photo" name="file" accept="image/jpg, image/png"/>
						 <div class="select_img"><img id="emg" src="" /></div>
						
						 <script>
						  $("#r_photo").change(function(){
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
				<td>등록</td>
				<td> 
				<input type="hidden" name="order_no" value="${order_no}"> 
				<input type="hidden" name="m_no" value="${userNO}" readonly="readonly"> 
				<input type="submit" value="등록하기" id="reviewFinalCheck"> 
				</td>
			</tr>	
			
		</table>
		</form>
	</div>