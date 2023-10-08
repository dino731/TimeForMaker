<%@ page import="main.java.reception.model.vo.Reception, main.java.reception.model.vo.ReceptionFile,
				main.java.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member) session.getAttribute("loginUser");
	if(loginUser!=null){
	   	String userId=loginUser.getUserId();
	}
	
	Reception r = (Reception)request.getAttribute("r");
	ReceptionFile rfile = (ReceptionFile)request.getAttribute("rfile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reception</title>

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

	<!-- Start 회원문의글 페이지 -->
    <div class="reception-side-container" style="position: relative;">
        
        <!-- Start Side-Menu -->
        <div class="side-menu">
            <ul class="list-group list-group-flush">
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath%>/noticeBoard">공지사항</a></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath%>/manageReception">회원 문의</a></li>
            </ul>
        </div>
        <!-- Close Side-Menu -->
        
        <!-- Start Manager Recept Board Detail Container 문의확인 -->
        <div class="recept-part"> 
            <!-- Start Recept Page Title -->
            <h3 align="center" class="customer-center-title">회원 문의</h3>
            <!-- Close Recept Page Title -->

            <div class="recpet-part1">
                <div class="recept-content">
                    <h4 class="recept-content-title"><%=r.getTitle() %></h4>
                    <div class="recpet-content-part">
                        <div class="recpet-content-header">
                            <p>회&nbsp;&nbsp;&nbsp;&nbsp;원<span><%=r.getUserId() %></span></p>
                            <p>접수일<span><%=r.getUploadDate() %></span></p>
                        </div>
                        <textarea class="recpet-content-text" id="recpet-content-text" rows="15" onclick="this.select()" onfocus="this.select()" readonly></textarea>
                    	
                    	<% if(rfile!=null){ %>
	                    	<div class="reception-file-area">
	                            <label for="reception-file">
	                                <div class="recept-file-upload-btn">
	                                    <a class="reception-file-down-btn" href="<%=contextPath %>/<%=rfile.getPath() %>/<%=rfile.getChangeName() %>" download>다운로드</a>
	                                </div>
	                            </label>
	                            <p class="recept-file-originName" style="display : inline-block"><%=rfile.getOrgName() %></p>
	                        </div>
                        <% } %>
                    </div>
                </div>
                <hr>
                <div class="recept-answer-content">
                    <h4 class="recept-answer-content-title">답변작성란</h4>
                    <div class="recpet-answer-content-part">
                        <textarea class="recpet-answer-content-text" id="recpet-answer-content-text" rows="7" onclick="this.select()" onfocus="this.select()" required></textarea>
                    	
                    	<script>
                    		let text = "<%=r.getText()%>".replaceAll("<br>", "\r\n");
			        		$("#recpet-content-text").val(text);
		               		
		               		<% if(r.getReply()!=null){ %>
		               			let text2 = "<%=r.getReply()%>".replaceAll("<br>", "\r\n");
		               			$("#recpet-answer-content-text").val(text2);
		               		<% } %>
		               	</script>
		               	
                    </div>
                </div>
                <button class="btn btn-outline-warning recept-reply-btn">등록하기</button>
            </div>
        </div>
        <!-- Close Manager Recept Board Detail Container -->

        <!-- Start Alert Box -->
        <div class="recept-alert-box" style="display:none;">
            <button type="button" class="btn btn-outline-dark recept-alert-box-close">X</button>
            <span></span>
        </div>
        <!-- Close Alert Box -->
    </div>
    
    <!-- Close 회원문의글 페이지 -->
	
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
    <script src="<%=contextPath %>/assets/js/templatemo.js"></script>
    <script src="<%=contextPath %>/assets/js/customer-center.js"></script>
    <script>
	    /* 답변이 있을 경우 스타일 변경 */
	    $(function(){
	        if($("#recpet-answer-content-text").val()!=""){
	            $("#recpet-answer-content-text").css("background-color","lightgray");
	            $("#recpet-answer-content-text").attr("readonly", true);
	            $(".recept-reply-btn").attr("disabled",true);
	        }
	    });
	
	    $(".recept-alert-box-close").click(()=>$(".recept-alert-box").css("display","none"));
	    
	    /* 답변 등록 제출 */
	    $(".recept-reply-btn").click(function(){
            //console.log($(".recpet-answer-content-text").val());
            let text = $(".recpet-answer-content-text").val();
            $.ajax({
                url:"replyReception",
                type:"post",
                data:{
                    no:"<%=r.getReceptionNo()%>",
                    text:text
                },
                success:function(result){
                	let msg = JSON.stringify(result.message);
                	$(".recept-alert-box").css("display","block");
                	$(".recept-alert-box>span").text(msg);
                	
                	$(".recept-alert-box>button").click(function(){
	               		location.href="<%=contextPath%>/manageReception";                		
                	});
                	
                }/* ,
                error : function(){
                	$(".recept-alert-box").css("display","block");
                	$(".recept-alert-box>span").text("등록에 실패했습니다. 다시 시도해주세요.");
                } */
            })
        });
    </script>
    <!-- End Script -->

</body>
</html>