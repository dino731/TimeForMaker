<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="main.java.member.model.vo.Member"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUpUserInfo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="apple-touch-icon" href="<%=contextPath %>/assets/img/apple-icon.png">
  <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath %>/assets/img/favicon.ico">

  <link rel="stylesheet" href="<%=contextPath %>/assets/css/user-header.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/mypage_signup.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css">

  <!-- Load fonts style after rendering the layout styles -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
  <link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css">
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
                        <a class="nav-link" href="LoginMain.jsp">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SignUpCondition.jsp">회원가입</a>
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
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" > <span style="color:gray; font-size: 12px;">________________________　　　쉽고 간단한 로그인 및 회원 가입　　　________________________</span></a>
          </li>
        </ul>
        <div class="user-login-chapter">
          <span class="user-login3-chap1">
           1
          </span>
          <span style="color: gray; font-size: 15px;">ㅡ</span>
          <span class="user-login3-chap2">
            2
          </span>
          <span style="color: gray; font-size: 15px;">ㅡ</span>
          <span class="user-login3-chap3">
            3
          </span>
        </div>
        <h5 style="margin-top: 15px;">가입 정보 입력하기</h5>

        <div class="user-login-condition-wapper">
        
          <form class="user-login-condition" action="<%= contextPath %>/insert.me" method="post">
            

 			  <h6> 아이디 <span style="color: red;">*</span> </h6>
              <input type="text" name="userId" style="width: 345px;" placeholder="아이디를 입력해주세요" required>
              <button type="button" onclick="idCheck();" style="width: 100px; height:30px; border-radius: 5px; border: none; background-color: #f7e8ad; color: rgb(85, 85, 85); font-size: 12px;">
			  중복확인</button>
			  
			  <h6> 이름 <span style="color: red;">*</span></h6>
              <input type="text" name="userName" placeholder="이름을 입력해주세요" required>
			  

              <h6> 비밀번호 <span style="color: red;">*</span></h6>
              <input type="password" id="pwd1" name="userPwd" placeholder="비밀번호를 입력해주세요" required>

              <h6> 비밀번호 확인 <span style="color: red;">*</span></h6>
              <input type="password" id="pwd2" name="checkPwd" onblur="validatePwd();" placeholder="비밀번호 재확인" required>

				<h6> 닉네임 <span style="color: red;">*</span></h6>
              <input type="text" name="userNick" placeholder="닉네임을 입력해주세요" required>
             
			  
			  <h6> 전화번호 <span style="color: red;">*</span></h6>
              <input type="text" name="userPhone" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="- 제외한 숫자만 입력해주세요" required>
              

              <span class="user-loginbtn">
                <button type="button" class="user-backbtn" onclick="location.href='LoginMain.jsp'">취소</button>
                <button type="submit" class="user-gobtn">확인</button>
              </span>
          </form>
        </div>
      </div>
    </div>


	<script>
    
    	function idCheck(){
    		const $userId = $(".user-login-condition input[name=userId]");
    		$.ajax ({
    			url : "<%=contextPath%>/idCheck.me",
    			data : {checkId : $userId.val()},
    			success : function(result){
    				console.log(result);
    				if(result == "0"){
    					alert("중복되는 아이디입니다.");
    					$userId.foucus();
    				}else{
    					alert("사용가능한 아이디입니다.");
    					$userId.attr("readonly", true); // 아이디값 확정
    				}
    			}
    		})
    	}

    </script>
	<script>
		function validatePwd() {
			if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	
	</script>

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
  <!-- 확인 클릭시 다음 페이지로 넘어가기 스크립트 시작-->
  <script>
   /*  document.querySelector(".user-gobtn").addEventListener("click", function(event) {
    event.preventDefault(); // 기본 동작인 폼 제출 방지
    location.href = "SignUpKeyword.jsp"; // 링크로 이동
  }); */
  </script>
   <!-- 확인 클릭시 다음 페이지로 넘어가기 스크립트 끝-->
  <!-- End Script -->
  
</body>
</html>