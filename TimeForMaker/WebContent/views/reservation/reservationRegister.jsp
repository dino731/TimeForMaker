<%@page import="main.java.reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Reservation r = (Reservation)request.getAttribute("r");
	//String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="assets/css/reservation_content.css">
    <link rel="stylesheet" href="assets/css/reservation_readmore.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%@ include file="/views/common/user-header1.jsp" %>

	<!-- 신규예약등록창 -->
	<div class="reservation_read_more">
	    <div class="reservation_read_more_details"><br>
	        <span id="reservation_read_more_details_title">
	            <img src="assets/img/정보.png" style="width: 6%;"> 예약 등록
	        </span>
	        <div id="reservation_read_more_details_info">
	        
	            <table>
					<form action="<%= contextPath %>/RsRegister.rs" method="GET">
		                <tr>
		                    <th>예약 번호</th>
		                    <td>-</td>
		                </tr>
		                <tr>
		                    <th>EMAIL(ID)</th>
		                    <td><input type="text" name="userId" id="read_more_details_info_email"></td>
		                </tr>
		                <tr>
		                    <th>클래스번호</th>
		                    <td><input type="text" name="productNo" id="read_more_details_info_className"></td>
		                </tr>
		                <tr>
		                    <th>예약 인원</th>
		                    <td><input type="number" name="userNum" id="read_more_details_info_classpeople"></td>
		                </tr>
		                <tr>
		                    <th>예약 일자</th>
		                    <td><input type="date" name="reservationDate" id="read_more_details_info_classdate"></td>
		                </tr>
		                <<!-- tr>
		                    <th>예약 시간</th>
		                    <td><input type="time" name="reservationTime" id="read_more_details_info_classtime"></td>
		                </tr> -->
		                <tr colspan="2">
							<input type="submit" value="등록" id="rs_modal_register">
		                </tr>
					</form>
	            </table>
				<form action="<%= contextPath %>/NewRegister.rs" method="POST">
					<input type="submit" value="닫기" id="rs_modal_close">
				</form>
				
	        </div>
	    </div>
	</div>

</body>
</html>