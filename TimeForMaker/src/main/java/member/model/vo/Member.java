package main.java.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;//USER_NO
	private String userId;//	USER_ID
	private String userName;//	USER_NAME
	private String userPwd;//	USER_PWD
	private String userNick;//	USER_NICK
	private String userPhone;//	USER_PHONE
	private Date userEnroll;//	USER_ENROLL
	private Date userModify;//	USER_MODIFY
	private String userType;//	USER_TYPE
	private String managerType;//	MANAGER_TYPE
	
	
	public Member() {
		super();
	}


	public Member(int userNo, String userId, String userName, String userPwd, String userNick,
			String userPhone, Date userEnroll, Date userModify, String userType, String managerType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEnroll = userEnroll;
		this.userModify = userModify;
		this.userType = userType;
		this.managerType = managerType;
	}


	public Member(int userNo, String userId, String userName, String userNick, String userPhone, Date userEnroll,
			Date userModify, String userType, String managerType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEnroll = userEnroll;
		this.userModify = userModify;
		this.userType = userType;
		this.managerType = managerType;
	}


	public Member(int userNo, String userId, String userName, String userNick, String userPhone,
			String managerType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.managerType = managerType;
	}

	
	public Member(String userId, Date userModify, String userType) {
		super();
		this.userId = userId;
		this.userModify = userModify;
		this.userType = userType;
	}


	public Member(int userNo, String userId, String userName, String userNick) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userNick = userNick;
	}

	/**
	 * 회원 가입 및 정보 수정 생성자 - ain 2023/07/14-
	 * @param userId
	 * @param userName
	 * @param userPwd
	 * @param userNick
	 * @param userPhone
	 */
	public Member(String userId, String userName, String userPwd, String userNick, String userPhone) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userNick = userNick;
		this.userPhone = userPhone;
	}
	
	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}




	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public Date getUserEnroll() {
		return userEnroll;
	}


	public void setUserEnroll(Date userEnroll) {
		this.userEnroll = userEnroll;
	}


	public Date getUserModify() {
		return userModify;
	}


	public void setUserModify(Date userModify) {
		this.userModify = userModify;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getManagerType() {
		return managerType;
	}


	public void setManagerType(String managerType) {
		this.managerType = managerType;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd
				+ ", userNick=" + userNick  + ", userPhone=" + userPhone + ", userEnroll="
				+ userEnroll + ", userModify=" + userModify + ", userType=" + userType + ", managerType=" + managerType
				+ "]";
	}


	
	

}
