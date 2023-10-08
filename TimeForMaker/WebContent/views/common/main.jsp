<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="main.java.member.model.vo.Member,main.java.product.model.vo.Product,
	java.util.ArrayList,main.java.member.model.vo.UserKeyword"%>
<%@ page import="main.java.product.model.vo.Product" %>
<%@ page import="main.java.product.model.vo.File" %>
<%@ page import="java.util.*" %>
	<%
    List<Product> pList = (List<Product>) request.getAttribute("productList");
    List<File> fList = (List<File>) request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>TFM_main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">
<link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="/TimeForMaker/assets/css/fontawesome.min.css">

<!-- 메인에서 지역, 추천 슬라이드 바 만드는 슬릭 링크 시작 (황슬기 추가)-->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TimeForMaker/assets/css/slick.min.css">
<link rel="stylesheet" type="text/css"
	href="/TimeForMaker/assets/css/slick-theme.css">

<!--슬릭 링크 끝(슬기)-->
<!--메인 css링크 (슬기) 위에 슬릭 링크 뒤에 있어야 마지막 버튼 스타일이 먹힘..!-->

<link rel="stylesheet" href="/TimeForMaker/assets/css/main.css">
<!--이건 메인 바디부분 css-->
</head>
<style>
</style>
<body>
	<%@ include file="user-header1.jsp"%>
	<%
		String userId=null;
			if(loginUser!=null){
			   	userId =loginUser.getUserId();	
			}
			System.out.println("userid: " + userId);

		ArrayList<UserKeyword> recomlist = (ArrayList<UserKeyword>) session.getAttribute("recomlist");
		System.out.println("recomlist: " + recomlist);
	%>


	<!-- Start Banner Hero -->
	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="1"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="2"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="main_banner">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<a href="#">
							<img class="img-fluid" src="/TimeForMaker/assets/img/찐메인배너1.png"
								alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="main_banner">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<a href="<%=contextPath %>/banner.ma?ban=음식"> 
							<img class="img-fluid"	src="/TimeForMaker/assets/img/찐메인배너2.png" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="main_banner">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 align-items-center">
						<a href="<%=contextPath %>/banner.ma?ban=반려동물">						
							<img class="img-fluid" src="/TimeForMaker/assets/img/찐메인배너3.png" alt="">
						</a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="main_banner">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 align-items-center">
						<a href="<%=contextPath %>/banner.ma?ban=플라워">
							<img class="img-fluid" src="/TimeForMaker/assets/img/찐메인배너4.png"
								alt="">
						</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>
	<!-- End Banner Hero -->

	<div class="main_all">
		<!-- 배너 뒤로 이어지는 부분-->
		<!-- 여기서부터 지역별  -->
		<section class="container py-5">
			<div class="main_loca">
				<div class="main_loca_title">
					<h4>어느 지역을 찾으시나요?</h4>
				</div>
				<div class="main_loca_item_bar">
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=강남구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706apgujeong.jpg?small200&quot;);">
							<span class="label">강남구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=용산구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706itaewon.jpg?small200&quot;);">
							<span class="label">용산구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=성동구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706sungsoo.jpg?small200&quot;);">
							<span class="label">성동구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=종로구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706gwanghwamun.jpg?small200&quot;);">
							<span class="label">종로구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=중구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706euljiro_0331.jpg?small200&quot;);">
							<span class="label">중구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=마포구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md_2022/0609_location_hapjeong,mangwon.png?small200&quot;);">
							<span class="label">마포구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=관악구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706hongdae.jpg?small200&quot;);">
							<span class="label">관악구</span>
						</a>
					</div>
					<div class="main_loca_item">
						<a href="<%=contextPath %>/locasearch.ma?clo=영등포구"
							style="background-image: url(&quot;https://d21sjc85fy47a6.cloudfront.net/aaaaaqx/md/0706yeouido.jpg?small200&quot;);">
							<span class="label">영등포구</span>
						</a>
					</div>

				</div>
			</div>
		</section>
		<!-- 지역별 끝 -->

		<!-- 추천 하드코딩^^ ㅠㅠ -->
		<section class="container py-5">
			<div class="main_recom">
				<div class="main_recom_title">
					<h4>이런 클래스는 어떠세요?</h4>
				</div>
				<div class="main_recom_item_bar">
					<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=13"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= contextPath%>/assets/img/Classimg/a_6_1.jpg">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name">왁스디오라마 클래스 현실 세계 축소판</a>
								<ul class="main_class_key">
									<li>핸드메이드</li>
									<li>캔들</li>
								</ul>
								<p class="main_class_price">50000₩</p>
							</div>
						</div>	
					<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=2"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= contextPath%>/assets/img/Classimg/a_2_1.jpg">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name">자존감 스피치 Theme1</a>
								<ul class="main_class_key">
									<li>기타</li>
									<li>기타</li>
								</ul>
								<p class="main_class_price">20000₩</p>
							</div>
						</div>	
					<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=24"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= contextPath%>/assets/img/Classimg/c_3_1.jpg">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name">귀여운 베어브릭 만들기 체험</a>
								<ul class="main_class_key">
									<li>기타</li>
									<li>기타</li>
								</ul>
								<p class="main_class_price">30000₩</p>
							</div>
						</div>	
					<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=17"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= contextPath%>/assets/img/Classimg/b_4_1.jpg">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name">강아지 케이크 원데이 클래스</a>
								<ul class="main_class_key">
									<li>케이크</li>
									<li>음식</li>
								</ul>
								<p class="main_class_price">50000₩</p>
							</div>
						</div>	
					<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=10"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= contextPath%>/assets/img/Classimg/a_3_1.jpg">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name">커플링 우정링 반지만들기</a>
								<ul class="main_class_key">
									<li>반지</li>
									<li>핸드메이드</li>
								</ul>
								<p class="main_class_price">70000₩</p>
							</div>
						</div>
				</div>
			</div>
		</section>
		<!-- 키워드추천(로그인, 키워드 입력 고객만 보임 -->
		
		<% if(userId != null){ %>
		<% if(recomlist != null && !recomlist.isEmpty()){ %>
		<section class="container py-5">		
			<div class="main_recom">
				<div class="main_recom_title">
					<h4>고객님만을 위한 추천 클래스~!</h4>
				</div>
				<div class="main_recom_item_bar">	
					<%for (UserKeyword uk : recomlist) {
						 if (uk.getFileLevel()==1) {
					%>
						<div class="main_recom_item_wap">
							<div class="main_recom_item_img">
								<a href="<%= request.getContextPath() %>/detail.product?pno=<%= uk.getProductNo() %>"> 
								<img class="card-img rounded-0 img-fluid"
									src="<%= request.getContextPath() + uk.getFileSavePath() + uk.getFileName()%>">
								</a>
							</div>
							<div class="main_recom_item_body">
								<a class="main_class_name"><%=uk.getClassName()%></a>
								<ul class="main_class_key">
									<li><%=uk.getClassCategory() %></li>
									<li><%=uk.getClassKeyword() %></li>
								</ul>
								<p class="main_class_price"><%=uk.getPrice()%>₩</p>
							</div>
						</div>	
						<%} %>
						<%} %>				
					<% }else{ session.removeAttribute("recomlist");//키워드 안하면 세션에서 지워줌%>
					<%  } %>
			
				</div>
			</div>			
		</section>
		<%} %>
		<div class="main_allclass_btnarea">
			<button class="main_allbtn"
				onclick="window.location.href='<%=contextPath%>/productList'">
				더많은 클래스 보기</button>
		</div>
		<!-- 추천끝 -->
	</div>

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
	<script src="/TimeForMaker/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/TimeForMaker/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/TimeForMaker/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/TimeForMaker/assets/js/templatemo.js"></script>
	<!-- End Script -->

	<!-- 메인 지역별, 추천별 슬라이드 스크립트 시작(슬기)-->
	<script src="/TimeForMaker/assets/js/slick.min.js"></script>
	<script>
       //이건 지역별
       $('.main_loca_item_bar').slick({
            lazyLoad: 'ondemand',
            slidesToShow: 6,
            slidesToScroll: 1,
            prevArrow : '<i class="fas fa-chevron-left" style="visibility: hidden;"></i>',
		    nextArrow : '<i class="fas fa-chevron-right"></i>',
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1
                    }
                }
            ]
        });

       //이건 추천별

       $(function(){
			$('.main_recom_item_bar').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				prevArrow : '<i class="fas fa-chevron-left"></i>',		// 이전 화살표 모양 설정
				nextArrow : '<i class="fas fa-chevron-right"></i>',		// 다음 화살표 모양 설정
				draggable : true, 	//드래그 가능 여부 
				
				responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]

			});
  		})
    </script>

</body>

</html>