package com.bg.plzSeatdown.api.model.vo;

public class Theater {

	private String thCode;
	private String thNm;
	private String thPhone;
	private String thPage;
	private String thAddr;
	private double thLat;
	private double thLong;
	private String thLogoPath;
	
	public Theater() {}

	// APIController theaterAPI()에서 사용 	
	public Theater(String thNm, String thCode, String thPhone, String thPage, String thAddr, double thLat,
			double thLong) {
		super();
		this.thNm = thNm;
		this.thCode = thCode;
		this.thPhone = thPhone;
		this.thPage = thPage;
		this.thAddr = thAddr;
		this.thLat = thLat;
		this.thLong = thLong;
	}

	public Theater(String thCode, String thNm, String thPhone, String thPage, String thAddr, double thLat,
			double thLong, String thLogoPath) {
		super();
		this.thCode = thCode;
		this.thNm = thNm;
		this.thPhone = thPhone;
		this.thPage = thPage;
		this.thAddr = thAddr;
		this.thLat = thLat;
		this.thLong = thLong;
		this.thLogoPath = thLogoPath;
	}

	public String getThCode() {
		return thCode;
	}

	public void setThCode(String thCode) {
		this.thCode = thCode;
	}

	public String getThNm() {
		return thNm;
	}

	public void setThNm(String thNm) {
		this.thNm = thNm;
	}

	public String getThPhone() {
		return thPhone;
	}

	public void setThPhone(String thPhone) {
		this.thPhone = thPhone;
	}

	public String getThPage() {
		return thPage;
	}

	public void setThPage(String thPage) {
		this.thPage = thPage;
	}

	public String getThAddr() {
		return thAddr;
	}

	public void setThAddr(String thAddr) {
		this.thAddr = thAddr;
	}

	public double getThLat() {
		return thLat;
	}

	public void setThLat(double thLat) {
		this.thLat = thLat;
	}

	public double getThLong() {
		return thLong;
	}

	public void setThLong(double thLong) {
		this.thLong = thLong;
	}

	public String getThLogoPath() {
		return thLogoPath;
	}

	public void setThLogoPath(String thLogoPath) {
		this.thLogoPath = thLogoPath;
	}

	@Override
	public String toString() {
		return "Theater [thCode=" + thCode + ", thNm=" + thNm + ", thPhone=" + thPhone + ", thPage=" + thPage
				+ ", thAddr=" + thAddr + ", thLat=" + thLat + ", thLong=" + thLong + ", thLogoPath=" + thLogoPath + "]";
	}
	
}
