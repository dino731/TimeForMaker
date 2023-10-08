<%@ page import="java.util.ArrayList, main.java.product.model.vo.Product, main.java.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	ArrayList<Product> banlist = (ArrayList<Product>)request.getAttribute("banlist");
	//List<Product> pList = (List<Product>) request.getAttribute("productList");이거 나중에 클래스 상세페이지조회할때 필요 합칠때 주석풀기
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>main_loca_list</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon"
	href="/TimeForMaker/assets/img/TFM_icon.png">

<link rel="stylesheet" href="/TimeForMaker/assets/css/mypage_login.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">

<!-- 스타일 시트(슬기)-->
<link rel="stylesheet" href="/TimeForMaker/assets/css/user-header.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/product_list.css">



</head>

<body>

	<%@ include file="/views/common/user-header1.jsp" %>
	<!-- Start Content -->
	<br>
	<div class="container py-5 pl_class_all">
		<div class="row">
			<div>
				<img style="width: 100%; height: 300px; align-content: center;" class="img-fluid" src="/TimeForMaker/assets/img/inside-banner.jpg" alt="">
			</div>
			<h1 class="h2 pl_class_all_title">Time For Maker 추천 클래스</h1>
			<div class="col-12 mb-3">
				<div class="w-100 my-3 border-top border"></div>
			</div>

			<div class="pl_class_card_wrap">
				<%for(Product p : banlist) {
				 if (p.getFileLevel()==1) {
			%>
				<!--클래스 카드 전체부분-->
				<div class="pl_class_card_wrap_item">
				<input type="hidden" name="inputMainLocaPNo" value="<%= p.getProductNo() %>">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href="<%= request.getContextPath() %>/detail.product?pno=<%= p.getProductNo() %>"> 
						 <img class="pl_card-img rounded-0 img-fluid"
							src="<%= request.getContextPath() + p.getFileSavePath() + p.getFileName()%>">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name"><%= p.getClassName() %></a>
						<ul class="pl_class_card_key">
							<li><%= p.getClassCategory()%></li>
							<li><%= p.getClassKeyword()%></li>
						</ul>
						<p class="pl_class_card_price"><%= p.getPrice()%></p>
					</div>
				</div>
			<%}} %>
			</div>
			
		</div>
	</div>
	<!-- End Content -->
	<!-- Start Footer -->
	<footer class="main_footer" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> 서울특별시 강남구
							테헤란로14길6</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
						</li>
					</ul>
				</div>



			</div>


		</div>

		<div class="w-100 py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left">&copy; 2023 떡잎방범대 박수진 박지현 이아인 임재린 황슬기</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

	
</body>

</html>