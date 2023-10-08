package main.java.notice.model.vo;

import java.util.Date;

public class Notice {
	private String noticeNo;
	private String title;
	private String content;
	private Date date;
	private char save;
	private char impt;
	private int rowNum;
	
	public Notice() {
		
	}
	
	public Notice(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	
	public Notice(String title, String content, char save, char impt) {
		super();
		this.title = title;
		this.content = content;
		this.save = save;
		this.impt = impt;
	}

	public Notice(String noticeNo, String title, String content, Date date, char save, char impt) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.date = date;
		this.save = save;
		this.impt = impt;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public char getSave() {
		return save;
	}

	public void setSave(char save) {
		this.save = save;
	}

	public char getImpt() {
		return impt;
	}

	public void setImpt(char impt) {
		this.impt = impt;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
}
