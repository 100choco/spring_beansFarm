<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/adminSide.css">

<script src="https://kit.fontawesome.com/fea8ea66bc.js" crossorigin="anonymous"></script>
<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
	
	<div id="con1">
	
		<div id="managerImg">
			<a href="/adminviews/adminMain_view"><i class="fas fa-user-cog fa-5x"></i></a>
		</div>
			
		<div id="list">
			<ul>
				<li>
					<div id="pinsert"><a href="#" class="pBtn">제품등록 및 삭제</a></div>
					<div id="slide">
						<ul>
							<li><a href="/adminviews/adminOptionManage_view">옵션관리</a></li>
							<li><a href="/adminviews/adminProductManage_view">제품관리</a></li>
						</ul>
					</div>
				</li>
				<li class="list"><a href="#">제품 주문 현황</a></li>
				<li class="list"><a href="/adminviews/adminMemberList_view">회원 관리</a></li>
				<li class="list"><a href="/adminviews/memberShip/memberShip_view">회원멤버쉽 관리</a></li>
				<li class="list"><a href="/adminviews/coupon/couponGiftAll_view">회원 쿠폰 지급</a></li>
				<li class="list"><a href="/adminviews/ic_managed">고객센터 관리</a></li>
			</ul>
		</div>
		                
	</div>
	

<script type="text/javascript">
		$(function() {
			$("#slide").hide();
			$(".pBtn").on("click", function() {
				$("#slide").slideToggle();
			});
		});

</script>