package com.bg.plzSeatdown.admin.model.vo;

public class TheaterLogo {
	private int logoNo;
	private String logoPath;
	private String theaterCode;
	
	public TheaterLogo() {}
	
	public TheaterLogo(String logoPath, String theaterCode) {
		super();
		this.logoPath = logoPath;
		this.theaterCode = theaterCode;
	}

	public TheaterLogo(int logoNo, String logoPath, String theaterCode) {
		super();
		this.logoNo = logoNo;
		this.logoPath = logoPath;
		this.theaterCode = theaterCode;
	}

	public int getLogoNo() {
		return logoNo;
	}

	public void setLogoNo(int logoNo) {
		this.logoNo = logoNo;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	public String getTheaterCode() {
		return theaterCode;
	}

	public void setTheaterCode(String theaterCode) {
		this.theaterCode = theaterCode;
	}

	@Override
	public String toString() {
		return "TheaterLogo [logoNo=" + logoNo + ", logoPath=" + logoPath + ", theaterCode=" + theaterCode + "]";
	};
	
	
}
