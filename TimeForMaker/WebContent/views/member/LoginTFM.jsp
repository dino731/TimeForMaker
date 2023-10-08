<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="main.java.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전이라면 loginUser에는 null값이 담겨있을 것이고
	// 로그인성공 후라면, loginUser에는 로그인한 회원의 정보가 담긴 Member객체가 들어가 있을것.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="apple-touch-icon" href="<%=contextPath%>/assets/img/apple-icon.png">
  <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath%>/assets/img/favicon.ico">

  <link rel="stylesheet" href="<%=contextPath%>/assets/css/user-header.css">
  <link rel="stylesheet" href="<%=contextPath%>/assets/css/mypage_login.css">
  <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=contextPath%>/assets/css/templatemo.css">

  <!-- Load fonts style after rendering the layout styles -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
  <link rel="stylesheet" href="<%=contextPath%>/assets/css/fontawesome.min.css">
 

 
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
  <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="<%=contextPath %>/views/common/main.jsp">
            <img src="<%=contextPath%>/assets/img/메인로고.png" class="main_logo">
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=contextPath%>/views/mypage/member/LoginMain.jap">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=contextPath%>/views/mypage/member/SignUpCondition.jsp">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">고객센터</a>
                    </li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex">
                <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                    <i class="fa fa-fw fa-search text-dark mr-2"></i>
                </a>
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-user text-dark mr-3"></i>
                </a>
            </div>
        </div>

    </div>
</nav>
<!-- Close Header -->
<!-- Modal 헤드에 검색 누르면 나오는 모달  -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
      <div class="w-100 pt-1 mb-5 text-right">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="" method="get" class="modal-content modal-body border-0 p-0">
          <div class="input-group mb-2">
              <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
              <button type="submit" class="input-group-text bg-success text-light">
                  <i class="fa fa-fw fa-search text-white"></i>
              </button>
          </div>
      </form>
  </div>
</div>


    <!-- start body -->
    <div class="user-login2-wrapper">
        <div class="user-login2-tfmlogin-area">
        	<% if(loginUser == null){ %>
            <form method="post" action="<%= request.getContextPath()%>/login.me" class="login-form">
                <span style="font-size: 14px; font-weight: 600; display: block;">회원 아이디</span>
                <input type="text" name="userId" placeholder="아이디를 입력하세요" class="user-login">
                
                <span style="font-size: 14px; font-weight: 600; display: block;">비밀번호</span>
                <input type="password" name="userPwd" placeholder="Password" class="user-login">
                <span class="user-loginbtn">
                    <button type="button" class="user-backbtn" onclick="goMain();">뒤로</button>
                    <button type="submit" class="user-gobtn">로그인</button>
                    <!-- <input type="submit" value="" -->
                </span>

            </form>
            <script>
            const contextPath = request.getContextPath();
            	function goMain(){
            		location.href = "<%=contextPath%>/views/common/main.jsp";
            	}
            </script>
            <% }else{ %>
				  <script>
				    location.href = "<%=contextPath%>/views/common/main.jsp"; // 링크로 이동
				  </script>
				   <!-- 확인 클릭시 다음 페이지로 넘어가기 스크립트 끝-->
            	
            <% } %>

        </div>
        

    </div>

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



<!-- close body -->


  
  <script src="<%=contextPath %>/assets/js/jquery-1.11.0.min.js"></script>
  <script src="<%=contextPath %>/assets/js/jquery-migrate-1.2.1.min.js"></script>
  <script src="<%=contextPath %>/assets/js/bootstrap.bundle.min.js"></script>
  <script src="<%=contextPath %>/assets/js/templatemo.js"></script>
  <!-- End Script -->
  
</body>

</html>