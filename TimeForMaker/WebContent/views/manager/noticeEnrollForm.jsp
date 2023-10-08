<%@ page import="main.java.notice.model.vo.Notice, main.java.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Notice n = (Notice)request.getAttribute("n");
	
	Member loginUser = (Member) session.getAttribute("loginUser");
	if(loginUser!=null){
	   	String userId=loginUser.getUserId();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Notice Enroll Form</title>

<link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">

<!-- load css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/templatemo.css" type="text/css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/user-header.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/customer-center.css" type="text/css">

<!-- load fonts style -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap" type="text/css">
<link rel="stylesheet" href="<%=contextPath %>/assets/css/fontawesome.min.css" type="text/css">

<!-- load script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- 헤더 페이지 추가 필요 -->
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
        <a class="navbar-brand text-success logo h1 align-self-center" href="<%= contextPath %>/views/common/main.jsp" style="width: 34%;">
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
	
	<!-- Start 공지작성 페이지 -->
    <div class="reception-side-container" style="position: relative;">
        
        <!-- Start Side-Menu -->
        <div class="side-menu">
            <ul class="list-group list-group-flush">
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath %>/noticeBoard">공지사항</a></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath %>/manageReception">회원 문의</a></li>
            </ul>
        </div>
        <!-- Close Side-Menu -->
        
        <!-- Start Manager Form Container 공지 등록 폼 -->
        <div class="recept-part"> 
            <!-- Start Recept Page Title -->
            <h3 align="center" class="customer-center-title">공지사항</h3>
            <!-- Close Recept Page Title -->

            <div>
                <form class="notice-form" method="post">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label"></label>
                        <div class="col-sm-8">
                            <input type="hidden" id="notice-form-no" name="notice-form-no"/>
                            <input type="hidden" id="notice-form-agree-hdn" name="notice-form-agree-hdn">
                            <input type="checkbox" id="notice-form-agree" name="notice-form-agree"><label for="notice-form-agree">중요공지</label>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">제목</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="notice-form-title" name="notice-form-title" placeholder="제목을 입력해주세요" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">내용</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="notice-form-content" rows="13" name="notice-form-content" placeholder="내용을 입력해주세요" required></textarea>
                        </div>
                    </div>
                    <button class="btn btn-primary notice-form-delete-btn" type="submit" formaction="deleteNotice">삭제하기</button>
                    <button class="btn btn-primary notice-form-save-btn" type="submit" formaction="uploadNotice" name="save" value="Y">임시저장</button>
                    <button class="btn btn-primary notice-form-btn" type="submit" formaction="uploadNotice" name="save" value="N">등록하기</button>
                    <!-- 
                        공지 접수 성공 여부에 따라 알림창 다르게 뜨게 만드는 기능 추가 필요
                        (서버로 폼 제출 -> 컨트롤에서 결과에 따라 폼 작성창에 작성했던 내용 + 알림창)
                    -->
                </form>
            </div>
        </div>
        <!-- Close Manager Form Container 공지 등록 폼 -->
        
        <script>
	        <% if(n!=null){ %>
		        	<% if(n.getImpt()=='Y'){ %>
		        		$("#notice-form-agree").prop("checked", true);
		        	<% } %>
		        	$("#notice-form-title").val("<%=n.getTitle() %>");
		        	let text = "<%=n.getContent()%>".replaceAll("<br>", "\r\n");
		        	$("#notice-form-content").val(text);
		        	$(".notice-form-delete-btn").attr("formaction", "<%=contextPath%>/deleteNotice?no=<%=n.getNoticeNo()%>");
		        	$(".notice-form-save-btn, notice-form-btn").attr("formaction", "<%=contextPath%>/uploadNotice?no=<%=n.getNoticeNo()%>");
		        	$("#notice-form-no").val("<%= n.getNoticeNo()%>");
	        <% } %>
	        
	        $(".notice-form-btn, .notice-form-save-btn, notice-form-delete-btn").click(function(){
	        	let val;
	            if($("#notice-form-agree").is(":checked")){
	                // $("#notice-form-agree").val("Y");
	                val='Y';
	            }else{
	                // $("#notice-form-agree").val("N");
	                val='N';
	            }
	            $("#notice-form-agree-hdn").val(val);
	            console.log($("#notice-form-agree-hdn").val());
	        });
        </script>

        <!-- Start Alert Box -->
        <% if(request.getAttribute("msg")!=null){ %>
	        <div class="recept-alert-box">
	            <button type="button" class="btn btn-outline-dark recept-alert-box-close">X</button>
	            <span><%=request.getAttribute("msg") %></span>
	        </div>
        <% } %>
        <!-- Close Alert Box -->
    </div>
    
    <!-- Close 공지작성 페이지 -->
    
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
    <script src="<%=contextPath %>/assets/js/templatemo.js"></script>
    <script src="<%=contextPath %>/assets/js/customer-center.js"></script>
    <script>

        /* 게시판에 빈 라인 hover삭제 */
        $("#notice-save-board-area tbody tr").hover(function(){
            // console.log($(this).children("th").text());
            if($(this).children("th").text()!=""){
                $(this).css("background-color","beige");
            }
        }, function(){
            $(this).css("background-color","none");
        });

        /* 게시판 빈칸 속성지정 */
        $("#notice-save-board-area tbody tr>th").each(function(index){
            if($(this).text()==""){
                $("#notice-save-board-area tbody tr").eq(index).css("border","white");
                if(index==9){
                    $("#notice-save-board-area tbody tr").eq(index).css("border-bottom","black");
                }
            }
        });
        
        /* 공지사항 게시판 페이징 버튼 효과 */
        $(".page-item").click(function(){
            $(this).siblings().removeClass("notice-recept-page-clicked");
            $(this).addClass("notice-recept-page-clicked"); 
        });

        /* 알림창 닫기 이벤트 */
        $(".recept-alert-box-close").click(function(){
            $(".recept-alert-box").css("display","none");
        });
    </script>
    <!-- End Script -->
</body>
</html>