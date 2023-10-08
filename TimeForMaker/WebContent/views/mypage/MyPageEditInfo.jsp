<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="main.java.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="apple-touch-icon" href="<%=contextPath %>/assets/img/apple-icon.png">
  <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath %>/assets/img/favicon.ico">

  <link rel="stylesheet" href="<%=contextPath %>/assets/css/user-header.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/mypage_main.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css">

  <!-- Load fonts style after rendering the layout styles -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css">

</head>
<body>
    <%
    	String userId = loginUser.getUserId();
    	String userName = loginUser.getUserName();
    	String userPhone = loginUser.getUserPhone() == null ? "" : loginUser.getUserPhone();
		String userNick = loginUser.getUserNick() == null ? "" : loginUser.getUserNick();
		String userPwd = loginUser.getUserPwd() == null ? "" : loginUser.getUserPwd();
    %>

    <!-- Header -->
    	   <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all admin_header">
    <div class="container d-flex justify-content-between align-items-center">
																			<!-- 여기에 메인페이지로 가는 길 -->
        <a class="navbar-brand text-success logo h1 align-self-center" href="#">
            <img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">                
                 <ul class="nav justify-content-end">
                 
                 	<%if(loginUser == null){//로그인 안했을때 실행부분%>
	                	<li class="nav-item">
	                        <a class="nav-link" href="<%= contextPath %>/views/member/LoginMain.jsp">로그인</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="<%= contextPath %>/views/member/SignUpCondition.jsp">회원가입</a>
	                    </li>
	                     <li class="nav-item">
	                        <a class="nav-link" onclick="loginCheck();" href="<%= contextPath %>/views/mypage/MyPageEditInfo.jsp" >고객센터</a>
	                    </li>
	                    
                    <%}else{ //로그인했을때%>
	                    <li class="nav-item">
	                        <a class="nav-link" href="<%=contextPath %>/Logout.me">로그아웃</a>
	                    </li>
	                     <li class="nav-item">
	                        <a class="nav-link" href="<%= contextPath %>/views/mypage/MyPageEditInfo.jsp">고객센터</a>
	                    </li>
       				<%} %>
                 </ul>                   
            </div>
       		
             <div class="navbar align-self-center d-flex login_check">
             	<a class="nav-icon d-none d-lg-inline login_check" href="#">
			           <i class="fa fa-fw fa-search text-dark mr-2"></i>
			      </a>
			      <a class="nav-icon position-relative text-decoration-none login_check" href="<%= contextPath %>/views/mypage/MyPageMain.jsp" onclick="handleUserLink();">
			           <i class="fa fa-fw fa-user text-dark mr-3"></i>
	              </a>          
		     </div>
		      
        </div>

    </div>
  		 	<%if(loginUser != null){//로그인 했을때 실행부분%>
				    <%String managerType =loginUser.getManagerType(); %>
	    			<%if(managerType.equals("M")){ %>      			
				    	<div class=" main_adminbar ">
				            <div class="main_admin_menu">
				                <li class="main_admin_li">
				                    <a class="main_admin_link" href="<%= contextPath %>/product.pd">상품관리</a>
				                </li>
				                <li class="main_admin_li">
				                    <a class="main_admin_link" href="<%= contextPath %>/reserve.rs">예약관리</a>
				                </li>
				                <li class="main_admin_li">
				                    <a class="main_admin_link" href="<%=contextPath %>/list.me">회원관리</a>
				                </li>
				                <li class="main_admin_li">
				                    <a class="main_admin_link" href="<%= contextPath %>/notice.nt">고객센터관리</a>
				                </li>
				            </div>
				        </div>
				  <%} %>
			<%} %>  
</nav>
	
<!-- Close Header -->

       <script>
		   // 로그인 상태에 따라 클릭 가능한 링크와 알림 메시지를 처리하는 함수
		   function handleUserLink() {
		      <% if (loginUser != null) { %>
		         // loginUser가 null이 아닌 경우, 링크 클릭 가능
		         const userLinks = document.getElementsByClassName("login_check");
		         for (const i = 0; i < userLinks.length; i++) {
		            userLinks[i].href = "#";
		         }
		     <% } else { %>
		         // loginUser가 null인 경우, 알림 메시지 표시
		         alert("로그인 후 사용 가능합니다.");
		         
		     <% } %>
		   }
		   
		   function loginCheck() {
		        alert("로그인 후 이용 가능합니다!");
		    }
	</script>
    
    <!-- start body -->
    
    <div class="mypage-main-wrapper">
       <!-- 마이페이지 왼쪽 사이드, 시작 -->
		<div class="mypage-main-sidemenu">
			<div class="mypage-sidemenu-title">
				<h5>마이페이지</h5>
				<span><a href="<%= contextPath %>/views/mypage/MyPageMain.jsp">나의
						예약</a></span><br> <span><a
					href="<%= contextPath%>/views/mypage/MyPageEditInfo.jsp">내 정보
						수정</a></span><br> <span><a
					href="<%= contextPath%>/views/member/SignUpKeyword.jsp">키워드 등록</a></span><br>
				<span><a onclick="mypage_Withdrawal()">회원탈퇴</a></span><br>
			</div>
			<div class="mypage-sidemenu-title">
				<h5>고객센터</h5>
				<span><a href="<%=contextPath %>/noticeBoard">공지사항</a></span><br> <span><a
					href="<%=contextPath%>/myReception">1:1문의</a></span><br>
			</div>

		</div>
		<!-- 마이페이지 왼쪽 사이드, 끝 -->


        <!-- 마이페이지 중앙 몸덩어리 시작-->
        <div class="mypage-main-container">
            <!-- 마이페이지 프로필 시작-->
            <div class="mypage-profile">
            <img class="mypage-profile-image"
					src="<%= contextPath%>/assets/img/마이페이지프로필사진1.png" alt="프로필 사진">
                <div class="mypage-profile-content">
                    <h5>안녕하세요</h5>
                    <span><%= userName %>님 <span>😊</span></span>
                </div>
               
            </div>
             <!-- 마이페이지 프로필 끝-->

             <!-- 마이페이지 메뉴바 시작-->
            <div class="mypage-main-list">
                <div class="mypage-list-title">
                    <div class="mypage-list-menu"><a href="<%=contextPath %>/views/mypage/MyPageMain.jsp">방문 내역</a>
                        <div class="mypage-list3-line1"></div>
                    </div>
                    <div class="mypage-list-menu"><a href="<%=contextPath %>/views/mypage/MyPageReservStatus.jsp">나의 예약</a>
                        <div class="mypage-list3-line2"></div>
                    </div>
                    <div class="mypage-list-menu"><a href="<%=contextPath %>/views/mypage/MyPageEditInfo.jsp">내 정보 수정</a>
                        <div class="mypage-list3-line3"></div>
                    </div>
                </div>
                
            </div>
            <!-- 마이페이지 메뉴바 끝-->

            <!-- 내 정보 수정 시작-->
            <div class="mypage-appointment-list-wrapper">

              <span style="margin: 30px 200px 4ch 40px; display: inline-block;"> <h4 style="font-weight: 600;">내 정보 수정</h4></span>
              

              
              <form action="<%=contextPath %>/myedit.me" method="post">
           

                <div class="mypage-editinfo-list-wrapper">
                  <div class="mypage-editinfo-list">
                    <h6>유저 아이디</h6>
                    <input type="text" name="userId" readonly value="<%= userId %>" style="border:none;"> 
                    
                    <h6> 이름 </h6>
                    <input type="text" name="userName" value="<%=userName%>" placeholder="변경할 이름을 입력해주세요">
                    
                    <h6> 새로운 비밀번호 <span style="color: red;">*</span></h6>
                    <input type="password" id="pwd1" name="userPwd"  placeholder="새로운 비밀번호를 입력해주세요">

                    <h6> 비밀번호 확인 <span style="color: red;">*</span></h6>
                    <input type="password" id="pwd2" name="checkPwd" onblur="validatePwd();" placeholder="비밀번호 재확인">

                    <h6> 닉네임 </h6>
                    <input type="text" id="userNick" name="userNick" value="<%=userNick%>" placeholder="변경할 닉네임을 입력해주세요">
                
                	<h6> 전화번호 변경 </h6>
                    <input type="text" name="userPhone" maxlength="11" value="<%=userPhone%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="- 제외한 숫자만 입력해주세요">
                    
                  
                    

                    <span class="user-loginbtn2">
                      <button type="button" class="user-backbtn" onclick="location.href='<%=contextPath %>/views/mypageView/mypage/MyPageMain.jsp'">취소</button>
                      <button type="submit" class="user-gobtn" >확인</button>
                    </span>
                  </div>
                </div>
              </form>

            </div>

            </div>
           
        </div>
        <!-- 내 정보 수정 끝-->

      	<!-- 회원 탈퇴 모달창 시작 -->
			<div class="mypage_Withdrawal_more">
				<div class="mypage_Withdrawal_more_check">
					<br> <b>정말 회원 탈퇴하시나요?</b><br> 
					<span class="mypage_Withdrawal_contents">
						<h6>회원 탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h6>
						<p>
							- 회원 탈퇴시 회원전용 웹 서비스 이용이 불가합니다.<br>- 거래정보가 있는 경우, 전자상거래 등에서의
							소비자 보호에 관한 법률에따라 계약 또는 청약 철회에 관한 기록, 대금결제 및 재화 등의 기록은 5년동안 보존됩니다.<br>-
							이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.
						</p>
					</span>
					<form action="<%= contextPath %>/delete.me" method="post">
						<span>비밀번호 입력 :</span> <input type="password" name="userPwd"
							required> <br>
						<button type="submit" class="mypage_Withdrawal_more_check_yes">탈퇴하기</button>
						<button class="mypage_Withdrawal_more_check_no"
							onclick="mypage_Withdrawal_more_check_no();">아니요</button>
					</form>
				</div>

			</div>

			<!-- 회원 탈퇴 안내 성공 모달창 -->
			<div class="mypage_Withdrawal_final">
				<div class="mypage_Withdrawal_final_check">
					<br> <b>정말 회원 탈퇴하시나요?</b><br> <span
						class="mypage_Withdrawal_contents"> <img
						src="../../assets/img/탈퇴아이콘-removebg-preview.png" width="100px"
						height="100px" style="margin-bottom: 15px;">
						<h3>회원 탈퇴 성공</h3>
						<h6>회원 탈퇴가 완료되었습니다.</h6>
					</span>
					<button class="mypage_Withdrawal_final_check_yes"
						onclick="mypage_Withdrawal_final_check_yes();">로그인 페이지로
						돌아가기</button>

				</div>
			</div>
			<!-- 회원 탈퇴 안내 성공 모달창 -->
    
    <!-- close body -->


    <!-- Start Footer -->
    <footer class="main_footer" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <img src="<%=contextPath %>/assets/img/메인로고.png" class="main_logo">
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            서울특별시 강남구 테헤란로14길6
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        </li>
                    </ul>
                </div>
            </div>

           
        </div>

        <div class="w-100 py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left">
                            &copy; 2023 떡잎방범대 박수진 박지현 이아인 임재린 황슬기
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

  <!-- Start Script -->
  
  	<script src="<%=contextPath %>/assets/js/jquery-1.11.0.min.js"></script>

	<script>
		function validatePwd() {
			if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	
	</script>
    <script src="<%=contextPath %>/assets/js/mypage_withdrawal_modal.js"></script>
    <script src="<%=contextPath %>/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=contextPath %>/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%=contextPath %>/assets/js/templatemo.js"></script>
  <!-- End Script -->
  
  
</body>
</html>