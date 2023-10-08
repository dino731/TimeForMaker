package main.java.mypage.model.vo;

import java.sql.Date;

public class MyPage {
	private Long reservationNo; 	//RESERVATION_NO	NUMBER
	private Date reservationDate;	//RESERVATION_DATE	DATE
	private String reservationStatus;//RESERVATION_STATUS	VARCHAR2(30 BYTE)
	private String reservationTime;	//RESERVATION_TIME	DATE
	private String paymentStatus;	//PAYMENT_STATUS	VARCHAR2(30 BYTE)
	private int userNum;			//USER_NUM	NUMBER
	
	private String productNo;		//PRODUCT_NO	VARCHAR2(20 BYTE)
	private String className;		//CLASS_NAME
	private int 	price; 			//PRICE
	private String fileSavePath;	//FILE_SAVE_PATH
	private String classKeyword; 	//CLASS_KEYWORD
	
	private String userId;			//USER_ID
	private String fileName;        //FILE_NAME
	
	public MyPage() {
		super();
	}

	public MyPage(Long reservationNo, Date reservationDate, String reservationStatus, String reservationTime,
			String paymentStatus, int userNum, String productNo, String className, int price, String fileSavePath,
			String classKeyword, String userId) {
		super();
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.reservationStatus = reservationStatus;
		this.reservationTime = reservationTime;
		this.paymentStatus = paymentStatus;
		this.userNum = userNum;
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.fileSavePath = fileSavePath;
		this.classKeyword = classKeyword;
		this.userId = userId;
	}
	
	
	
	

	public MyPage(Date reservationDate, String reservationTime, String paymentStatus, int userNum, String productNo,
			String className, String fileSavePath, String classKeyword) {
		super();
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.paymentStatus = paymentStatus;
		this.userNum = userNum;
		this.productNo = productNo;
		this.className = className;
		this.fileSavePath = fileSavePath;
		this.classKeyword = classKeyword;
	}

	public Long getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(Long reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFileSavePath() {
		return fileSavePath;
	}

	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}

	public String getClassKeyword() {
		return classKeyword;
	}

	public void setClassKeyword(String classKeyword) {
		this.classKeyword = classKeyword;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "MyPage [reservationNo=" + reservationNo + ", reservationDate=" + reservationDate
				+ ", reservationStatus=" + reservationStatus + ", reservationTime=" + reservationTime
				+ ", paymentStatus=" + paymentStatus + ", userNum=" + userNum + ", productNo=" + productNo
				+ ", className=" + className + ", price=" + price + ", fileSavePath=" + fileSavePath + ", classKeyword="
				+ classKeyword + ", userId=" + userId + ", fileName=" + fileName + "]";
	}
	
	
	


	
	
	
	
	
	
	
	


}
