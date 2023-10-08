<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리(전체)</title>
    <link rel="stylesheet" href="assets/css/product_content.css">
    <link rel="stylesheet" href="assets/css/product_modal.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<%@ include file="/views/common/user-header1.jsp" %>

	<div class="product_management">
	   <div class="product_management_title">
	       상품관리
	   </div>
	   <hr>
	   <div class="product_management_search_bar">
	       <input type="search" name="product_search_bar" id="product_search_bar">
	       <button id="product_search_bar_btn" onclick="product_search();">
	        <img src="assets/img/돋보기.png" style="width: 100%;">
	    </button>
	</div>
	
	<div class="product_management_all">
	    전체 상품 수 <span style="color: #FF8551; font-weight: bold;">05</span>개
	    <div class="product_management_btn">
	        <input type="button" name="product_register" id="product_register" value="상품등록" onclick="">
	        <input type="button" name="product_modify" id="product_modify" value="선택수정" onclick="product_register();">
	        <input type="button" name="product_delete" id="product_delete" value="선택삭제" onclick="product_delete();">
	    </div>
	</div>
	<!-- 리스트 -->
	<table class="product_management_list">
	    <tr>
	        <th><input type="checkbox" name="check" onclick="selectAll(this);" id="product_checkboxes"></th>
	            <th>등록번호</th>
	            <th>클래스명</th>
	            <th>가격</th>
	            <th>예약가능현황</th>
	        </tr>    
	        <tr>
	            <td><input type="checkbox" name="check" id="product_checkboxes"></td>
	            <td>252250257</td>
	            <td>나만의 도자기 만들기</td>
	            <td>75000</td>
	            <td>Y</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox" name="check" id="product_checkboxes"></td>
	            <td>575270752</td>
	            <td>봉제인형 클래스</td>
	            <td>55500</td>
	            <td>N</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox" name="check" id="product_checkboxes"></td>
	            <td>420540133</td>
	            <td>불편한 옷은 금방 수선하자</td>
	            <td>35000</td>
	            <td>N</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox" name="check" id="product_checkboxes"></td>
	            <td>758254151</td>
	            <td>내 손 끝에서 만들어지는 오마카세</td>
	            <td>90000</td>
	            <td>Y</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox" name="check" id="product_checkboxes"></td>
	            <td>604740155</td>
	            <td>컵 디자인 해보기</td>
	            <td>60000</td>
	            <td>Y</td>
	        </tr>
	    </table>
	</div>
	<script>
	function selectAll(selectAll){
	    const checkboxes = document.getElementsByName("check");
	
	    checkboxes.forEach((checkbox) => {
	        checkbox.checked = selectAll.checked;
	    })
	}
	</script>
	
	<br><br><!-- 페이징 바 -->
	<nav id="notice-recept-board-navi" aria-label="Page navigation">
	    <ul class="pagination justify-content-center">
	    <li class="page-item">
	        <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        </a>
	    </li>
	    <li class="page-item notice-recept-page-clicked"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item">
	        <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        </a>
	    </li>
	    </ul>
	</nav>
	
	<!-- 선택 삭제 확인창 -->
	<div class="product_delete">
	    <div class="product_delete_check"><br>
	        <b id="product_password_press">비밀번호를 입력해주세요.</b><br>
	        <input type="password" name="product_password_required" id="product_password_required"><br>
	        <input type="button" id="product_password_yeah" value="입력"onclick="product_password_yeah();">
	    <input type="button" id="product_password_no" value="닫기" onclick="product_password_no();">
	    </div>
	</div>
	<!-- 삭제성공 -->
	<div class="product_delete_success">
	    <div class="product_delete_success_check">
	        <span>성공적으로 삭제되었습니다.</span><br><br>
	        <input type="button" id="product_delete_success_check_close" value="닫기" onclick="product_delete_success_check();">
	    </div>
	</div>
	<!-- 삭제실패 -->
	<div class="product_delete_fail">
	    <div class="product_delete_fail_check">
	        <span>비밀번호가 틀렸습니다.</span><br><br>
	        <input type="button" id="product_delete_fail_check_retry" value="다시입력" onclick="product_delete_fail_check_retry();">
	    <input type="button" id="product_delete_fail_check_close" value="닫기" onclick="product_delete_fail_check_close();">
	    </div>
	</div>
	
	<script>
	function product_delete(){
	    let modal = document.querySelector(".product_delete");
	    modal.style.display = "block";
	}
	function product_password_yeah(){ //성공하는 모션만 연결해둠, 실패시는 기능구현했으나 뜨지 않게 해뒀음
	    let modal = document.querySelector(".product_delete_success");
	    modal.style.display = "block";
	}
	function product_password_no(){
	    let modal = document.querySelector(".product_delete");
	    modal.style.display = "none";
	}
	function product_delete_success_check(){
	    let modal1 = document.querySelector(".product_delete_success");
	    let modal2 = document.querySelector(".product_delete");
	    modal1.style.display = "none";
	    modal2.style.display = "none";
	}
	function product_delete_fail_check_retry(){
	    let modal = document.querySelector(".product_delete_fail");
	    modal.style.display = "none";
	}
	function product_delete_fail_check_close(){
	    let modal1 = document.querySelector(".product_delete_fail");
	    let modal2 = document.querySelector(".product_delete");
	    modal1.style.display = "none";
	    modal2.style.display = "none";
	}
	</script>
    
</body>
</html>