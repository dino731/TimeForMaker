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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="apple-touch-icon" href="<%=contextPath %>/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=contextPath %>/assets/img/favicon.ico">

<link rel="stylesheet" href="<%=contextPath %>/assets/css/user-header.css">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/mypage_login.css">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css">


</head>
<body>



	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="main.html"> <img src="<%=contextPath %>/assets/img/메인로고.png"
				class="main_logo">
			</a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/mypage/member/LoginMain.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/mypage/member/SignUpCondition.jsp">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="">고객센터</a></li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-dark mr-2"></i>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="#"> <i class="fa fa-fw fa-user text-dark mr-3"></i>
					</a>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->
	<!-- Modal 헤드에 검색 누르면 나오는 모달  -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
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
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"> <span
						style="color: gray; font-size: 12px;">________________________
							쉽고 간단한 로그인 및 회원 가입 ________________________</span></a></li>
				<br>
			</ul>
			<div
				style="color: black; font-weight: bold; text-align: center; margin-top: 50px;">
				<h5 style="font-weight: 400;">로그인 방법 선택</h5>
			</div>
			<!-- 회원가입 상단 바 끝 -->

			<!-- 로그인 버튼 시작-->
			<div class="user-login-list">
			<a href="#0" id="kakaoLogout" Style="text-decoration:none; color:white;">로그아웃</a> <a href="#0"
						id="secession"  Style="text-decoration:none; color:white;">탈퇴</a>
				<!-- 카카오톡 로그인 시작-->
				<div class="user-login-kakaoWapper">
					<div onclick="kakaoLogin();" class="user-login-kakaodiv">
						<a class="user-login-astyle" href="javascript:void(0);"> <span
							class="user-login-kakaospan">카카오톡으로 로그인</span>
						</a>
					</div>
				</div>
				<!-- 카카오톡 로그인 끝-->
				
				<!-- 구글 로그인 시작-->
				<div class="user-login-googleWapper">
					<div class="user-login-GgCustomLogin">
						<a class="user-login-astyle" href="javascript:void(0)"> <span
							class="user-login-googlespan">구글 이메일로 로그인</span>
						</a>
					</div>
				</div>
				<!-- 구글 로그인 끝-->

				<!-- 자사 로그인 시작 -->
				<div class="user-login-membership-wapper">
					<div class="user-login-memberdiv">
						<a class="user-login-astyle" href="LoginTFM.jsp"> <span
							class="user-login-memberspan">다른 방법으로 로그인</span>
						</a>
					</div>
				</div>
				<!-- 자사 로그인 끝 -->

				<!-- 회원가입 유도 버튼 시작-->
				<div class="membershipGuideWapper">
					<span style="font-size: 13px; color: darkgrey; font-weight: 600;">아이디가 없으신가요? <a href="SignUpCondition.jsp"
						style="color: rgb(99, 99, 255); text-decoration-line: none; font-weight: 600; font-size: 13px;">회원가입</a>하기
					</span>
				</div>
				<!-- 회원가입 유도 버튼 끝-->
			</div>
			<!-- 로그인 버튼 끝-->

		</div>
	</div>

<!-- 카카오 스크립트 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
  function saveToDos(token) { //item을 localStorage에 저장합니다.
    typeof Storage !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token));
  }

  Kakao.init('0ad62496d34706bb99cabd0c743c559a');

  function kakaoLogin() {
    Kakao.Auth.login({
      success: function(response) {
        saveToDos(response.access_token); // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(response) {
            $.ajax({
              type: "post",
              url: '<%=contextPath%>/KIdCheck.me',
              data: { "userId": response.id },
              success: function(result) {
                console.log(result);
                if (result == "0") {
                  $.ajax({
                    type: "post",
                    url: '<%=contextPath%>/Klogin.me',
                    data: { "userId": response.id, "userPwd": "123" },
                    dataType: "json",
                    success: function(loginUser) {
                      if (loginUser != null) {
                        // 로그인 성공 시 세션에 정보 저장
                        for (var key in loginUser) {
                          sessionStorage.setItem(key, loginUser[key]);
                        }
                        // 메인 페이지로 이동
                        window.location.href = '<%=contextPath%>/views/common/main.jsp';
                      } else {
                        alert('로그인에 실패했습니다.');
                      }
                    },
                    error: function(request, status, error) {
                      alert("로그인에 실패했습니다. 서버 오류: " + error);
                    }
                  });
                } else {
                  $.ajax({
                    type: "post",
                    url: '<%=contextPath%>/insert.me',
                    data: {
                      "userId": response.id,
                      "userName": response.properties.nickname,
                      "UserNick": response.kakao_account.email,
                      "userPhone": "01011112222",
                      "userPwd": "123"
                    },
                    success: function() {
                      alert('회원가입이 완료되었습니다.');
                    },
                    error: function(request, status, error) {
                      alert("회원가입에 실패했습니다. 서버 오류: " + error);
                    }
                  });
                }
              },
              error: function(request, status, error) {
                alert("ID 중복체크에 실패했습니다. 서버 오류: " + error);
              }
            });
          }
        });
      },
      fail: function(error) {
        alert(error);
      }
    });
  }

   function createHiddenLoginForm(kakaoId) {
    var frm = document.createElement('form');
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', '<%=contextPath%>/login.me');

    var hiddenInputId = document.createElement('input');
    hiddenInputId.setAttribute('type', 'hidden');
    hiddenInputId.setAttribute('name', 'userid');
    hiddenInputId.setAttribute('value', response.id);
    frm.appendChild(hiddenInputId);

    var hiddenInputPwd = document.createElement('input');
    hiddenInputPwd.setAttribute('type', 'hidden');
    hiddenInputPwd.setAttribute('name', 'userPwd');
    hiddenInputPwd.setAttribute('value', '123');
    frm.appendChild(hiddenInputPwd);

    document.body.appendChild(frm);
    frm.submit();
  }

  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      console.log('Not logged in.');
      return;
    }
    Kakao.Auth.logout(function(response) {
      alert(response + ' logout');
      window.location.href = '<%=contextPath%>/views/common/main.jsp';
    });
  }

  function secession() {
    var accessToken = Kakao.Auth.getAccessToken();
    if (!accessToken) {
      alert('로그인 상태가 아닙니다.');
      return;
    }
    Kakao.API.request({
        url: '/v1/user/unlink',
      })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
        deleteCookie();
        $.ajax({
          type: "post",
          url: '<%=contextPath%>/TimeForMaker/delete.me',
          data: { "userPwd": "123" },
          dataType: "json",
          success: function(response) {
            alert('회원탈퇴되었습니다.');
            window.location.href = '<%=contextPath%>/views/common/main.jsp';
          },
          error: function(request, status, error) {
            alert("회원탈퇴에 실패했습니다. 서버 오류: " + error);
          }
        });
      })
      .catch(function(err) {
        alert('fail: ' + JSON.stringify(err));
      });
  }

  const logout = document.querySelector('#kakaoLogout');
  const sion = document.querySelector('#secession');

  logout.addEventListener('click', kakaoLogout);
  sion.addEventListener('click', secession);
</script>


	<!-- jsQuery 및 기능 구현 끝-->





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