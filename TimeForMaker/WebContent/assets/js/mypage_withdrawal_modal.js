/* 결제 취소 모달 시작 */
function mypage_delete(){
  let modal = document.querySelector(".mypage_delete_more");
  modal.style.display = "block";
}
function mypage_delete_more_check_yes(){
  let modal = document.querySelector(".mypage_delete_more");
  modal.style.display = "none";
}
function mypage_delete_more_check_no(){
  let modal = document.querySelector(".mypage_delete_more");
  modal.style.display = "none";
}
/* 결제 취소 모달 끝 */

/* 회원탈퇴 모달 시작 */
function mypage_Withdrawal(){
  let modal = document.querySelector(".mypage_Withdrawal_more");
  modal.style.display = "block";
}
function mypage_Withdrawal_more_check_yes(){
  let modal = document.querySelector(".mypage_Withdrawal_more");
  let modal2 = document.querySelector(".mypage_Withdrawal_final");
  modal.style.display = "none";
  modal2.style.display = "block";
}
function mypage_Withdrawal_more_check_no(){
  let modal = document.querySelector(".mypage_Withdrawal_more");
  modal.style.display = "none";
}
function mypage_Withdrawal_final_check_yes(){
  let modal = document.querySelector(".mypage_Withdrawal_final");
  modal.style.display = "none";
  location.href = "LoginMain.html"; // 링크로 이동
}
function mypage_Withdrawal_final_check_no(){
  let modal = document.querySelector(".mypage_Withdrawal_final");
  modal.style.display = "none";
}
/* 회원탈퇴 모달 끝 */

/* 결제 모달 시작 */
function mypage_payment(){
  let modal = document.querySelector(".mypage_payment_more");
  modal.style.display = "block";
}
function mypage_payment_more_check_yes(){
  let modal = document.querySelector(".mypage_payment_more");
  modal.style.display = "none";

}
function mypage_payment_more_check_no(){
  let modal = document.querySelector(".mypage_payment_more");
  modal.style.display = "none";
}

/* 결제 모달 끝 */

/* 상세 결제 모달창 시작 */
function mypage_cancel_details(){
  let modal = document.querySelector(".mypage_details_more");
  modal.style.display = "block";
}
function mypage_details_more_check_yes(){
  let modal = document.querySelector(".mypage_details_more");
  modal.style.display = "none";

}

/* 상세 결제 모달창 시작 */
