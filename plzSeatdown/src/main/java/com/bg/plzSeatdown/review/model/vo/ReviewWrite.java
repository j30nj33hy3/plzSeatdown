package com.bg.plzSeatdown.review.model.vo;

import java.sql.Date;

public class ReviewWrite {
	private String thNm;
	private String thCd;
	private String viewDt;
	private int seatVal;
	private String showTitle;
	private String showCode;
	private String seatFloor;
	private String seatArea;
	private String seatRow;
	private String seatCol;
	private int seatCode;
	
	public ReviewWrite() {
		// TODO Auto-generated constructor stub
	}

	public ReviewWrite(String thNm, String thCd, String viewDt, int seatVal, String showTitle, String showCode,
			String seatFloor, String seatArea, String seatRow, String seatCol, int seatCode) {
		super();
		this.thNm = thNm;
		this.thCd = thCd;
		this.viewDt = viewDt;
		this.seatVal = seatVal;
		this.showTitle = showTitle;
		this.showCode = showCode;
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.seatCode = seatCode;
	}

	public String getThNm() {
		return thNm;
	}

	public void setThNm(String thNm) {
		this.thNm = thNm;
	}

	public String getThCd() {
		return thCd;
	}

	public void setThCd(String thCd) {
		this.thCd = thCd;
	}

	public String getViewDt() {
		return viewDt;
	}

	public void setViewDt(String viewDt) {
		this.viewDt = viewDt;
	}

	public int getSeatVal() {
		return seatVal;
	}

	public void setSeatVal(int seatVal) {
		this.seatVal = seatVal;
	}

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public String getShowCode() {
		return showCode;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

	public String getSeatFloor() {
		return seatFloor;
	}

	public void setSeatFloor(String seatFloor) {
		this.seatFloor = seatFloor;
	}

	public String getSeatArea() {
		return seatArea;
	}

	public void setSeatArea(String seatArea) {
		this.seatArea = seatArea;
	}

	public String getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}

	public String getSeatCol() {
		return seatCol;
	}

	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}

	public int getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}

	@Override
	public String toString() {
		return "ReviewWrite [thNm=" + thNm + ", thCd=" + thCd + ", viewDt=" + viewDt + ", seatVal=" + seatVal
				+ ", showTitle=" + showTitle + ", showCode=" + showCode + ", seatFloor=" + seatFloor + ", seatArea="
				+ seatArea + ", seatRow=" + seatRow + ", seatCol=" + seatCol + ", seatCode=" + seatCode + "]";
	}
}
