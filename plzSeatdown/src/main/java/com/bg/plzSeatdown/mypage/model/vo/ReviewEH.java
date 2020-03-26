package com.bg.plzSeatdown.mypage.model.vo;

import java.sql.Date;

public class ReviewEH {
	
	private int reviewNo;
	private int reviewSight;
	private int reviewComfort;
	private String reviewComment;
	private int reviewLegroom;
	private Date reviewCreateDate;
	private String seatFloor;
	private String seatArea;
	private String seatRow;
	private String seatCol;
	private String showTitle;
	private int reviewWriter;
	private String reviewImageStatus;
	
	public ReviewEH() {
	}

	public ReviewEH(int reviewNo, int reviewSight, int reviewComfort, String reviewComment, int reviewLegroom,
			Date reviewCreateDate, String seatFloor, String seatArea, String seatRow, String seatCol, String showTitle,
			int reviewWriter, String reviewImageStatus) {
		super();
		this.reviewNo = reviewNo;
		this.reviewSight = reviewSight;
		this.reviewComfort = reviewComfort;
		this.reviewComment = reviewComment;
		this.reviewLegroom = reviewLegroom;
		this.reviewCreateDate = reviewCreateDate;
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.showTitle = showTitle;
		this.reviewWriter = reviewWriter;
		this.reviewImageStatus = reviewImageStatus;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public int getReviewLegroom() {
		return reviewLegroom;
	}

	public void setReviewLegroom(int reviewLegroom) {
		this.reviewLegroom = reviewLegroom;
	}

	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
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

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public int getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewImageStatus() {
		return reviewImageStatus;
	}

	public void setReviewImageStatus(String reviewImageStatus) {
		this.reviewImageStatus = reviewImageStatus;
	}

	@Override
	public String toString() {
		return "ReviewEH [reviewNo=" + reviewNo + ", reviewSight=" + reviewSight + ", reviewComfort=" + reviewComfort
				+ ", reviewComment=" + reviewComment + ", reviewLegroom=" + reviewLegroom + ", reviewCreateDate="
				+ reviewCreateDate + ", seatFloor=" + seatFloor + ", seatArea=" + seatArea + ", seatRow=" + seatRow
				+ ", seatCol=" + seatCol + ", showTitle=" + showTitle + ", reviewWriter=" + reviewWriter
				+ ", reviewImageStatus=" + reviewImageStatus + "]";
	}

	
	
	
	
}
