package main.java.reception.model.vo;

import java.util.Date;

public class Reception {

	private String receptionNo;
	private String userId;
	private String title;
	private String text;
	private Date uploadDate;
	private String category;
	private int rowNum;
	private String status;
	private String reply;
	
	public Reception() {
		
	}
	
	public Reception(String userId, int rowNum) {
		super();
		this.userId = userId;
		this.rowNum = rowNum;
	}

	public Reception(String userId, String category) {
		super();
		this.userId = userId;
		this.category = category;
	}

	public Reception(String title, Date uploadDate, int rowNum, String status) {
		super();
		this.title = title;
		this.uploadDate = uploadDate;
		this.rowNum = rowNum;
		this.status = status;
	}
	
	public Reception(String userId, String title, String text, Date uploadDate, String reply) {
		super();
		this.userId = userId;
		this.title = title;
		this.text = text;
		this.uploadDate = uploadDate;
		this.reply = reply;
	}

	public Reception(String receptionNo, String userId, String title, String text, Date uploadDate, String category, int rowNum, String status, String reply) {
		super();
		this.receptionNo = receptionNo;
		this.userId = userId;
		this.title = title;
		this.text = text;
		this.uploadDate = uploadDate;
		this.category = category;
		this.rowNum = rowNum;
		this.status = status;
		this.reply = reply;
	}

	public String getReceptionNo() {
		return receptionNo;
	}

	public void setReceptionNo(String receptionNo) {
		this.receptionNo = receptionNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
}
