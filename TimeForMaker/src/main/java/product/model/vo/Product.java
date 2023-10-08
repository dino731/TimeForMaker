package  main.java.product.model.vo;

public class Product {

	private String productNo;// PRODUCT_NO
	private String className;// CLASS_NAME
	private int price;// PRICE
	private String location;// LOCATION
	private int maxPerson;// MAX_PERSON
	private String deleteCheck;// DELETE_CHECK
	private int views;// VIEWS
	private double rating;// RATING
	private String notice;// NOTICE
	// 여기까지 PRODUCT 테이블

	private int nowPerson;
	// 얘는 예약인원 세는 용도

	private String classIntro;
	private String classProgress;
	private String classKeyword;
	private String classCategory;
	private String classOption;
	
	private String userId;//키워드 검색에서 씀
	// 여기까지 PRODUCT_INFO 테이블
	
	//파일 슬기가 씀 ㅎㅎ 
	private String refNo;
	private String fileName;
	private String fileSavePath;
	private int fileLevel;
	
	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
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
	
	public Product() {

	}
	public Product(String productNo, String className, int price, String location, int maxPerson, String deleteCheck,
			int views, double rating, String notice, int nowPerson, String classIntro, String classProgress,
			String classKeyword, String classCategory, String classOption, String userId, String refNo, String fileName,
			String fileSavePath, int fileLevel) {
		super();
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.location = location;
		this.maxPerson = maxPerson;
		this.deleteCheck = deleteCheck;
		this.views = views;
		this.rating = rating;
		this.notice = notice;
		this.nowPerson = nowPerson;
		this.classIntro = classIntro;
		this.classProgress = classProgress;
		this.classKeyword = classKeyword;
		this.classCategory = classCategory;
		this.classOption = classOption;
		this.userId = userId;
		this.refNo = refNo;
		this.fileName = fileName;
		this.fileSavePath = fileSavePath;
		this.fileLevel = fileLevel;
	}
	public Product(String productNo, String className, int price, String location, int maxPerson, String deleteCheck,
			int views, double rating, String notice, int nowPerson, String classIntro, String classProgress,
			String classKeyword, String classCategory, String classOption, String userId) {
		super();
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.location = location;
		this.maxPerson = maxPerson;
		this.deleteCheck = deleteCheck;
		this.views = views;
		this.rating = rating;
		this.notice = notice;
		this.nowPerson = nowPerson;
		this.classIntro = classIntro;
		this.classProgress = classProgress;
		this.classKeyword = classKeyword;
		this.classCategory = classCategory;
		this.classOption = classOption;
		this.userId = userId;
	}
	public Product(String productNo, String className, int price, String location, int maxPerson, String deleteCheck,
			int views, double rating, String notice, int nowPerson, String classIntro, String classProgress,
			String classKeyword, String classCategory, String classOption) {
		super();
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.location = location;
		this.maxPerson = maxPerson;
		this.deleteCheck = deleteCheck;
		this.views = views;
		this.rating = rating;
		this.notice = notice;
		this.nowPerson = nowPerson;
		this.classIntro = classIntro;
		this.classProgress = classProgress;
		this.classKeyword = classKeyword;
		this.classCategory = classCategory;
		this.classOption = classOption;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getMaxPerson() {
		return maxPerson;
	}
	public void setMaxPerson(int maxPerson) {
		this.maxPerson = maxPerson;
	}
	public String getDeleteCheck() {
		return deleteCheck;
	}
	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getNowPerson() {
		return nowPerson;
	}
	public void setNowPerson(int nowPerson) {
		this.nowPerson = nowPerson;
	}
	public String getClassIntro() {
		return classIntro;
	}
	public void setClassIntro(String classIntro) {
		this.classIntro = classIntro;
	}
	public String getClassProgress() {
		return classProgress;
	}
	public void setClassProgress(String classProgress) {
		this.classProgress = classProgress;
	}
	public String getClassKeyword() {
		return classKeyword;
	}
	public void setClassKeyword(String classKeyword) {
		this.classKeyword = classKeyword;
	}
	public String getClassCategory() {
		return classCategory;
	}
	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}
	public String getClassOption() {
		return classOption;
	}
	public void setClassOption(String classOption) {
		this.classOption = classOption;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", className=" + className + ", price=" + price + ", location="
				+ location + ", maxPerson=" + maxPerson + ", deleteCheck=" + deleteCheck + ", views=" + views
				+ ", rating=" + rating + ", notice=" + notice + ", nowPerson=" + nowPerson + ", classIntro="
				+ classIntro + ", classProgress=" + classProgress + ", classKeyword=" + classKeyword
				+ ", classCategory=" + classCategory + ", classOption=" + classOption + ", userId=" + userId
				+ ", refNo=" + refNo + ", fileName=" + fileName + ", fileSavePath=" + fileSavePath + ", fileLevel="
				+ fileLevel + "]";
	}
	public Product(String productNo, String className, int price, String location, String classKeyword, String userId) {
		super();
		this.productNo = productNo;
		this.className = className;
		this.price = price;
		this.location = location;
		this.classKeyword = classKeyword;
		this.userId = userId;
	}

	

}
