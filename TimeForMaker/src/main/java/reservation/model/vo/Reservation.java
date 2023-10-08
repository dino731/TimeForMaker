package main.java.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private Long reservationNo; //RESERVATION_NO	NUMBER
	private Date reservationDate;//RESERVATION_DATE	DATE
	private String reservationStatus;//RESERVATION_STATUS	VARCHAR2(30 BYTE)
	private String reservationTime;//RESERVATION_TIME	DATE
	private String paymentStatus;//PAYMENT_STATUS	VARCHAR2(30 BYTE)
	private int userNum;//USER_NUM	NUMBER
	private String userId;//USER_ID	VARCHAR2(100 BYTE)
	private String productNo;//PRODUCT_NO	VARCHAR2(20 BYTE)
	
	private String userName;
	private String userPhone;
	private String className;
	
	public Reservation() {
		
	}
	
	public Reservation(Date reservationDate, String reservationTime, int userNum, String userId, String productNo,
			String userName, String userPhone) {
		super();
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.userNum = userNum;
		this.userId = userId;
		this.productNo = productNo;
		this.userName = userName;
		this.userPhone = userPhone;
	}

	public Reservation(Long reservationNo, Date reservationDate, String reservationTime, int userNum, String userId,
			String productNo, String userName, String userPhone) {
		super();
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.userNum = userNum;
		this.userId = userId;
		this.productNo = productNo;
		this.userName = userName;
		this.userPhone = userPhone;
	}

	public Reservation(Long reservationNo, Date reservationDate, String reservationStatus, String reservationTime,
			String paymentStatus, int userNum, String userId, String productNo, String userName, String userPhone,
			String className) {
		super();
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.reservationStatus = reservationStatus;
		this.reservationTime = reservationTime;
		this.paymentStatus = paymentStatus;
		this.userNum = userNum;
		this.userId = userId;
		this.productNo = productNo;
		this.userName = userName;
		this.userPhone = userPhone;
		this.className = className;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getClassName() {
		return className;
	}



	public void setClassName(String className) {
		this.className = className;
	}

	public Reservation(Long reservationNo, Date reservationDate, String reservationStatus, String reservationTime,
			String paymentStatus, int userNum, String userId, String productNo) {
		super();
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.reservationStatus = reservationStatus;
		this.reservationTime = reservationTime;
		this.paymentStatus = paymentStatus;
		this.userNum = userNum;
		this.userId = userId;
		this.productNo = productNo;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", reservationDate=" + reservationDate
				+ ", reservationStatus=" + reservationStatus + ", reservationTime=" + reservationTime
				+ ", paymentStatus=" + paymentStatus + ", userNum=" + userNum + ", userId=" + userId + ", productNo="
				+ productNo + ", userName=" + userName + ", userPhone=" + userPhone + ", className=" + className + "]";
	}

}
