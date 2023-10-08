package  main.java.mainpage.model.vo;

import java.sql.Date;

public class ClassLocation {
	private String clLoca;   //CLASS_LOCATION

	public ClassLocation() {
		super();
	}

	public ClassLocation(String clLoca) {
		super();
		this.clLoca = clLoca;
	}

	public String getClLoca() {
		return clLoca;
	}

	public void setClLoca(String clLoca) {
		this.clLoca = clLoca;
	}

	@Override
	public String toString() {
		return "ClassLocation [clLoca=" + clLoca + "]";
	}
	
	
}
