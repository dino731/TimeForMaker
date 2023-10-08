<%@page import="java.util.ArrayList"%>
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
<title>예약정보 상세보기</title>
    <link rel="stylesheet" href="assets/css/reservation_content.css">
    <link rel="stylesheet" href="assets/css/reservation_info_more.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%@ include file="/views/common/user-header1.jsp" %>
	<!-- 예약정보 상세보기 -->
	<div class="reservation_info_more">
	    <div class="reservation_info_more_details"><br>
	        <span id="reservation_info_more_details_title">
	            <img src="assets/img/수정.png" style="width:5%;"> 예약 정보
	       </span>
	       <div id="reservation_info_more_details_info">
	       <% if( r != null) {%>
	           <table>
	               <tr>
						<th>예약 번호</th>
						<td><%= r.getReservationNo() %></td>
	               </tr>
	               <tr>
	                   <th>성함</th>
	                   <td><%= r.getUserName() %></td>
	               </tr>
	               <tr>
	                   <th>예약 클래스명</th>
	                   <td><%= r.getClassName() %></td>
	               </tr>
	               <tr>
	                   <th>예약 인원</th>
	                   <td><%= r.getUserNum() %>명</td>
	               </tr>
	               <tr>
	                   <th>예약 일자</th>
	                   <td><%= r.getReservationDate() %></td>
	               </tr>
	               <tr>
	                   <th>예약 시간</th>
	                   <td><%= r.getReservationTime() %></td>
	               </tr>
	               <tr>
	                   <th>휴대폰번호</th>
	                   <td><%= r.getUserPhone()%></td>
	               </tr>
	               <tr>
	                   <th>EMAIL(ID)</th>
	                   <td><%= r.getUserId() %></td>
	               </tr>
	               <tr>
	                   <th>처리현황</th>
	                   <td><%= r.getReservationStatus() %>
	                       <span style="color: red; font-size: 10px;">(1일 전까지 미결제시 자동취소)</span>
	                   </td>
	               </tr>
		       <% } else { %>
		       		<tr colspan="9">
		       			<td>몰루입니다.</td>
		       		</tr>
		       <% } %>
	           </table>
	           <form action="<%= contextPath %>/MoreInfo.rs" method="POST">
		           <input type="submit" value="닫기" id="rs_more_modal_close">
	           </form>
	        </div>
	    </div>
	</div>


</body>
</html>