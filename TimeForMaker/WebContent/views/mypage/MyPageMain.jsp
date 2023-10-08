<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.ArrayList, java.util.Date, com.google.gson.Gson, com.google.gson.reflect.TypeToken, 
    main.java.member.model.vo.Member, main.java.mypage.model.vo.MyPage, java.time.LocalDate, java.text.SimpleDateFormat"
%>
<%
    String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String userId = loginUser.getUserId();
	String userName = loginUser.getUserName();
	
	ArrayList<MyPage> mmrlist = (ArrayList<MyPage>) session.getAttribute("mmrlist");
	ArrayList<MyPage> mdonelist = (ArrayList<MyPage>) session.getAttribute("mdonelist");
	
	System.out.println("test jsp mmrlist : " + mmrlist);
	System.out.println("test jsp mdonelist : " + mdonelist);
	
	MyPage firstDoneReservation = null; // 첫 번째 완료 예약 객체 선언
	
	if (mdonelist != null && !mdonelist.isEmpty()) {
	    firstDoneReservation = mdonelist.get(0);
	}
	
	Date doneReservationDate = null;
	String doneReservationTime = null;
	int doneUserNum = 0;
	String doneProductNo = null;
	Long doneReservationNo = null;
	String doneReservationStatus = null;
	String donePaymentStatus = null;
	String doneClassName = null;
	
	// 첫 번째 완료 예약 객체가 null이 아닌 경우 변수에 값을 할당
	if (firstDoneReservation != null) {
	    doneReservationDate = firstDoneReservation.getReservationDate();
	    doneReservationTime = firstDoneReservation.getReservationTime();
	    doneUserNum = firstDoneReservation.getUserNum();
	    doneProductNo = firstDoneReservation.getProductNo();
	    doneReservationNo = firstDoneReservation.getReservationNo();
	    doneReservationStatus = firstDoneReservation.getReservationStatus();
	    donePaymentStatus = firstDoneReservation.getPaymentStatus();
	    doneClassName = firstDoneReservation.getClassName();
	}
	
	MyPage firstReservation = null; // 첫 번째 예약 객체 선언
	
	// mmrlist가 null이 아니고 비어 있지 않은 경우 첫 번째 예약 객체를 가져옴
	if (mmrlist != null && !mmrlist.isEmpty()) {
	    firstReservation = mmrlist.get(0);
	}
	
	Date reservationDate = null;
	String reservationTime = null;
	int userNum = 0;
	String productNo = null;
	Long reservationNo = null;
	String reservationStatus = null;
	String paymentStatus = null;
	String className = null;
	
	// 첫 번째 예약 객체가 null이 아닌 경우 변수에 값을 할당
	if (firstReservation != null) {
	    reservationDate = firstReservation.getReservationDate();
	    reservationTime = firstReservation.getReservationTime();
	    userNum = firstReservation.getUserNum();
	    productNo = firstReservation.getProductNo();
	    reservationNo = firstReservation.getReservationNo();
	    reservationStatus = firstReservation.getReservationStatus();
	    paymentStatus = firstReservation.getPaymentStatus();
	    className = firstReservation.getClassName();
	}
	
	ArrayList<MyPage> myReservList = new ArrayList<>();
	if (mmrlist != null) {
	    for (MyPage r : mmrlist) {
	        if (r.getUserId().equals(userId) && userId.equals((String) session.getAttribute("userId"))) {
	            myReservList.add(r);
	        }
	    }
	}
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


%>

<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
    <title>MyPageMain</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        const contextPath = "<%= request.getContextPath() %>";
    </script>

    <link rel="apple-touch-icon" href="<%=contextPath %>/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath %>/assets/img/favicon.ico">

    <link rel="stylesheet" href="<%=contextPath %>/assets/css/user-header.css">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/mypage_main.css">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        const userId = "<%=userId%>"; // 사용자의 userId
        function getReservationData() {
            $.ajax({
                type : "post",
                url : '<%=contextPath%>/mymainreserv.me', // 요청을 보낼 서블릿 경로
                data : {"userId" : userId},
                success : function(data) {
                	console.log("요청 성공: " + data);
                	sessionStorage.setItem("mmrlist", data);
                },
                error : function(xhr, status, error) {
                    console.log("Ajax 요청 에러: " + error);
                }
            });
        $.ajax({
            type : "post",
            url : '<%=contextPath%>/mymaindone.me', // 요청을 보낼 서블릿 경로
            data : {"userId" : userId},
            success : function(data) {
            	console.log("요청 성공: " + data);
            	sessionStorage.setItem("mdonelist", data);
            },
            error : function(xhr, status, error) {
                console.log("Ajax 요청 에러: " + error);
            }
        });
   	 }

        // 페이지 로드 시 Ajax 요청 실행
        $(document).ready(function() {
            getReservationData();
        });
    </script>
    
</head>

<body>



	<script>
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
			// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
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
	                        <a class="nav-link" onclick="loginCheck();" href="<%= contextPath %>/noticeBoard" >고객센터</a>
	                    </li>
	                    
                    <%}else{ //로그인했을때%>
	                    <li class="nav-item">
	                        <a class="nav-link" href="<%=contextPath %>/Logout.me">로그아웃</a>
	                    </li>
	                     <li class="nav-item">
	                        <a class="nav-link" href="<%= contextPath %>/noticeBoard">고객센터</a>
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
				                    <a class="main_admin_link" href="<%= contextPath %>/noticeBoard">고객센터관리</a>
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
	

	<!-- Start Content -->
	
	<div class="mypage-main-wrapper">
		<!-- 마이페이지 왼쪽 사이드, 시작 -->
		<div class="mypage-main-sidemenu">
			<div class="mypage-sidemenu-title">
				<h5>마이페이지</h5>
				<span><a href="<%= contextPath %>/views/mypage/MyPageMain.jsp">나의
						예약</a></span><br> <span><a
					href="<%= contextPath%>/views/mypage/MyPageEditInfo.jsp">내 정보
						수정</a></span> <%-- <br> <span><a
					href="<%= contextPath%>/views/member/SignUpKeyword.jsp">키워드 등록</a></span><br>
				<span><a onclick="mypage_Withdrawal()">회원탈퇴</a></span><br> --%>
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
				<!-- <img class="mypage-profile-image" src="path/to/profile-image.jpg" alt="프로필 사진"> -->
				<div class="mypage-profile-content">
					<h5>안녕하세요</h5>
					<span><%=userName %>님 <span>😊</span></span>
				</div>

			</div>
			<!-- 마이페이지 프로필 끝-->

			<!-- 마이페이지 메뉴바 시작-->
			<div class="mypage-main-list">
				<div class="mypage-list-title">
					<div class="mypage-list-menu">
						<a href="<%= contextPath%>/views/mypage/MyPageMain.jsp">방문 내역</a>
						<div class="mypage-list-line1"></div>
					</div>
					<div class="mypage-list-menu">
						<a href="<%= contextPath%>/views/mypage/MyPageReservStatus.jsp">나의 예약</a>
						<div class="mypage-list-line2"></div>
					</div>
					<div class="mypage-list-menu">
						<a href="<%= contextPath%>/views/mypage/MyPageEditInfo.jsp">내
							정보 수정</a>
						<div class="mypage-list-line3"></div>
					</div>
				</div>

			</div>
			<!-- 마이페이지 메뉴바 끝-->
	
			<!-- 방문 예정 리스트 시작-->
			<div class="mypage-appointment-list-wrapper">
				<div class="mypage-appointment-list-container">
					<span>
						<h4>방문 예정 클래스</h4>
					</span>
					<% if(mmrlist != null){ %>
						<% for(int i = 0; i<mmrlist.size(); i++){ %>
					<div class="mypage-appointment-list">
						<div class="mypage-appointment-list-img" onclick="location.href='<%=contextPath%>/detail.product?pno=<%=mmrlist.get(i).getProductNo()%>'">
							<img src="<%=contextPath %><%= mmrlist.get(i).getFileSavePath() %><%= mmrlist.get(i).getFileName()%>">
							
						</div>
						<div class="mypage-appointment-text-container">
							<span class="mypage-appointment-list-title" onclick="location.href='<%=contextPath%>/detail.product?pno=<%=mmrlist.get(i).getProductNo()%>'"><%= mmrlist.get(i).getClassName() %></span> <br> 
							<span class="mypage-appointment-list-keyword"><%= mmrlist.get(i).getClassKeyword() %></span> 
							<br> 
								<span class="mypage-appointment-list-time"><%= mmrlist.get(i).getReservationDate() %>&ensp;<%= mmrlist.get(i).getReservationTime() %> </span> &ensp;
								<span class="mypage-appointment-list-rpeople"> <%= mmrlist.get(i).getUserNum() %>명
							</span>
						</div>
						<div class="mypage-appointment-list-cancel">
							<button class="mypage-btn-cancel" onclick="mypage_delete();">결제취소</button>
						</div>
					</div>
					<% } %>
		
				<% } %>
						
						
					<div class="mypage-appointment-list-container">
						<span>
							<h4>방문 완료 클래스</h4>
						</span>
						<% if(mdonelist != null){ %>
							<% for(int i = 0; i<mdonelist.size(); i++){ %>
						<div class="mypage-appointment-list-container">
							<div class="mypage-appointment-list-img" onclick="location.href='<%=contextPath%>/detail.product?pno=<%=mdonelist.get(i).getProductNo()%>'">
								<img src="<%=contextPath %><%= mdonelist.get(i).getFileSavePath() %><%= mdonelist.get(i).getFileName()%>">
							</div>
							<div class="mypage-appointment-text-container">
								<span class="mypage-appointment-list-title" onclick="location.href='<%=contextPath%>/detail.product?pno=<%=mdonelist.get(i).getProductNo()%>'"><%= mdonelist.get(i).getClassName() %></span> <br> 
								<span class="mypage-appointment-list-keyword"><%= mdonelist.get(i).getClassKeyword() %></span> 
								<br> 
									<span class="mypage-appointment-list-time"><%= mdonelist.get(i).getReservationDate() %>&ensp;<%= mdonelist.get(i).getReservationTime() %> </span> &ensp;
									<span class="mypage-appointment-list-rpeople"> <%= mdonelist.get(i).getUserNum() %>명
								</span>
							</div>
							
						</div>
								<% } %>
						<% } %>
					<% session.removeAttribute("mmrlist"); %>
					
				</div> <!-- mypage-appointment-list-wrapper  -->
				
			</div>
			
				
		
			
	</div>
		
			<!-- 방문 예정 리스트 끝-->


	
			<!-- 완료한 클래스 끝 -->
			<!-- 방문 예정 리스트 끝-->


			<!-- 결제 취소 모달창 시작-->
			<div class="mypage_delete_more">
				<div class="mypage_delete_more_check">
					<br> <b>결제를 취소합니까?</b><br>
					<button class="mypage_delete_more_check_yes"
						onclick="mypage_delete_more_check_yes();">예</button>
					<button class="mypage_delete_more_check_no"
						onclick="mypage_delete_more_check_no();">아니요</button>
				</div>
			</div>
			<!-- 결제 취소 모달창 끝-->

		
		</div>
		<!-- 마이페이지 중앙 몸덩어리 끝-->
	</div>
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
	<script src="<%=contextPath %>/assets/js/mypage_withdrawal_modal.js"></script>
	<script src="<%=contextPath %>/assets/js/jquery-1.11.0.min.js"></script>
	<script src="<%=contextPath %>/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=contextPath %>/assets/js/bootstrap.bundle.min.js"></script>
	<script src="<%=contextPath %>/assets/js/templatemo.js"></script>

	

</body>
</html>