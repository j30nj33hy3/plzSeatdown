package com.bg.plzSeatdown.api.model.vo;

public class Show {

	private String showCode;
	private String showTitle;
	private String startDt;
	private String endDt;
	private String posterPath;
	private String showStatus;
	private String showImg1;
	private String showImg2;
	private String showImg3;
	private String showImg4;
	private String thCode; 
	private String theaterFullNm;
	
	public Show() { }
	
	public Show(String showCode, String showTitle, String startDt, String endDt, String posterPath, String showStatus,
			String showImg1, String showImg2, String showImg3, String showImg4, String thCode, String theaterFullNm) {
		super();
		this.showCode = showCode;
		this.showTitle = showTitle;
		this.startDt = startDt;
		this.endDt = endDt;
		this.posterPath = posterPath;
		this.showStatus = showStatus;
		this.showImg1 = showImg1;
		this.showImg2 = showImg2;
		this.showImg3 = showImg3;
		this.showImg4 = showImg4;
		this.thCode = thCode;
		this.theaterFullNm = theaterFullNm;
	}

	public String getShowCode() {
		return showCode;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public String getStartDt() {
		return startDt;
	}

	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	public String getShowStatus() {
		return showStatus;
	}

	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
	}

	public String getShowImg1() {
		return showImg1;
	}

	public void setShowImg1(String showImg1) {
		this.showImg1 = showImg1;
	}

	public String getShowImg2() {
		return showImg2;
	}

	public void setShowImg2(String showImg2) {
		this.showImg2 = showImg2;
	}

	public String getShowImg3() {
		return showImg3;
	}

	public void setShowImg3(String showImg3) {
		this.showImg3 = showImg3;
	}

	public String getShowImg4() {
		return showImg4;
	}

	public void setShowImg4(String showImg4) {
		this.showImg4 = showImg4;
	}

	public String getThCode() {
		return thCode;
	}

	public void setThCode(String thCode) {
		this.thCode = thCode;
	}

	public String getTheaterFullNm() {
		return theaterFullNm;
	}

	public void setTheaterFullNm(String theaterFullNm) {
		this.theaterFullNm = theaterFullNm;
	}

	@Override
	public String toString() {
		return "Show [showCode=" + showCode + ", showTitle=" + showTitle + ", startDt=" + startDt + ", endDt=" + endDt
				+ ", posterPath=" + posterPath + ", showStatus=" + showStatus + ", showImg1=" + showImg1 + ", showImg2="
				+ showImg2 + ", showImg3=" + showImg3 + ", showImg4=" + showImg4 + ", thCode=" + thCode
				+ ", theaterFullNm=" + theaterFullNm + "]";
	}
	
}
