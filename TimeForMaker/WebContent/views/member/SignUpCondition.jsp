<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUpCondition</title><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
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
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/mypage_signup.css">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
</head>
<body>

    <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="main.html">
            <img src="<%=contextPath %>/assets/img/메인로고.png" class="main_logo">
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link" href="LoginMain.html">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SignUpCondition.html">회원가입</a>
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
    <div class="user-login-wrapper">
      <div class="user-login-container">
        <!-- 회원가입 상단 바 시작 -->
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" > <span style="color:gray; font-size: 12px;">________________________　　　쉽고 간단한 로그인 및 회원 가입　　　________________________</span></a>
          </li>
        </ul>
        <div class="user-login-chapter">
          <span class="user-login-chap1">
           1
          </span>
          <span style="color: gray; font-size: 15px;">ㅡ</span>
          <span class="user-login-chap2">
            2
          </span>
          <span style="color: gray; font-size: 15px;">ㅡ</span>
          <span class="user-login-chap3">
            3
          </span>
        </div>
        <h5 style="margin-top: 15px;">회원가입 약관 동의하기</h5>
        <!-- 회원가입 상단 바 끝 -->

        <!-- 회원가입 폼 시작-->
        <div class="user-login-condition-wapper">
      
          <div class="user-login-title-wapper">
            <span class="user-login-condition-title">홈페이지 약관 동의</span>
            <span class="user-login-condition-must">(필수)</span>
          </div>
          <!-- 약관 문구 시작-->
          <div class="user-login-condition-contents">
            <p style="font-weight: 600; font-size: 17px !important;"> 타임포메이커는 고객님을 보호합니다.</p>
            <p style="font-size: 14px;">본 약관은 타임포메이커 홈페이지 서비스 이용과 관련하여<br>
              필요한 사항을 규정합니다.</p>
            <p style="font-weight: 600; font-size: 17px;">제 1장 총칙</p>
          </div>
          <!-- 약관 문구 끝-->

          <div class="user-login-title-wapper">
            <span class="user-login-condition-title">홈페이지 약관 동의</span>
            <span class="user-login-condition-must">(필수)</span>
          </div>
           <!-- 약관 문구 시작-->
          <div class="user-login-condition-contents">
            <p style="font-weight: 600; font-size: 17px;" >타임포메이커는 고객님을 보호합니다.</p>
              <p style="font-size: 14px;">본 약관은 타임포메이커 홈페이지 서비스 이용과 관련하여<br>
                필요한 사항을 규정합니다.</p>
            <p style="font-weight: 600; font-size: 17px;">제 1장 총칙</p>
            <!-- 약관 문구 끝-->
           

          </div>
           <!-- 동의 및 버튼 시작-->
           <span class="user-loginbtn">
            <button type="button" class="user-backbtn" onclick="location.href='LoginMain.jsp'">뒤로</button>
            <button type="submit" class="user-gobtn" onclick="location.href='SignUpUserInfo.jsp'">동의</button>
          </span>
           <!-- 동의 및 버튼 끝-->

        </div>
         <!-- 회원가입 폼 끝-->
          
      </div>
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
  <script src="<%=contextPath %>/assets/js/jquery-1.11.0.min.js"></script>
  <script src="<%=contextPath %>/assets/js/jquery-migrate-1.2.1.min.js"></script>
  <script src="<%=contextPath %>/assets/js/bootstrap.bundle.min.js"></script>
  <script src="<%=contextPath %>/assets/js/templatemo.js"></script>
  <!-- End Script -->
  
</body>
</html>