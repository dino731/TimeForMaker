<%@page import="java.sql.Date"%>
<%@ page import="java.util.ArrayList, main.java.member.model.vo.Member, main.java.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Member mem = (Member) request.getAttribute("mem");
		
	//Member m = new Member();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>memberUpdate</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">

    <link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">

    <!--메인 css링크 (슬기)-->
    <link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css"><!--유저 헤드+푸터 부분css-->
    <link rel="stylesheet" href="/TimeForMaker/assets/css/member.css"><!--이건 메인 바디부분 css-->

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">

</head>
<style>
    .ad_userUpdate{
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        box-sizing: border-box;
        border-radius: 10px;
        background-color: #FAF0E4;
        width: 100%;
        height: 440px;
        z-index: 9992;
        text-align: center;
    }
</style>
<body>
    <%@ include file="/views/common/user-header1.jsp" %>
    

    <div class="adminmemberupdate_all">
        <section class="container py-5 "> <!-- 컨테이너가 상단바에 맞춰서 중간 정렬-->
                <br><br><br><br><br><h4 align="center">회원 정보 수정</h4>
            <form action="<%=contextPath %>/adminmemupdate.me"  class="ad_userUpdate" method="post">
                <br>
                <input type="hidden" name="uno" value="<%= mem.getUserNo()%>">	
                아이디&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userId" readonly value="<%=mem.getUserId()%>"><br><br>
               
                이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" required value="<%=mem.getUserName()%>"><br><br>
                
                닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userNick"  required value="<%=mem.getUserNick()%>"><br><br>
         
                휴대전화&nbsp;<input type="text" name="userPhone" placeholder="- 빼고 입력" value="<%=mem.getUserPhone()%> "><br><br>

                매니저(M)/사용자(U)&nbsp;<input type="text" name="managerType" required value="<%= mem.getManagerType() %> " ><br><br>

                
                <div class="ad_userUpdate_btn">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="ad_userUpdate_btn">수정</button>&nbsp;&nbsp;
                <button class="ad_userUpdate_close_btn" href="<%=contextPath %>/list.me" >뒤로가기</button>
                </div>
            </form>

        
	</div>
	
    <!-- Start Script -->
    <script src="/TimeForMaker/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/TimeForMaker/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/TimeForMaker/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/TimeForMaker/assets/js/templatemo.js"></script>
    <!-- End Script -->
</body>

</html>