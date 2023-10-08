/* 사이드메뉴 클릭시 효과 */
$(".side-menu .list-group-sub").click(function(){
    $(this).siblings().removeClass("side-menu-selected");
    $(this).addClass("side-menu-selected");
});

/* 페이지 타이틀(현재 페이지가 무슨 서비스인지) 이벤트 */
$(".customer-center-title").text($(".side-menu-selected").text());