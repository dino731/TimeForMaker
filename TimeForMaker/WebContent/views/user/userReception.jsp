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

	<!-- Start 문의 페이지 -->
    <div class="reception-side-container" style="position: relative;">

        <!-- Start Side-Menu -->
        <div class="side-menu">
            <ul class="list-group list-group-flush">
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath%>/noticeBoard">공지사항</a></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath%>/myReception">1:1 문의</a></li>
              </ul>
        </div>
        <!-- Close Side-Menu -->
    
        <!-- Start Recept Board Container 문의내역 -->
        <div class="recept-part"> 
            <!-- Start Recept Page Title -->
            <h3 align="center" class="customer-center-title">1:1 문의</h3>
            <!-- Close Recept Page Title -->

            <div class="recept-sub-menu">
                <button class="recept-sub-menu-item recpet-sub-menu-selected">문의 내역</button>
                <button class="recept-sub-menu-item">문의하기</button>
            </div>

            <!-- Start Recept Board Part -->
            <div class="recpet-part1">
                <div class="recept-content">
                    <h4 class="recept-content-title"><%=r.getTitle() %></h4>
                    <div class="recpet-content-part">
                        <div class="recpet-content-header">
                            <p>접수일<span><%=r.getUploadDate() %></span></p>
                        </div>
                        <textarea class="recpet-content-text" id="recpet-content-text" rows="15" onclick="this.select()" onfocus="this.select()" readonly></textarea>
                        <script>
	                        let text1 = "<%=r.getText()%>".replaceAll("<br>", "\r\n");
				        	$("#recpet-content-text").val(text1);
                        </script>
                        
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
                    <h4 class="recept-answer-content-title">답변</h4>
                    <div class="recpet-answer-content-part">
                        <textarea class="recpet-answer-content-text" id="recpet-answer-content-text" rows="7" onclick="this.select()" onfocus="this.select()" readonly></textarea>
                    	<script>
                    		<% if(r.getReply()!=null){ %>
		                        let text2 = "<%=r.getReply()%>".replaceAll("<br>", "\r\n");
					        	$("#recpet-answer-content-text").val(text2);
				        	<% } %>
                        </script>
                    </div>
                </div>
    
                <button class="btn btn-outline-warning recept-back-category-btn">목록</button>
            </div>
            <!-- Start Recept Entroll Form-->
            <div class="recept-part2">
                <form class="recept-form" action="uploadReception" method="post" enctype="multipart/form-data">
                    <div class="mb-3 row">
                        <input type="text" hidden class="form-control-plaintext" id="recept-form-category" name="recept-form-category" value="">

                        <label class="col-sm-2 col-form-label">분류</label>
                        <div class="col-sm-7">
                            <nav class="navbar navbar-expand-lg" id="recept-form-bar" style="background-color: transparent;">
                                <!-- script단에서 요청 (-> /uploadReception 처리 필요) -->
                                <div class="container-fluid">
                                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown2">
                                        <ul class="navbar-nav">
                                            <li class="nav-item dropdown dropdown-center">
                                                <button class="nav-link dropdown-toggle" type="button" id="recept-category-btn" name="recept-category" value="선택" data-bs-toggle="dropdown" aria-expanded="false" style="border:0.8px solid black; background-color: transparent;">
                                                    <span>선택</span>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-middle" id="recept-form-category-menu" style="text-align: center; cursor:pointer">
                                                    <li class="dropdown-item">계정</li>
                                                    <li class="dropdown-item">예약</li>
                                                    <li class="dropdown-item">기타</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">제목</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="recept-form-title" name="recept-form-title" placeholder="제목을 입력해주세요" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">내용</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="recept-form-content" rows="13" name="recept-form-content" placeholder="내용을 입력해주세요" onclick="this.select()" onfocus="this.select()" required></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">파일첨부</label>
                        <div class="col-sm-8">
                            <input type="file" class="form-control" id="recept-form-file" name="recept-form-file" accept="image/jpeg, image/png, .txt">
                        </div>
                    </div>
                    <div class="mb-3 row recept-right-info-container">
                        <label class="col-sm-2 col-form-label">개인정보<br>수집 및 이용<br>동의</label>
                        <div class="col-sm-8">
                            <span>문의 접수와 처리를 위한 최소한의 개인정보입니다. 동의를 필요로 합니다.</span>
                            <button type="button" class="recept-right-info-btn" id="recept-right-info-btn">전문보기</button><br><br>
                            <input type="checkbox" id="recept-form-agree" name="recept-form-agree"><label for="recept-form-agree"><b>동의합니다</b></label>
                        </div>
                        <div class="recept-right-info">
                            <h2>개인정보 수집 및 이용동의 안내 (필수)</h2><br>
                            <p>[1:1 문의하기]를 이용하여 고객상담을 하는 경우 다음과 같은 개인정보를 수집하고 있습니다.</p>
                            <dl>
                                <dt>
                                    1&#41; 개인정보 수집 및 이용 목적
                                </dt>
                                <dd>서비스이용에 따른 본인확인, 문의하기 접수와 처리 및 결과 회신</dd>
                                
                                <dt>
                                    2&#41; 개인정보 수집항목
                                </dt>
                                <dd>필수 항목 : 이메일 주소</dd>
                                <dt>
                                    3&#41; 개인정보 보유 및 이용기간
                                </dt>
                                <dd>접수된 문의 처리 후 7일</dd>
                            </dl>
                            <button type="button" class="btn btn-warning recept-right-info-close">닫기</button>
                        </div>
                    </div>
                    <hr>

                    <button class="btn btn-primary" type="submit" onclick="return receptValidate()">접수하기</button>
                </form>
            </div>

            <!-- Close Recept Entroll Form -->
        </div>

        <!-- Close Recept Board Container -->
    </div>
    
    <!-- Close 문의 페이지 -->
	
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
	    /* 문의 유형 선택 이벤트 */
	    $("#recept-search-category-menu>li").click(function(){
	        let value=$(this).text();
	        $("#navbarNavDarkDropdown button span").text(value);
	
	        let url=`myReception?category=${value}`;
	        location.href=url;
	    });
	
	    $("#recept-form-category-menu>li").click(function(){
	        let value=$(this).text();
	
	        $("#navbarNavDarkDropdown2 button span").text(value);
	        $("#recept-form-category").val(value);
	    });
	
	    /* 하위 메뉴 클릭시 속성 */
	    $(".recept-sub-menu-item").click(function(){
	        $(this).siblings().removeClass("recpet-sub-menu-selected");
	        $(this).addClass("recpet-sub-menu-selected");
	        // console.log($(this).index());
	
	        if($(this).index()==0){
	            $(".recpet-part1").css("display","block");
	            $(".recept-part2").css("display","none");
	        }else{
	            $(".recpet-part1").css("display","none");
	            $(".recept-part2").css("display","block");
	        }
	    });
	    
	    /* 답변이 없을 경우 스타일 변경 */
        $(function(){
            if($("#recpet-answer-content-text").val()==""){
                $("#recpet-answer-content-text").css("background-color","lightgray");
            }
        });

        /* 목록 버튼 클릭시 목록 게시판으로 이동 */
        $(".recept-back-category-btn").click(()=>location.href="<%=contextPath%>/myReception");
	
	    /* 문의폼 작성 */ 
	    function receptValidate(){
	    	if($("#recept-category-btn>span").text()=="선택"){
	            $("#recept-category-btn").css("border","1px solid red");
	            return false;
	        }
	
	        if(!$("#recept-form-agree").is(":checked")){
	            $("#recept-form-agree").css({
	            	"outline-style": "solid", "outline-color" : "red", "outline-width" : "2px"
	            });
	            return false;
	        }
	        return true;
	    }
	    
	    /* 폼체크 표시 해제 이벤트 */
	    $("#recept-form-category-menu>li, #recept-form-agree").click(()=>{
	        if(document.getElementById("recept-category-btn").style.border == "1px solid red"){
	            document.getElementById("recept-category-btn").style.border = "1px solid black";
	        }
	        if(document.getElementById("recept-form-agree").style.outlineStyle=="solid"){
	            document.getElementById("recept-form-agree").style.outlineStyle="none";
	        }
	    });
	
	    /* 개인정보수집동의안내 전문보기 */
	    $("#recept-right-info-btn").click(function(){
	        $(".recept-right-info").css("display","block");
	    });
	
	    $(".recept-right-info-close").click(()=>{$(".recept-right-info").css("display","none");});

    </script>
    <!-- End Script -->

</body>
</html>