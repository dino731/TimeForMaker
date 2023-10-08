<%@ page import="main.java.product.model.vo.*" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Product p = (Product) request.getAttribute("selectedProduct");
    int selectedPersonInt = Integer.parseInt((String) session.getAttribute("selectedPerson"));
    String selectedOption = request.getParameter("option");
    String selectedDate = request.getParameter("date");
    String selectedImg = request.getParameter("img");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>결제 페이지</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <link rel="apple-touch-icon" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/assets/img/favicon.ico">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/templatemo.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/custom.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/slick-theme.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/PRO_PAYMENT.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- 슬릭 CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" /> -->

    <!-- 슬릭 JS -->
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>

<body>
<%@ include file="/views/common/user-header1.jsp" %>
<% 
/* if(loginUser!=null){
   	String userId=loginUser.getUserId();} */
 String userId="user2"; %>
<!-- 메인 div박스 시작-->
<div id="product-main">
    <div class="product-back" style="margin-left: 12%">
        <a class="product-a-underline" href="/PRO_DETAIL.html">
            <button type="button" class="arrow"></button>
            <p style="margin-left: 1%;">이전 페이지</p>
        </a>
    </div>
    <div id="product-main-box">
        <!-- 메인 left박스 시작-->
        <div id="product-left-box">

            <div class="product-payment-box">
                <div class="product-payment-topbar">
                    <p>클래스 정보</p>
                </div>

                <div class="product-payment-imgbox">
                    <img src="<%= selectedImg%>">
                </div>

                <div class="product-payment-textbox">
                    <span><b> 클래스 명</b></span> <br>
                    <span> <%= p.getClassName() + ", " + selectedOption%></span>
                </div>

                <div class="product-payment-textbox">
                    <span> <b>일시</b></span> <br>
                    <span><%= selectedDate%></span>

                </div>

                <div class="product-payment-textbox">
                    <span> <b>장소</b></span> <br>
                    <span> <%= p.getLocation()%></span>

                </div>

            </div>
        </div>
        <!-- 메인 left박스 끝-->


        <!-- 메인 center박스 시작-->
        <div id="product-center-box">
            <div class="product-center-refund-box">
                <div>
                    <div class="product-refund-topbar">
                        <span>취소 및 환불</span>
                        <button class="arrow2"></button>
                    </div>
                </div>

                <div class="product-refund-content">
                    날짜별 취소 및 환불 정책
                </div>

                <table class="product-refund-table">
                    <tr>
                        <td>클래스 4일 이전 취소</td>
                        <td>100% 환불</td>
                    </tr>

                    <tr>
                        <td>클래스 3일 전 취소</td>
                        <td>70% 환불</td>
                    </tr>

                    <tr>
                        <td>클래스 2일 전 취소</td>
                        <td>50% 환불</td>
                    </tr>

                    <tr>
                        <td>클래스 하루 전 또는 당일 취소</td>
                        <td style="color: red;">환불 불가</td>
                    </tr>
                </table>
            </div>

            <div class="product-center-payinfo-box">
                <div class="product-refund-topbar">
                    <span>결제 정보</span>
                </div>

                <div class="product-payinfo-content">
                    <div class="product-payinfo-content1">
                        <span>원데이 클래스 수강권 <%= selectedPersonInt%>매</span> <br>
                        <span style="float: right;"><%= String.format("%,d", p.getPrice())%> 원</span> <br>
                        <span style="float: right;"> x <%= selectedPersonInt %> 명</span> <br>
                        <hr style="width: 105%;">
                        <span style="float: right;"> 총 결제 금액 <%= String.format("%,d", (p.getPrice() * selectedPersonInt))%> 원</span> <br>
                    </div>


                    <%--                    <form action="ProductRes.jsp" method="post">--%>
                    <form action="<%= request.getContextPath() %>/views/product/ProductRes.jsp" method="post">

                        <%--    예약번호--%>
<%--                        <input type="hidden" name="RESERVATION_NO" value="reservation_seq.NEXTVAL">--%>
                            <input type="hidden" name="RESERVATION_NO" value="reservation_seq.NEXTVAL">

                        <%--    예약날짜--%>
                        <input type="hidden" name="RESERVATION_DATE" value="<%= selectedDate%>">
                        <%--    예약상태--%>
                        <input type="hidden" name="RESERVATION_STATUS" value="승인대기">
                        <%--예약시간--%>
                        <input type="hidden" name="RESERVATION_TIME" value="TO_CHAR(SYSDATE, 'JJ24:MI')">
                        <%--    결제여부--%>
<%--                        <input type="hidden" name="PAYMENT_STATUS" value="결제대기">--%>
                            <input type="hidden" name="PAYMENT_STATUS" value="결제대기">
                        <%--    유저넘버--%>
                        <input type="hidden" name="USER_NUM" value="<%=selectedPersonInt%>">
                        <%--    유저아이디--%>
                        <input type="hidden" name="USER_ID" value="<%=userId%>">
                        <%--    상품넘버--%>
                        <input type="hidden" name="PRODUCT_NO" value="<%= p.getProductNo()%>">


                        <div class="product-payinfo-pay">
                            <button class="product-paybtn">
                                <input type="submit" value="결제하기"
                                       style="animation: none; transition: none; color: inherit; background-color: inherit; border: none; cursor: pointer;">
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
		</div>
        <!-- 메인 center박스 끝-->
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


    <script>
        // arrow2 버튼 요소를 가져옵니다.
        const arrow2Btn = document.querySelector('.arrow2');

        // .product-center-refund-box 요소를 가져옵니다.
        const refundBox = document.querySelector('.product-center-refund-box');

        // 변수를 사용하여 요소의 현재 상태를 추적합니다.
        let isBoxExpanded = true;
        let originalHeight = refundBox.clientHeight;

        // arrow2 버튼 클릭 이벤트 리스너를 추가합니다.
        arrow2Btn.addEventListener('click', function () {
            // .product-refund-content와 .product-refund-table 요소를 가져옵니다.
            const refundContent = document.querySelector('.product-refund-content');
            const refundTable = document.querySelector('.product-refund-table');

            // 요소의 현재 visibility 상태를 확인합니다.
            const isVisible = refundContent.style.visibility !== 'hidden';

            // 요소의 visibility 속성을 토글합니다.
            refundContent.style.visibility = isVisible ? 'hidden' : 'visible';
            refundTable.style.visibility = isVisible ? 'hidden' : 'visible';

            // 요소의 크기를 토글합니다.
            if (isBoxExpanded) {
                refundBox.style.height = '75px';
            } else {
                refundBox.style.height = '';
            }

            // 변수 값을 반전시킵니다.
            isBoxExpanded = !isBoxExpanded;
        });


    </script>


</body>

</html>