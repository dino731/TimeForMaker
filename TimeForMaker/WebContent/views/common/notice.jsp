<%@ page import="main.java.notice.model.vo.Notice, main.java.member.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String contextPath = request.getContextPath();

	// loginUser 세션에서 가져와야 함
	// loginUser에서 관리자인지 회원인지 구분 필요
	//Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	Notice[] list = (Notice[])request.getAttribute("list");
	int nowNotice = Integer.parseInt(list[1].getNoticeNo().substring(1));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Notice</title>

<!-- load css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css" type="text/css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/customer-center.css" type="text/css">

<!-- load fonts style -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap" type="text/css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css" type="text/css">

<!-- load script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<!-- 헤더 페이지 추가 필요 -->
	<%@ include file="user-header1.jsp" %>
	<!-- Close 헤더 파트 -->

	<!-- Start 공지글 -->
    <div class="notice-side-container" style="position: relative;">

        <!-- Start Side-Menu -->
        <div class="side-menu">
            <ul class="list-group list-group-flush">
            	<% 
            		String[] noticeHref = {"공지사항", "noticeBoard"};
            		String[] receptHref = new String[2];
            		
	            	if(loginUser!=null && loginUser.getUserId().equals("M")){
	            		receptHref[0]="회원 문의";
	            		receptHref[1]="receptionManage";
	            	}else{
	            		receptHref[0]="1:1 문의";
	            		receptHref[1]="myReception";
	            	}
            	%>
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath %>/<%=noticeHref[1]%>"><%=noticeHref[0]%></a></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath %>/<%= receptHref[1]%>"><%=receptHref[0] %></a></li>
              </ul>
        </div>
        <!-- Close Side-Menu -->
    
        <!-- Start Notice Detail Container -->
        <div class="notice-board-area">
			<!-- Start Notice Page Title -->
	        <h3 align="center" class="customer-center-title">공지사항</h3>
	        <!-- Close Notice Page Title -->
	        
            <div class="notice-content">
                <h4><%=list[1].getTitle() %></h4>
                <div class="notice-content-part">
                    <div class="notice-content-header">
                        <span><%=list[1].getDate() %></span>
                        <!-- <a href="https://www.flaticon.com/kr/free-icons/" title="링크 아이콘">링크 아이콘  제작자: Freepik - Flaticon</a> -->
                        <button class="copy-link-btn"><span>링크복사</span></button>
                        <input type="text" id="urlAddress" style="display:none;">
                    </div>
                    <textarea readonly></textarea>
                    <script>
	                    let text = "<%=list[1].getContent()%>".replaceAll("<br>", "\r\n");
			        	$(".notice-content-part>textarea").val(text);
                    </script>
                </div>
            </div>
            <div class="notice-content-nav">
            	<% if(nowNotice!=1 && list[0]!=null){ %>
	                <div class="notice-content-nav-item prev">
	                    <span>이전</span>
	                    <a href="<%=contextPath %>/notice?no=<%=list[0].getRowNum() %>&impt=<%=list[0].getImpt()%>"><%=list[0].getTitle() %></a>
	                </div>
	            <% } %>
	            <% if(list[2]!=null){ %>
	                <div class="notice-content-nav-item next">
	                    <span>다음</span>
	                    <a href="<%=contextPath %>/notice?no=<%=list[2].getRowNum() %>&impt=<%=list[2].getImpt()%>"><%=list[2].getTitle() %></a>
	                </div>
	            <% } %>
            </div>

            <button class="btn btn-outline-secondary" onclick="location.href='<%=contextPath %>/noticeBoard'">목록</button>
        </div>

        <!-- Close Notice Detail Container -->

        <!-- Start Modal -->
        <div id="link-copy-modal" class="modal-part">
            <div class="modal-window">
                <div class="modal-title-area">
                    <h4>알림</h4>
                </div>
                <hr style="color: white;">
                <div class="modal-content"><b>현재 페이지 주소를 복사하였습니다.</b></div>
                <div class="modal-close-area">Close</div>
            </div>
        </div>
        <!-- Close Modal -->

    </div>
    <!-- Close 공지글 -->
	
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
	    /* url 링크 복사 기능 */
	    $(".copy-link-btn").click(function(){
	        let url = location.href;
	        $("#urlAddress").val(url).css('display','block').select();
	        document.execCommand("Copy");
	        $("#urlAddress").css('display','none');
	
	        // alert("현재 페이지 주소를 복사하였습니다.")
	        $("#link-copy-modal>.modal-window").css("display","block");
	    });
	
	    $(".modal-close-area").click(function(){
	        $("#link-copy-modal>.modal-window").css("display","none");
	    });

    </script>
    <!-- End Script -->

</body>
</html>