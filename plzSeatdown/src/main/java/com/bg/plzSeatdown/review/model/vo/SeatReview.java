package com.bg.plzSeatdown.review.model.vo;

import java.sql.Date;

public class SeatReview {
	private int reviewNo;
	private Date reviewCreateDt;
	private Date reviewViewDt;
	private int reviewSight;
	private int reviewComfort;
	private int reviewLegroom;
	private double reviewRating;
	private String reviewComment;
	private int reviewWriter;
	private String memberNickname;
	private String profilePath;
	private int seatCode;
	private int seatValue;
	private String seatFloor;
	private String seatArea;
	private String seatRow;
	private String seatCol;
	private String thCode;
	private String thName;
	private String showCode;
	private String showTitle;
	
	public SeatReview() {
		// TODO Auto-generated constructor stub
	}

	public SeatReview(int reviewNo, Date reviewCreateDt, Date reviewViewDt, int reviewSight, int reviewComfort,
			int reviewLegroom, double reviewRating, String reviewComment, int reviewWriter, String memberNickname,
			String profilePath, int seatCode, int seatValue, String seatFloor, String seatArea, String seatRow,
			String seatCol, String thCode, String thName, String showCode, String showTitle) {
		super();
		this.reviewNo = reviewNo;
		this.reviewCreateDt = reviewCreateDt;
		this.reviewViewDt = reviewViewDt;
		this.reviewSight = reviewSight;
		this.reviewComfort = reviewComfort;
		this.reviewLegroom = reviewLegroom;
		this.reviewRating = reviewRating;
		this.reviewComment = reviewComment;
		this.reviewWriter = reviewWriter;
		this.memberNickname = memberNickname;
		this.profilePath = profilePath;
		this.seatCode = seatCode;
		this.seatValue = seatValue;
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.thCode = thCode;
		this.thName = thName;
		this.showCode = showCode;
		this.showTitle = showTitle;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Date getReviewCreateDt() {
		return reviewCreateDt;
	}

	public void setReviewCreateDt(Date reviewCreateDt) {
		this.reviewCreateDt = reviewCreateDt;
	}

	public Date getReviewViewDt() {
		return reviewViewDt;
	}

	public void setReviewViewDt(Date reviewViewDt) {
		this.reviewViewDt = reviewViewDt;
	}

	public int getReviewSight() {
		return reviewSight;
	}

	public void setReviewSight(int reviewSight) {
		this.reviewSight = reviewSight;
	}

	public int getReviewComfort() {
		return reviewComfort;
	}

	public void setReviewComfort(int reviewComfort) {
		this.reviewComfort = reviewComfort;
	}

	public int getReviewLegroom() {
		return reviewLegroom;
	}

	public void setReviewLegroom(int reviewLegroom) {
		this.reviewLegroom = reviewLegroom;
	}

	public double getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(double reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public int getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public int getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}

	public int getSeatValue() {
		return seatValue;
	}

	public void setSeatValue(int seatValue) {
		this.seatValue = seatValue;
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

	public String getThCode() {
		return thCode;
	}

	public void setThCode(String thCode) {
		this.thCode = thCode;
	}

	public String getThName() {
		return thName;
	}

	public void setThName(String thName) {
		this.thName = thName;
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

	@Override
	public String toString() {
		return "SeatReview [reviewNo=" + reviewNo + ", reviewCreateDt=" + reviewCreateDt + ", reviewViewDt="
				+ reviewViewDt + ", reviewSight=" + reviewSight + ", reviewComfort=" + reviewComfort
				+ ", reviewLegroom=" + reviewLegroom + ", reviewRating=" + reviewRating + ", reviewComment="
				+ reviewComment + ", reviewWriter=" + reviewWriter + ", memberNickname=" + memberNickname
				+ ", profilePath=" + profilePath + ", seatCode=" + seatCode + ", seatValue=" + seatValue
				+ ", seatFloor=" + seatFloor + ", seatArea=" + seatArea + ", seatRow=" + seatRow + ", seatCol="
				+ seatCol + ", thCode=" + thCode + ", thName=" + thName + ", showCode=" + showCode + ", showTitle="
				+ showTitle + "]";
	}

	
	
}