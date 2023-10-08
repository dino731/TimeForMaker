<%@ page import="main.java.product.model.vo.*,main.java.member.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Product p = (Product) request.getAttribute("p");
    ArrayList<File> fi = (ArrayList<File>) request.getAttribute("fi");
    String imageFilePath = request.getContextPath() + fi.get(0).getFileSavePath() + fi.get(0).getFileName();
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member) session.getAttribute("loginUser");
	if(loginUser!=null){
	   	String userId=loginUser.getUserId();
	}
%>
<html>
<head>
	
    <title>상품 상세페이지</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="/TimeForMaker/assets/css/user-header.css">
	<link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css">
    <link rel="apple-touch-icon" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/assets/img/favicon.ico">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/templatemo.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/custom.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/slick-theme.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/PRO_DETAIL.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- 슬릭 CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" /> -->

    <!-- 슬릭 JS -->
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <!-- 달력 스크립트-->
    <script type="text/javascript">
        var today = new Date();
        var selectedCell = null;

        function buildCalendar() {

            var dateElement = document.createElement("input");
            dateElement.setAttribute("type", "text");
            dateElement.setAttribute("id", "date");
            // document.body.appendChild(dateElement);


            var row = null
            var row1 = null
            var cnt = 0;
            var calendarTable = document.getElementById("calendar");
            var calendarTableTitle = document.getElementById("calendarTitle");
            calendarTableTitle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

            var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            while (calendarTable.rows.length > 2) {
                calendarTable.deleteRow(calendarTable.rows.length - 1);
            }

            row = calendarTable.insertRow();
            for (i = 0; i < firstDate.getDay(); i++) {
                cell = row.insertCell();
                cnt += 1;
            }

            row1 = calendarTable.insertRow();

            for (i = 1; i <= lastDate.getDate(); i++) {
                cell = row.insertCell();
                cnt += 1;

                cell.classList.add("product-calendar-cell");
                cell.setAttribute('id', i);
                cell.innerHTML = i;
                cell.align = "center";

                // cell.onclick----------------------------------------------------------------------------------------------------------
                cell.onclick = function () {
                    if (selectedCell) {
                        selectedCell.classList.remove("product-calendar-selected");
                    }
                    selectedCell = this;
                    selectedCell.classList.add("product-calendar-selected");
                    this.classList.remove("product-calendar-hover");

                    clickedYear = today.getFullYear();
                    clickedMonth = (1 + today.getMonth());
                    clickedDate = this.getAttribute('id');

                    clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
                    clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                    selectedDate = clickedYear.toString().substring(2) + "/" + clickedMonth + "/" + clickedDate;


                    // document.getElementById("date").value = selectedDate;
                }


                if (cnt % 7 == 1) {
                    cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
                    cell.style.width = "65px";
                    cell.style.height = "65px";
                }

                if (cnt % 7 == 0) {
                    cell.innerHTML = "<font color=skyblue>" + i + "</font>";
                    row = calendar.insertRow();
                    cell.style.width = "65px";
                    cell.style.height = "65px";
                }
            }

            if (cnt % 7 != 0) {
                for (i = 0; i < 7 - (cnt % 7); i++) {
                    cell = row.insertCell();
                    cell.style.width = "65px";
                    cell.style.height = "65px";
                }
            }


        }

        function prevCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();
        }

        function nextCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();
        }
    </script>


</head>

<body>
<!-- 헤더 페이지 추가 필요 -->
	
   <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all admin_header">
    <div class="container d-flex justify-content-between align-items-center">
																			<!-- 여기에 메인페이지로 가는 길 -->
        <a class="navbar-brand text-success logo h1 align-self-center" href="<%= contextPath %>/views/common/main.jsp" style="width: 34%;">
            <img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo" >
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
             	<a class="nav-icon d-none d-lg-inline login_check" href="<%=contextPath%>/views/product/productList.jsp">
			           <i class="fa fa-fw fa-search text-dark mr-2"></i>
			      </a>
			      <a class="nav-icon position-relative text-decoration-none login_check" href="<%= contextPath %>" onclick="handleUserLink();">
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
				                    <a class="main_admin_link" href="<%= contextPath %>/noticeBoard	">고객센터관리</a>
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
	<!-- Close 헤더 파트 -->
<!-- 메인 div박스 시작-->
<div id="product-main">

    <div id="product-main-box">
        <!-- 메인 left박스 시작-->
        <div id="product-left-box">

            <div class="product-box" id="product-imgbox">
                <img src="<%= request.getContextPath()+fi.get(0).getFileSavePath()+fi.get(0).getFileName()%>"
                     style="width:100%; height:100%;">
            </div>
            <!-- 슬라이더 바-->
            <div id="slider-div" style="width:850px; height:200px;">
                <% for (int i = 0; i <= fi.size() - 1; i++)
                { %>
                <div class="slider-div-detail" onclick="DetailClick(this)">
                    <img src="<%= request.getContextPath() + fi.get(i).getFileSavePath() + fi.get(i).getFileName() %>"
                         class="product-slider-img">
                </div>
                <% } %>

            </div>


            <!-- 상품 태그 -->
            <div class="product-tag-container">
                <div class="product-tag">
                    <div class="product-rounded-rectangle">
                        <span><%= p.getClassKeyword()%></span>
                    </div>
                </div>

            </div>

            <!-- 상품 제목 -->
            <div class="product-title-container">
                <p><%= p.getClassName()%>
                </p>
            </div>

            <!-- 상품 인포 -->
            <div class="product-info-container">
                <div class="product-info">
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             width="32" height="32" viewBox="0 0 32 32" fill="#000000" data-svg-content="true">
                            <g>
                                <path
                                        d="M 31.882,5.624C 31.63,4.81, 30.898,4.208, 30,4.208l-2,0 l0,2 l0,1.104 c0,1.654-1.346,3-3,3S 22,8.966, 22,7.312 L 22,6.208 l0-2 L 9.99,4.208 l0,2 l0,1.104 c0,1.654-1.346,3-3,3c-1.654,0-3-1.346-3-3L 3.99,6.208 l0-2 L 2,4.208 c-0.898,0-1.63,0.602-1.882,1.416L0,5.624 l0,0.584 l0,6.23 L0,30 c0,1.104, 0.896,2, 2,2l 28,0 c 1.104,0, 2-0.896, 2-2L 32,12.438 L 32,6.208 L 32,5.624 L 31.882,5.624 z M 30,30L 2,30 L 2,14 l 28,0 L 30,30 zM 6.99,8.312c 0.552,0, 1-0.448, 1-1L 7.99,1 c0-0.552-0.448-1-1-1s-1,0.448-1,1l0,6.312 C 5.99,7.864, 6.438,8.312, 6.99,8.312zM 25,8.312c 0.552,0, 1-0.448, 1-1L 26,1 C 26,0.448, 25.552,0, 25,0S 24,0.448, 24,1l0,6.312 C 24,7.864, 24.448,8.312, 25,8.312z">
                                </path>
                            </g>
                        </svg>
                        <p style="margin: auto;">원데이 클래스</p>
                    </div>

                </div>

                <div class="product-info">
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             width="32" height="32" viewBox="0 0 32 32" fill="#000000" data-svg-content="true">
                            <g>
                                <path
                                        d="M 15.212,16.424c 2.874,0, 5.212-2.338, 5.212-5.212C 20.424,8.338, 18.086,6, 15.212,6S 10,8.338, 10,11.212 C 10,14.086, 12.338,16.424, 15.212,16.424z M 15.212,8c 1.77,0, 3.212,1.44, 3.212,3.212s-1.44,3.212-3.212,3.212S 12,12.982, 12,11.212 S 13.44,8, 15.212,8zM 14.484,31.458c 0.168,0.186, 0.33,0.306, 0.486,0.39c 0.002,0.002, 0.006,0.002, 0.008,0.004 c 0.108,0.056, 0.214,0.098, 0.314,0.098c 0.1,0, 0.206-0.042, 0.314-0.098c 0.002-0.002, 0.006-0.002, 0.008-0.004 c 0.156-0.084, 0.318-0.204, 0.486-0.39c0,0, 9.296-10.11, 10.23-18.87c 0.056-0.452, 0.094-0.91, 0.094-1.376 C 26.424,5.020, 21.404,0, 15.212,0S 4,5.020, 4,11.212c0,0.474, 0.038,0.936, 0.096,1.394C 5.054,21.362, 14.484,31.458, 14.484,31.458z M 15.212,2 c 5.080,0, 9.212,4.132, 9.212,9.212c0,0.338-0.024,0.698-0.082,1.164c-0.716,6.712-7.018,14.588-9.048,16.984 c-2.082-2.4-8.474-10.256-9.214-17C 6.026,11.918, 6,11.554, 6,11.212C 6,6.132, 10.132,2, 15.212,2z">
                                </path>
                            </g>
                        </svg>
                        <p style="margin: auto;"><%= p.getLocation()%>
                        </p>
                    </div>

                </div>


            </div>

            <!-- 멀티 탭-->
            <div class="product-multitab-container">
                <button class="product-info-btn" type="button" role="tab" aria-selected="true"
                        onclick="scrollToSection(event, 'product-info1', 100)"><a href="#product-info1"
                                                                                  class="product-a-underline">클래스 소개</a>
                </button>
                <button class="product-info-btn" type="button" role="tab" aria-selected="false"
                        onclick="scrollToSection(event, 'product-info2', 100)"><a href="#product-info2"
                                                                                  class="product-a-underline">커리큘럼</a>
                </button>
                <button class="product-info-btn" type="button" role="tab" aria-selected="false"
                        onclick="scrollToSection(event, 'product-info3', 100)"><a href="#product-info3"
                                                                                  class="product-a-underline">위치</a>
                </button>
                <button class="product-info-btn" type="button" role="tab" aria-selected="false"
                        onclick="scrollToSection(event, 'product-info4', 100)"><a href="#product-info4"
                                                                                  class="product-a-underline">후기</a>
                </button>
            </div>
            <hr width="97%" style="margin-left: 2%;">

            <p style="margin-left: 2%;">공지사항</p>
            <p style="margin-left: 2%;"><%= p.getNotice() %></p>

            <hr width="97%" style="margin-left: 2%;">
            <br>

            <!-- 메인 소개글 -->
            <div class="product-main-info-container">
                <div class="product-main-info">
                    <span id="product-info1" class="product-text"> 클래스 소개 </span> <br> <br>
                    <p>
                        <%= p.getClassIntro()%>
                    </p>
                </div>


                <div class="product-main-info">
                    <span id="product-info2" class="product-text"> 커리큘럼 </span> <br> <br>
                    <p>
                        <%= p.getClassProgress()%>
                    </p>

                </div>


                <div class="product-main-info">
                    <span id="product-info3" class="product-text"> 위치 </span> <br> <br>
                    <p><%= p.getLocation()%>
                    </p>
                    <div id="map" style="width:500px;height:400px;"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7a694d6564a4a606aac9b734e6e081f"></script>
                    <script>
                        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                        var options = { //지도를 생성할 때 필요한 기본 옵션
                            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
                            level: 3 //지도의 레벨(확대, 축소 정도)
                        };

                        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                        var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                    </script>
                </div>



                <div class="product-main-info">
                    <span id="product-info4" class="product-text"> 후기 </span> <br> <br>
                    <div class="product-review-container">
                        <div class="product-review-container-left">

                            <div class="product-review-container-lefttop">

                                <div class="product-review-profileimg">
                                    <img
                                            src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2F1658648200747_5e983f0b8408e30d81bb7bf2?alt=media&token=015dd347-72f0-433f-ae57-0ee726f1fdf4">
                                </div>

                                <div class="product-review-name">
                                    재린
                                </div>
                            </div>


                            <div class="product-review-container-leftbottom">
                                <div class="product-review-content">
                                    2가지 버전으로 향을 만들어보고, 최종적으로 제가 원하는 느낌의 향수를 제작할 수 있어서 좋았어요:)
                                </div>
                            </div>
                        </div>

                        <div class="product-review-imgattach">
                            <img
                                    src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FQhR1M7DOWefSyZAT_643e9bf3eced1e74d71d2816_1024x1024?alt=media">
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- 메인 left박스 끝-->


        <!-- 메인 center박스 시작-->
        <div id="product-center-box">

            <div class="product-box product-center-mainbox" id="product-stickybox">
                <div class="product-pick-box">
                    <div class="product-pick" id="product-schedule">일정 선택</div>
                    <div class="product-pick" id="product-details">세부 선택 사항</div>
                </div>

                <!-- 일정선택 박스 -->
                <div style="height:100%">

                    <!-- 달력 -->
                    <div class="product-calendar-box">
                        <table id="calendar" align="center">
                            <tr>
                                <td align="center" class="product-calendar"><label onclick="prevCalendar()"> ◀
                                </label></td>
                                <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
                                <td align="center" class="product-calendar"><label onclick="nextCalendar()"> ▶
                                </label></td>
                            </tr>
                            <tr>
                                <td align="center" class="product-calendar">
                                    <font color="#F79DC2">일
                                </td>
                                <td align="center" class="product-calendar">월</td>
                                <td align="center" class="product-calendar">화</td>
                                <td align="center" class="product-calendar">수</td>
                                <td align="center" class="product-calendar">목</td>
                                <td align="center" class="product-calendar">금</td>
                                <td align="center" class="product-calendar">
                                    <font color="skyblue">토
                                </td>
                            </tr>
                            <script type="text/javascript">buildCalendar();</script>
                        </table>
                    </div>


                    <!-- 세부선택사항 박스-->


                    <div class="product-detail-container">
                        <div class="product-center-content1">개설된 클래스</div>
                        <% String classOption = p.getClassOption();
                            String[] options = classOption.split(",");
                            for (int i = 0; i < options.length; i++) { %>
                        <div class="product-center-content2">
                            <button id="product-option<%= i+1 %>" onclick="selectOption('<%= options[i].trim() %>')">
                                <%= options[i].trim() %>
                            </button>
                        </div>
                        <% } %>


                        <div class="product-center-content4">
                            인원 선택
                            <select id="personOption" class="product-personoption" style="width: 75px;">
                                <% int maxPerson = p.getMaxPerson();
                                    for (int i = 1; i <= maxPerson; i++)
                                    { %>
                                <option value="<%= i %>"><%= i %>
                                </option>
                                <% } %>
                            </select>
                            명
                        </div>
                    </div>
                </div>
                <button class="product-center-btn" onclick="redirectToPayment('<%= p.getProductNo() %>')">
                    클래스 신청하기
                </button>


            </div>
        </div>
        <!-- 메인 center박스 끝-->


        <!-- 메인 right박스 시작-->
        <div id="product-right-box">
            <div class="product-box-right" id="product-stickybox">
<%--                <p>최근 본 상품--%>
<%--                    <button type="button" class="product-right-rollbutton arrow"--%>
<%--                            onclick="toggleRecentProducts()"></button>--%>
<%--                </p>--%>

<%--                <div class="product-right-togglebox">--%>
<%--                    <div class="product-right-recent" data-link="링크1">--%>
<%--                        <img class="product-right-img"--%>
<%--                             src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FPMP66A2BRktXMBJt_5f5097bb65c28a0d18e73545_1024x1024?alt=media">--%>
<%--                        <p>상품제목</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-right-recent" data-link="링크2"><img class="product-right-img"--%>
<%--                                                                           src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FPMP66A2BRktXMBJt_5f5097bb65c28a0d18e73545_1024x1024?alt=media">--%>
<%--                        <p>상품제목</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-right-recent" data-link="링크3"><img class="product-right-img"--%>
<%--                                                                           src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FPMP66A2BRktXMBJt_5f5097bb65c28a0d18e73545_1024x1024?alt=media">--%>
<%--                        <p>상품제목</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-right-recent" data-link="링크4"><img class="product-right-img"--%>
<%--                                                                           src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FPMP66A2BRktXMBJt_5f5097bb65c28a0d18e73545_1024x1024?alt=media">--%>
<%--                        <p>상품제목</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-right-recent" data-link="링크5"><img class="product-right-img"--%>
<%--                                                                           src="https://firebasestorage.googleapis.com/v0/b/mochaclass-intro-web-4e0c0.appspot.com/o/FCMImages%2FPMP66A2BRktXMBJt_5f5097bb65c28a0d18e73545_1024x1024?alt=media">--%>
<%--                        <p>상품제목</p>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <!-- 메인 right박스 끝-->
    </div>
</div>
<!-- Start Footer -->
<!-- 	<footer class="main_footer" id="tempaltemo_footer">
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
	End Footer -->

<!-- Start Script -->
<script src="../assets/js/jquery-1.11.0.min.js"></script>
<script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/templatemo.js"></script>
<!-- End Script -->


<!-- 스크롤시 상단에 여유주는 스크립트-->
<script>
    function scrollToSection(event, sectionId, offset) {
        event.preventDefault();
        const section = document.getElementById(sectionId);
        const sectionTop = section.getBoundingClientRect().top + window.pageYOffset - offset;
        window.scrollTo({top: sectionTop, behavior: 'smooth'});
    }

</script>

<!-- 페이지이동 탭 스크립트 -->
<script>
    // JavaScript 코드
    const buttons = document.querySelectorAll('.product-info-btn');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(btn => {
                btn.setAttribute('aria-selected', 'false');
            });
            button.setAttribute('aria-selected', 'true');
        });
    });
</script>
<!-- 최근 본 상품 스크립트-->
<script>
    function toggleRecentProducts() {
        const toggleBox = document.querySelector('.product-right-togglebox');
        const recentItems = toggleBox.querySelectorAll('.product-right-recent');

        if (toggleBox.style.display === 'none') {
            toggleBox.style.display = 'block';
            recentItems.forEach(function (item) {
                item.style.display = 'block';
            });
        } else {
            toggleBox.style.display = 'none';
            recentItems.forEach(function (item) {
                item.style.display = 'none';
            });
        }
    }

</script>

<!-- 옵션 선택 스크립트 -->
<script>

    // 세부 선택 사항 클릭시 기본적으로 마들렌 만들기가 선택되게 하기
    document.getElementById("product-details").addEventListener("click", function () {
        document.getElementById("product-option1").style.backgroundColor = "gray";
        document.getElementById("product-option1").style.color = "white";

        document.getElementById("product-option2").style.backgroundColor = "white";
        document.getElementById("product-option2").style.color = "gray";
        document.getElementById("product-option3").style.backgroundColor = "white";
        document.getElementById("product-option3").style.color = "gray";
        document.getElementById("product-option4").style.backgroundColor = "white";
        document.getElementById("product-option4").style.color = "gray";
        document.getElementById("product-option5").style.backgroundColor = "white";
        document.getElementById("product-option5").style.color = "gray";
    });

    // 마들렌 만들기 클릭시
    document.getElementById("product-option1").addEventListener("click", function () {
        document.getElementById("product-option1").style.backgroundColor = "gray";
        document.getElementById("product-option1").style.color = "white";

        document.getElementById("product-option2").style.backgroundColor = "white";
        document.getElementById("product-option2").style.color = "gray";
        document.getElementById("product-option3").style.backgroundColor = "white";
        document.getElementById("product-option3").style.color = "gray";
        document.getElementById("product-option4").style.backgroundColor = "white";
        document.getElementById("product-option4").style.color = "gray";
        document.getElementById("product-option5").style.backgroundColor = "white";
        document.getElementById("product-option5").style.color = "gray";
    });

    // 브라우니 만들기 클릭시
    document.getElementById("product-option2").addEventListener("click", function () {
        document.getElementById("product-option2").style.backgroundColor = "gray";
        document.getElementById("product-option2").style.color = "white";

        document.getElementById("product-option1").style.backgroundColor = "white";
        document.getElementById("product-option1").style.color = "gray";
        document.getElementById("product-option3").style.backgroundColor = "white";
        document.getElementById("product-option3").style.color = "gray";
        document.getElementById("product-option4").style.backgroundColor = "white";
        document.getElementById("product-option4").style.color = "gray";
        document.getElementById("product-option5").style.backgroundColor = "white";
        document.getElementById("product-option5").style.color = "gray";
    });

    // 옵션3 클릭시
    document.getElementById("product-option3").addEventListener("click", function () {
        document.getElementById("product-option3").style.backgroundColor = "gray";
        document.getElementById("product-option3").style.color = "white";

        document.getElementById("product-option1").style.backgroundColor = "white";
        document.getElementById("product-option1").style.color = "gray";
        document.getElementById("product-option2").style.backgroundColor = "white";
        document.getElementById("product-option2").style.color = "gray";
        document.getElementById("product-option4").style.backgroundColor = "white";
        document.getElementById("product-option4").style.color = "gray";
        document.getElementById("product-option5").style.backgroundColor = "white";
        document.getElementById("product-option5").style.color = "gray";
    });

    // 옵션4 클릭시
    document.getElementById("product-option4").addEventListener("click", function () {
        document.getElementById("product-option4").style.backgroundColor = "gray";
        document.getElementById("product-option4").style.color = "white";

        document.getElementById("product-option1").style.backgroundColor = "white";
        document.getElementById("product-option1").style.color = "gray";
        document.getElementById("product-option2").style.backgroundColor = "white";
        document.getElementById("product-option2").style.color = "gray";
        document.getElementById("product-option3").style.backgroundColor = "white";
        document.getElementById("product-option3").style.color = "gray";
        document.getElementById("product-option5").style.backgroundColor = "white";
        document.getElementById("product-option5").style.color = "gray";
    });

    // 옵션5 클릭시
    document.getElementById("product-option5").addEventListener("click", function () {
        document.getElementById("product-option5").style.backgroundColor = "gray";
        document.getElementById("product-option5").style.color = "white";

        document.getElementById("product-option1").style.backgroundColor = "white";
        document.getElementById("product-option1").style.color = "gray";
        document.getElementById("product-option2").style.backgroundColor = "white";
        document.getElementById("product-option2").style.color = "gray";
        document.getElementById("product-option3").style.backgroundColor = "white";
        document.getElementById("product-option3").style.color = "gray";
        document.getElementById("product-option4").style.backgroundColor = "white";
        document.getElementById("product-option4").style.color = "gray";
    });


</script>

<!-- 세부&일정 클릭시 하단에 나오는 것들 스크립트-->
<script>
    $(document).ready(function () {
        // 페이지 최초 로딩 시 숨김 처리
        $(".product-detail-container").hide();
        $(".product-detail-container").hide();

        // 일정 선택 클릭 시
        $("#product-schedule").click(function () {
            // 일정 선택 박스 표시
            $(".product-calendar-box").show();
            // 세부 선택 사항 박스 숨김
            $(".product-detail-container").hide();
        });

        // 세부 선택 사항 클릭 시
        $("#product-details").click(function () {
            // 일정 선택 박스 숨김
            $(".product-calendar-box").hide();
            // 세부 선택 사항 박스 표시
            $(".product-detail-container").show();
        });
    });
</script>

<!-- 일정선택 스크립트 -->
<script>
    window.onload = function () {
        // 초기 설정
        document.getElementById("product-schedule").style.backgroundColor = "gray";
        document.getElementById("product-schedule").style.color = "white";
        document.getElementById("product-details").style.backgroundColor = "white";
        document.getElementById("product-details").style.color = "gray";

        // 세부 선택 사항 클릭 이벤트 등록
        document.getElementById("product-details").addEventListener("click", function () {
            document.getElementById("product-schedule").style.backgroundColor = "white";
            document.getElementById("product-schedule").style.color = "gray";

            document.getElementById("product-details").style.backgroundColor = "gray";
            document.getElementById("product-details").style.color = "white";
        });

        // 일정 선택 클릭 이벤트 등록
        document.getElementById("product-schedule").addEventListener("click", function () {
            document.getElementById("product-schedule").style.backgroundColor = "gray";
            document.getElementById("product-schedule").style.color = "white";

            document.getElementById("product-details").style.backgroundColor = "white";
            document.getElementById("product-details").style.color = "gray";
        });
    };
</script>

<!-- 슬라이더 바 스크립트 -->
<script>
    $(function () {
        $('.product-slider-img').click(function () {
            var clickedImage = $(this).clone(); // 클릭한 이미지를 복제
            $('#product-imgbox').empty().append(clickedImage); // 'product-box'를 비우고 복제한 이미지 추가

            // 이미지 비율 유지를 위해 CSS 설정 추가
            var containerWidth = $('#product-imgbox').width();
            var containerHeight = $('#product-imgbox').height();
            var imageWidth = clickedImage.width();
            var imageHeight = clickedImage.height();
            var containerRatio = containerWidth / containerHeight;
            var imageRatio = imageWidth / imageHeight;

            if (imageRatio > containerRatio) {
                clickedImage.css({width: '100%', height: 'auto'});
            } else {
                clickedImage.css({width: 'auto', height: '100%'});
            }
        });


        $('#slider-div').slick({
            slide: 'div',      //슬라이드 되어야 할 태그 ex) div, li
            infinite: true,    //무한 반복 옵션
            slidesToShow: 3,      // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll: 1,      //스크롤 한번에 움직일 컨텐츠 개수
            speed: 100,    // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows: true,       // 옆으로 이동하는 화살표 표시 여부
            dots: true,       // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay: false,         // 자동 스크롤 사용 여부
            autoplaySpeed: 10000,       // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover: true,      // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
            vertical: false,      // 세로 방향 슬라이드 옵션
            prevArrow: "<button type='button' class='slick-prev'>Previous</button>",      // 이전 화살표 모양 설정
            nextArrow: "<button type='button' class='slick-next'>Next</button>",      // 다음 화살표 모양 설정
            dotsClass: "slick-dots",    //아래 나오는 페이지네이션(점) css class 지정
            draggable: true,    //드래그 가능 여부
        });
    })
</script>


<%--클래스 신청하기 스크립트--%>
<script>
    var selectedOption = document.getElementById("product-option1").textContent.trim();
    var selectedDate = null;

    function selectOption(option) {
        selectedOption = option;
    }
    function selectDate(date) {
        selectedDate = date;
    }


    function redirectToPayment(productNo) {
        var selectedPerson = document.getElementById('personOption').value;
        var encodedProductNo = encodeURIComponent(productNo);
        var encodedSelectedPerson = encodeURIComponent(selectedPerson);
        var encodedOption = encodeURIComponent(selectedOption);
        var encodedDate = encodeURIComponent(selectedDate);
        var encodedImage = '<%= imageFilePath%>';

        // payment.product 페이지로 이동하면서 상품번호와 선택한 인원수를 전달합니다.
        window.location.href = '<%= request.getContextPath() %>/payment.product?pno=' + encodedProductNo + '&person=' + encodedSelectedPerson + '&option=' + encodedOption + '&date=' + encodedDate + '&img=' + encodedImage;
    }

</script>


</body>

</html>