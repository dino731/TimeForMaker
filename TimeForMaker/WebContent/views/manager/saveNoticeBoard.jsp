<%@ page import="java.util.ArrayList, main.java.notice.model.vo.Notice, main.java.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String contextPath = request.getContextPath();
	
	// list : 공지임시저장리스트 -request로부터 받아야함
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	// 페이지 정보
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage   = pi.getStartPage();
	int endPage     = pi.getEndPage();
	int maxPage     = pi.getMaxPage(); 
	int pageLimit = pi.getPageLimit();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Save Notice Board</title>

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
	<%@ include file="/views/common/user-header1.jsp" %>
	<!-- Close 헤더 파트 -->
	
	<!-- Start Notice Page -->
    <div class="notice-side-container" style="position: relative;">

        <!-- Start Side-Menu -->
        <div class="side-menu">
            <ul class="list-group list-group-flush">
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath%>/noticeBoard">공지사항</a></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath%>/manageReception">회원 문의</a></li>
              </ul>
        </div>
        <!-- Close Side-Menu -->
    
        <!-- Start Save Notice Board Container -->
        <div class="container notice-save-board-area" id="notice-save-board-area">

            <h3>임시저장목록</h3>

            <table class="table" style="table-layout:fixed">
                <thead>
                    <tr>
                        <th scope="col" width="6%;">번호</th>
                        <th scope="col" width="13%">수정일</th>
                        <th scope="col" colspan="2" width="60%;">제목</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- href 수정 필요(현재는 공지폼으로 연동되어 있음 -> 공지 작성폼으로) -->
                	<% int i =0; %>
                	<% if(list!=null) { %>
	                	<% for(Notice n : list){ %>
	                   		<tr>
		                        <th scope="row"><%=n.getRowNum() %></th>
		                        <td><%=n.getDate() %></td>
		                        <td colspan="2"><a href="<%=contextPath %>/uploadNotice?no=<%=n.getNoticeNo() %>"><%=n.getTitle() %></a></td>
		                    </tr>
		                    <% i++; %>
	                 	<% } %>
                 	<% } %>
                	<% for(; i<10; i++) { %>
                   		<tr>
	                        <th scope="row"></th>
	                        <td></td>
	                        <td colspan="2"></td>
                    	</tr>
                    <% } %>
                </tbody>
                <tfoot>
                </tfoot>
            </table>

            <nav class="navbar navbar-expand-lg" id="notice-save-board-bar" style="background-color: transparent;">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end notice-back-btn">
                    <button type="button" class="btn" onclick="location.href='<%=contextPath%>/noticeBoard'">이전으로</button>
                </div>
            </nav>

            <nav id="notice-recept-board-navi" aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                <% if(maxPage > pageLimit) { %>
               		<li class="page-item save-notice-page-pre">
               			<% if(startPage != 1){ %>
		                    <a class="page-link" href="<%=contextPath%>/saveNoticeBoard?page=<%=startPage-pageLimit%>" aria-label="Previous">
		                      <span aria-hidden="true">&laquo;</span>
		                    </a>
		                <% }else{ %>
		                	<a class="page-link" aria-label="Previous" onclick="return false;">
		                    	<span aria-hidden="true">&laquo;</span>
		                    </a>
	                    <% } %>
                  	</li>
                  <% } %>
                  
                  <% for(int p = startPage; p<= endPage; p++){ %>
	              	 <% if(p==currentPage) { %>
	                  	<li class="page-item notice-recept-page-clicked"><a class="page-link" href="<%=contextPath%>/saveNoticeBoard?page=<%=p %>" onclick="return false;"><%=p %></a></li>
	              	 <% } else { %>
	                  	<li class="page-item"><a class="page-link" href="<%=contextPath%>/saveNoticeBoard?page=<%=p %>"><%=p %></a></li>	              	
	              	 <% } %>
	              <% } %>
                  
                  <% if(maxPage > pageLimit) { %>
	                  <li class="page-item">
	               	<% if(endPage == maxPage){ %>   
	               		<a class="page-link notice-page-next" aria-label="Next" onclick="return false;">
	                      <span aria-hidden="true">&raquo;</span>
	                    </a>
	               	<% } else{ %>
	               		<a class="page-link notice-page-next" href="<%=contextPath%>/saveNoticeBoard?page=<%=startPage+pageLimit%>" aria-label="Next">
	                      <span aria-hidden="true">&raquo;</span>
	                    </a>
	               	<% } %>
	                  </li>
                  <% } %>
                </ul>
            </nav>
        </div>

        <!-- Close Save Notice Board Container -->
        
        <!-- Start Alert Box -->
        <% if(session.getAttribute("msg")!=null){ %>
	        <div class="recept-alert-box">
	            <button type="button" class="btn btn-outline-dark recept-alert-box-close">X</button>
	            <span><%=session.getAttribute("msg") %></span>
	        </div>
        <% session.removeAttribute("msg"); %>
        <% } %>
        <!-- Close Alert Box -->
    </div>
    
    <!-- Close Notice Page -->
    
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
            if($(this).children("th").text()!=""){
                $(this).css("background-color","#F7F0D4");
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