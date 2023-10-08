<%@ page import="java.util.ArrayList, main.java.reception.model.vo.Reception, main.java.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true"%>
<%
	//String contextPath = request.getContextPath();

	// loginUser 세션에서 가져와야 함
	// loginUser에서 관리자인지 회원인지 구분 필요
	// Member loginUser = request.getSession().getAttribute("loginUser");
	ArrayList<Reception> list = (ArrayList<Reception>)request.getAttribute("list");
	
	String category = request.getParameter("category")==null?"전체":request.getParameter("category");
	String status = request.getParameter("status")==null?"대기":request.getParameter("status");
	//String category = (String)request.getAttribute("category");
	//String status = (String)request.getAttribute("status");
	// 값을 받아올 것이므로 이후 삭제 필요
	
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
<title>Reception Board</title>

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

	<!-- Start 회원문의 관리 게시판 -->
    <div class="reception-side-container" style="position: relative;">

        <!-- Start Side-Menu -->
        <div class="side-menu" style="top: 50%;">
            <ul class="list-group list-group-flush">
                <li class="list-group-item list-group-title"><span>고객센터</span></li>
                <li class="list-group-item list-group-sub"><a href="<%=contextPath%>/noticeBoard">공지사항</a></li>
                <li class="list-group-item list-group-sub side-menu-selected"><a href="<%=contextPath%>/manageReception">회원 문의</a></li>
              </ul>
        </div>
        <!-- Close Side-Menu -->
    
        <!-- Start Manager Recept Board Container 문의내역 -->
        <div class="recept-part"> 
            <!-- Start Recept Page Title -->
            <h3 align="center" class="customer-center-title">회원 문의</h3>
            <!-- Close Recept Page Title -->

            <!-- Start Recept Board Part -->
            <div class="manager-recept-part">
                <div class="manager-recept-selectBoxList">
                    <div class="manager-recept-selectBox">
                        <span>분류</span>
                        <div class="manager-select-btn">
                            <button class="manager-select-label"><%=category %></button>
                            <ul class="manager-select-optionList">
                                <li class="manager-select-optionItem">전체</li>
                                <li class="manager-select-optionItem">계정</li>
                                <li class="manager-select-optionItem">예약</li>
                                <li class="manager-select-optionItem">기타</li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="manager-recept-selectBox">
                        <span>처리상태</span>
                        <div class="manager-select-btn">
                            <button class="manager-select-label"><%=status %></button>
                            <ul class="manager-select-optionList">
                                <li class="manager-select-optionItem">완료</li>
                                <li class="manager-select-optionItem">대기</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Start Recept Board Part -->
                <div class="container recept-board-area" id="manager-recept-board-area">
                    <table class="table" style="table-layout:fixed">
                        <thead>
                            <tr>
                                <th scope="col" width="13%">처리상태</th>
                                <th scope="col" width="17%">접수 일자</th>
                                <th scope="col" colspan="2" width="60%">문의 제목</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% int i=0; %>
                        	<% if(list!=null){ %>
                        		<% for(Reception r : list){ %>
	                        		<tr>
		                                <td scope="row" height="40vh">
		                                	<%=r.getStatus() %>
		                                <td><%=r.getUploadDate() %></td>
		                                <td colspan="2"><a href="<%=contextPath%>/reception?no=<%=r.getReceptionNo() %>"><%=r.getTitle() %></a></td>
		                            </tr>
		                            <% i++; %>
                        		<% } %>
                        	<% } %>
                        	<% for(;i<5;i++){ %>
                        		<tr>
	                                <td scope="row" height="40vh"></td>
	                                <td></td>
	                                <td colspan="2"></td>
	                            </tr>
                        	<% } %>
                        </tbody>
                        <!-- <tfoot>
                        </tfoot> -->
                    </table>
        
                    <nav id="notice-recept-board-navi" aria-label="Page navigation">
		                <ul class="pagination justify-content-center">
		                <%-- <% if(maxPage != pageLimit) { %>
			                  <li class="page-item"> <!-- notice-page-pre 수정됨 -->
			                  	<% if(startPage != 1){ %>
			                  		<a class="page-link notice-page-pre" href="#" onclick="moveReceptPage(<%=startPage-pageLimit%>)" aria-label="Previous">
				                    	<span aria-hidden="true">&laquo;</span>
				                    </a>
			                    <% }else{ %>
			                    	<a class="page-link notice-page-pre" href="#" aria-label="Previous" onclick="return false;">
				                    	<span aria-hidden="true">&laquo;</span>
				                    </a>
			                    <% } %>
			                      
			                  </li>
			              <% } %> --%>
			              
			              <% if(maxPage > pageLimit) { %>
			                  <li class="page-item"> <!-- notice-page-pre 수정됨 -->
			                  	<% if(startPage != 1){ %>
			                  		<a class="page-link notice-page-pre" href="#" onclick="moveReceptPage(<%=startPage-pageLimit%>)" aria-label="Previous">
				                    	<span aria-hidden="true">&laquo;</span>
				                    </a>
			                    <% }else{ %>
			                    	<a class="page-link notice-page-pre" href="#" aria-label="Previous" onclick="return false;">
				                    	<span aria-hidden="true">&laquo;</span>
				                    </a>
			                    <% } %>
			                      
			                  </li>
			              <% } %>
			              
			              <% for(int p = startPage; p<= endPage; p++){ %>
			              	<% if(p==currentPage) { %>
			                  <li class="page-item notice-recept-page-clicked"><a class="page-link" href="<%=contextPath%>/manageReception?page=<%=p %>" onclick="return false;"><%=p %></a></li>
			              	<% } else { %>
			                  <li class="page-item"><a class="page-link" href="#" onclick="moveReceptPage(<%=p %>)"><%=p %></a></li>	              	
			              	<% } %>
			              <% } %>
		                  
		                  <% if(maxPage > pageLimit) { %>
			                  <li class="page-item">
			                  <% if(endPage == maxPage){ %>
			                    <a class="page-link notice-page-next" href="#" aria-label="Next" onclick="return false;">
			                      <span aria-hidden="true">&raquo;</span>
			                    </a>
			                  <% } else{ %>
			                  	<a class="page-link notice-page-next" href="#" onclick="moveReceptPage(<%=startPage+pageLimit%>)" aria-label="Next">
			                       <!-- href="<%=contextPath%>/manageReception?page=<%=startPage+pageLimit%>" -->
			                      <span aria-hidden="true">&raquo;</span>
			                    </a>
			                  <% }%>
			                  </li>
		                  <% } %>
		                </ul>
		            </nav>
                </div>

            </div>
            <!-- Close Recept Board Part -->
            
        </div>

        <!-- Close Manager Recept Board Container -->
    </div>
    
    <!-- Close 회원문의 관리 게시판 -->
	
	 <!-- Start Footer -->
    <footer class="main_footer" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <img src="../assets/img/메인로고.png" class="main_logo">
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
	    /* $("#manager-recept-search-category-menu>li").click(function(){
	        let value=$(this).text();
	        $("#navbarNavDarkDropdown button span").text(value);
	
	        let url=`manageReception?category=${value}`;
	        location.href=url;
	    }); */
	
	    /* 공지사항 게시판 페이징 버튼 효과 --수정됨 */
	    $(".page-item").click(function(){
	    	if(!($(this).children().hasClass("notice-page-next")||$(this).children().hasClass("notice-page-pre"))){
		        $(this).siblings().removeClass("notice-recept-page-clicked");
		        $(this).addClass("notice-recept-page-clicked"); 
	    	}
	    });
	
	    /* 게시판에 빈 라인 hover삭제 */
	    $("#manager-recept-board-area>table>tbody>tr").hover(function(){
	        if($(this).children("td").first().text()!=""){
	            $(this).css("background-color","beige");
	        }
	    }, function(){
            $(this).css("background-color","transparent");
	    });
	
	    /* 게시판 빈칸 속성지정 */
	    $("#manager-recept-board-area tbody tr>td:first-child").each(function(index){
	        if($(this).text()==""){
	            $("#manager-recept-board-area tbody tr").eq(index).css("border","white");
	            if(index==4){
	                $("#manager-recept-board-area tbody tr").eq(index).css("border-bottom","black");
	            }
	        }else{
	        	if(index==4){
	                $("#manager-recept-board-area tbody tr").eq(index).css("border-bottom","black");
	            }
	        }
	    });
	
	    /* 회원 문의 분류 선택 -> 페이지 이동 */
	    let category;
		let status;
		let url;
		const label = document.querySelectorAll('.manager-select-label');
		label.forEach(function(lb) {
		  lb.removeEventListener('click', handleLabelClick); // 이전에 등록된 이벤트 핸들러 제거
		  lb.addEventListener('click', handleLabelClick); // 새로운 이벤트 핸들러 등록
		});
		
		function handleLabelClick(e) {
		  let optionList = e.target.nextElementSibling;
		  let optionItems = optionList.querySelectorAll('.manager-select-optionItem');
		  clickLabel(e.target, optionItems);
		}
		
		const clickLabel = (lb, optionItems) => {
		  if (lb.parentNode.classList.contains('active')) { // 열린 리스트 닫기 
		    lb.parentNode.classList.remove('active');
		    optionItems.forEach((opt) => {
		      opt.removeEventListener('click', handleSelect);
		    });
		  } else {
		    lb.parentNode.classList.add('active');
		    optionItems.forEach((opt) => {
		      opt.addEventListener('click', () => {
		        handleSelect(lb, opt);
		      });
		    });
		  }
		};
		
		const handleSelect = (label, item) => {
		  label.innerHTML = item.textContent;
		  label.parentNode.classList.remove('active');
		
		  category = $(".manager-recept-selectBox button").eq(0).text();
		  status = $(".manager-recept-selectBox button").eq(1).text();
		  
		  console.log(item.textContent);
		
		  url=`manageReception?category=${category}&status=${status}`;
		  location.href=url;
		};

        function moveReceptPage(page){
	    	category = $(".manager-recept-selectBox button").eq(0).text();
            status = $(".manager-recept-selectBox button").eq(1).text();

            url=`manageReception?category=${category}&status=${status}&page=${page}`;
            location.href=url;
	    }
	    
	    /* 알림창 닫기 이벤트 */
        $(".recept-alert-box-close").click(function(){
            $(".recept-alert-box").css("display","none");
        });
    </script>
    <!-- End Script -->

</body>
</html>