<%@ page import="main.java.product.model.vo.Product" %>
<%@ page import="main.java.product.model.vo.File" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    List<Product> pList = (List<Product>) request.getAttribute("productList");
    List<File> fList = (List<File>) request.getAttribute("fileList");
%>


<!DOCTYPE html>
<html lang="en">


<head>
    <title>product_list</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/assets/img/TFM_icon.png">

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/mypage_login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/templatemo.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/fontawesome.min.css" type="text/css">

    <!-- 스타일 시트(슬기)-->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/user-header.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/product_list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script>

        function filterProducts() {
            // 선택한 input 요소들의 값을 가져옵니다.
            var selectedLocations = Array.from(document.querySelectorAll('input[name="location"]:checked')).map(function (input) {
                return input.value;
            });

            var selectedCategories = Array.from(document.querySelectorAll('input[name="category"]:checked')).map(function (input) {
                return input.value;
            });

            var selectedKeywords = Array.from(document.querySelectorAll('input[name="keyword"]:checked')).map(function (input) {
                return input.value;
            });


            function showAllProducts() {
                var productBoxes = document.querySelectorAll('.pl_class_card_wrap_item');
                productBoxes.forEach(function (box) {
                    box.style.display = 'block';
                });
            }
            function chekced(obj) { //체크하기
                obj.parentNode.querySelector('input').checked = true;

                const filterInputs = document.querySelectorAll('.pl_filter01 input');
                filterInputs.forEach(function (input) {
                    if (input !== obj.parentNode.querySelector('input')) {
                        input.checked = false;
                    }
                });
            }


            function unChekced(obj) { //체크해제
                obj.parentNode.querySelector('input').checked = false;
            }
    </script>

</head>

<body>

<%@ include file="/views/common/user-header1.jsp" %>
<!-- Start Content -->
<br>
<div class="container py-5 pl_class_all">
    <div class="row">
    	<div>
			<img style="width: 100%; height: 300px; align-content: center;" class="img-fluid" src="/TimeForMaker/assets/img/allclass.jpg" alt="">
		</div>
        <!-- <h1 class="h2 pl_class_all_title">TFM 클래스</h1> -->
        <div class="col-12 mb-3">
            <div class="w-100 my-3 border-top border"></div>
        </div>
        <div class="pl_filter">
            <div class="pl_search">
                <form id="searchForm" action="" method="post" class="pl_search_rap">
                    <div class="input-group pl_search_area">
                        <input type="text" class="pl_search_text" id="inputPLSeach" name="inputPLSeach"
                               placeholder="클래스 명으로 바로 검색~" style="margin-left: 2%">
                        <button type="submit" class="bg-success text-light pl_search_btn">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="pl_key_check_result" id="pl_key_check_result_view">
                <ul>
                    <form id="filterForm" action="" method="post"> <!-- 서버 URL을 적절히 수정해야 합니다 -->
                        <ul class="pl_filter_wrap">
                            <h3>클래스 키워드 검색</h3>
                            <h5 class="pl_key_title">지역</h5>
                            <li>
                                <input type="checkbox" name="location" value="강남구" id="location1">
                                <label class="pl_filter01 btn btn-light" for="location1">강남구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="용산구" id="location2">
                                <label class="pl_filter01 btn btn-light" for="location2">용산구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="성동구" id="location3">
                                <label class="pl_filter01 btn btn-light" for="location3">성동구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="종로구" id="location4">
                                <label class="pl_filter01 btn btn-light" for="location4">종로구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="중구" id="location5">
                                <label class="pl_filter01 btn btn-light" for="location5">중구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="마포구" id="location6">
                                <label class="pl_filter01 btn btn-light" for="location6">마포구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="관악구" id="location7">
                                <label class="pl_filter01 btn btn-light" for="location7">관악구</label>
                            </li>
                            <li>
                                <input type="checkbox" name="location" value="영등포구" id="location8">
                                <label class="pl_filter01 btn btn-light" for="location8">영등포구</label>
                            </li>
                            <h5 class="pl_key_title">키워드</h5>
                            <% Set<String> uniqueCategories = new HashSet<>();
                                Set<String> uniqueKeywords = new HashSet<>();
                                for (int i = 0; i < pList.size(); i++) {
                                    uniqueCategories.add(pList.get(i).getClassCategory());
                                    uniqueKeywords.add(pList.get(i).getClassKeyword());
                                }
                            %>
                            <% for (String category : uniqueCategories) { %>
                            <li>
                                <input type="checkbox" name="category" value="<%= category %>"
                                       id="category<%= category %>">
                                <label class="pl_filter01 btn btn-light" for="category<%= category %>"><%= category %>
                                </label>
                            </li>
                            <% } %>
                            <% for (String keyword : uniqueKeywords) { %>
                            <li>
                                <input type="checkbox" name="keyword" value="<%= keyword %>" id="keyword<%= keyword %>">
                                <label class="pl_filter01 btn btn-light" for="keyword<%= keyword %>"><%= keyword %>
                                </label>

                            </li>
                            <% } %>
                        </ul>
                        <input
                                type="submit"
                                value="검색"
                                onclick="filterProducts()"
                                class = "btn btn-outline-warning"
                                id="filterButton"
                        />
                   

                    </form>

                </ul>
            </div>


        </div>
        <%
            java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
        %>
        <%--        카드생성 --%>
        <% for (int i = 0; i < pList.size(); i++) { %>
        <% String location = pList.get(i).getLocation();
            String district = "";
            if (location.contains("강남구")) {
                district = "강남구";
            } else if (location.contains("용산구")) {
                district = "용산구";
            } else if (location.contains("성동구")) {
                district = "성동구";
            } else if (location.contains("종로구")) {
                district = "종로구";
            } else if (location.contains("중구")) {
                district = "중구";
            } else if (location.contains("마포구")) {
                district = "마포구";
            } else if (location.contains("관악구")) {
                district = "관악구";
            } else if (location.contains("영등포구")) {
                district = "영등포구";
            }
        %>
        <%-- 카드 하나하나 --%>
        <div class="pl_class_card_wrap_item <%= pList.get(i).getClassKeyword() + " " + pList.get(i).getClassCategory() + " " + district %>">
            <div class="pl_class_card_img">
                <a href="<%= request.getContextPath() %>/detail.product?pno=<%= pList.get(i).getProductNo() %>">
                    <img class="pl_card-img rounded-0 img-fluid <%= pList.get(i).getClassKeyword() + " " + pList.get(i).getClassCategory() + " " + district %>"
                         src="<%= request.getContextPath() + fList.get(i).getFileSavePath() + fList.get(i).getFileName() %>">
                </a>
            </div>
            <div class="pl_class_card_body">
                <a href="<%= request.getContextPath() %>/detail.product?pno=<%= pList.get(i).getProductNo() %>"
                   class="pl_class_card_name <%= pList.get(i).getClassKeyword() + " " + pList.get(i).getClassCategory() + " " + district %>">
                    <%= pList.get(i).getClassName() %>
                </a>
                <ul class="pl_class_card_key">
                    <li class="<%= pList.get(i).getClassKeyword() + " " + pList.get(i).getClassCategory() + " " + district %>">
                        <%= pList.get(i).getClassKeyword() %>
                    </li>
                    <li><%= district %></li>
                </ul>
                <p class="pl_class_card_price <%= pList.get(i).getClassKeyword() + " " + pList.get(i).getClassCategory() + " " + district %>">
                    <%= decimalFormat.format(pList.get(i).getPrice()) %> ₩
                </p>
            </div>
        </div>
        <% } %>


    </div>
</div>
<!-- End Content -->
<!-- Start Footer -->
<footer class="main_footer" id="tempaltemo_footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 pt-5">
                <img src="<%= request.getContextPath()%>/assets/img/메인로고.png" class="main_logo">
                <ul class="list-unstyled text-light footer-link-list">
                    <li><i class="fas fa-map-marker-alt fa-fw"></i> 서울특별시 강남구
                        테헤란로14길6
                    </li>
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
<!-- End Footer -->
<div class="list"></div>
<p id="sentinel"></p>


<script>
    // 모든 상품 보이기
    function showAllProducts() {
        var productBoxes = document.querySelectorAll('.pl_class_card_wrap_item');
        productBoxes.forEach(function (box) {
            box.style.display = 'block';
        });
    }

    // 필터링된 URL을 생성하는 함수
    function generateFilteredURL() {
        var selectedLocations = Array.from(document.querySelectorAll('input[name="location"]:checked')).map(function (input) {
            return input.value;
        });

        var selectedCategories = Array.from(document.querySelectorAll('input[name="category"]:checked')).map(function (input) {
            return input.value;
        });

        var selectedKeywords = Array.from(document.querySelectorAll('input[name="keyword"]:checked')).map(function (input) {
            return input.value;
        });

        var urlParams = new URLSearchParams();
        selectedLocations.forEach(function (location) {
            urlParams.append('location', location);
        });
        selectedCategories.forEach(function (category) {
            urlParams.append('category', category);
        });
        selectedKeywords.forEach(function (keyword) {
            urlParams.append('keyword', keyword);
        });

        var currentURL = new URL(window.location.href);
        var baseURL = currentURL.origin + currentURL.pathname;
        return baseURL + '?' + urlParams.toString();
    }


    // 필터링된 URL로 페이지 이동
    function navigateToFilteredURL() {
        var filteredURL = generateFilteredURL();
        history.replaceState(null, null, filteredURL);
        applyFilterFromURLParams();
    }

    // 페이지 로딩 시 URL 파라미터에서 필터 상태를 읽어와 필터링 적용
    function applyFilterFromURLParams() {
        var urlParams = new URLSearchParams(window.location.search);

        var selectedLocations = urlParams.getAll('location');
        var selectedCategories = urlParams.getAll('category');
        var selectedKeywords = urlParams.getAll('keyword');
        var searchKeyword = document.getElementById('inputPLSeach').value.toLowerCase();

        var productBoxes = document.querySelectorAll('.pl_class_card_wrap_item');
        productBoxes.forEach(function (box) {
            var isVisible = false;

            if (searchKeyword && box.innerText.toLowerCase().includes(searchKeyword)) {
                isVisible = true;
                return;
            }

            selectedLocations.forEach(function (location) {
                if (box.classList.contains(location)) {
                    isVisible = true;
                    return;
                }
            });

            selectedCategories.forEach(function (category) {
                if (box.classList.contains(category)) {
                    isVisible = true;
                    return;
                }
            });

            selectedKeywords.forEach(function (keyword) {
                if (box.classList.contains(keyword)) {
                    isVisible = true;
                    return;
                }
            });

            if (isVisible) {
                box.style.display = 'block';
            } else {
                box.style.display = 'none';
            }
        });
    }


    // 검색 버튼 클릭 시 필터링된 URL로 이동
    document.getElementById('filterButton').addEventListener('click', function (event) {
        event.preventDefault();
        navigateToFilteredURL();

        document.getElementById('searchForm').addEventListener('submit', function (event) {
            event.preventDefault();
            navigateToFilteredURL();
        });
    });

    // 페이지 로딩 시 URL 파라미터에서 필터 상태를 읽어와 필터링 적용
    window.addEventListener('load', function () {
        showAllProducts(); // 모든 상품을 보이도록 설정
        // URL 파라미터에서 필터 상태를 읽어와 적용
    });
</script>

</body>

</html>