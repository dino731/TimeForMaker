package  main.java.member.model.vo;

public class UserKeyword {
	private String classKeyword;//CLASS_KEYWORD
	private String userId; //USER_ID
	
	private String productNo;
	private String className; 
	private int price;
	private String classCategory;
	
    private String fileName;
    public UserKeyword(String classKeyword, String userId, String productNo, String className, int price,
			String classCategory, String fileName, String fileSavePath, int fileLevel) {
		super();
		this.classKeyword = classKeyword;
		this.userId = userId;
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.classCategory = classCategory;
		this.fileName = fileName;
		this.fileSavePath = fileSavePath;
		this.fileLevel = fileLevel;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSavePath() {
		return fileSavePath;
	}

	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	private String fileSavePath;
    private int fileLevel;
	
	public String getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}

	public UserKeyword(String classKeyword, String userId, String productNo, String className, int price,
			String classCategory) {
		super();
		this.classKeyword = classKeyword;
		this.userId = userId;
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.classCategory = classCategory;
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

	public UserKeyword(String classKeyword, String userId, String productNo, String className, int price) {
		super();
		this.classKeyword = classKeyword;
		this.userId = userId;
		this.productNo = productNo;
		this.className = className;
		this.price = price;
	}

	public UserKeyword(){
		super();
	}

	public UserKeyword(String classKeyword, String userId) {
		super();
		this.classKeyword = classKeyword;
		this.userId = userId;
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

	@Override
	public String toString() {
		return "UserKeyword [classKeyword=" + classKeyword + ", userId=" + userId + ", productNo=" + productNo
				+ ", className=" + className + ", price=" + price + ", classCategory=" + classCategory + ", fileName="
				+ fileName + ", fileSavePath=" + fileSavePath + ", fileLevel=" + fileLevel + "]";
	}

	
	
	
}
