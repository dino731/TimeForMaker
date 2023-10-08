package main.java.reception.model.vo;

import java.util.Date;

public class ReceptionFile {

	private String receptionNo;
	private String orgName;
	private String changeName;
	private String path;
	private Date uploadDate;
	
	public ReceptionFile() {
		
	}
	
	public ReceptionFile(String orgName, String changeName, String path) {
		super();
		this.orgName = orgName;
		this.changeName = changeName;
		this.path = path;
	}

	public ReceptionFile(String receptionNo, String orgName, String changeName, String path, Date uploadDate) {
		super();
		this.receptionNo = receptionNo;
		this.orgName = orgName;
		this.changeName = changeName;
		this.path = path;
		this.uploadDate = uploadDate;
	}

	public String getReceptionNo() {
		return receptionNo;
	}

	public void setReceptionNo(String receptionNo) {
		this.receptionNo = receptionNo;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
 }
