package com.bg.plzSeatdown.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private int reviewSight;
	private int reviewComfort;
	private int reviewLegroom;
	private String reviewComment;
	private Date reviewViewDate;
	private Date reviewCreateDate;
	private String seatCode;
	private String showCode;
	private int reviewWriter;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, int reviewSight, int reviewComfort, int reviewLegroom, String reviewComment,
			Date reviewViewDate, Date reviewCreateDate, String seatCode, String showCode, int reviewWriter) {
		super();
		this.reviewNo = reviewNo;
		this.reviewSight = reviewSight;
		this.reviewComfort = reviewComfort;
		this.reviewLegroom = reviewLegroom;
		this.reviewComment = reviewComment;
		this.reviewViewDate = reviewViewDate;
		this.reviewCreateDate = reviewCreateDate;
		this.seatCode = seatCode;
		this.showCode = showCode;
		this.reviewWriter = reviewWriter;
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

	public int getReviewLegroom() {
		return reviewLegroom;
	}

	public void setReviewLegroom(int reviewLegroom) {
		this.reviewLegroom = reviewLegroom;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public Date getReviewViewDate() {
		return reviewViewDate;
	}

	public void setReviewViewDate(Date reviewViewDate) {
		this.reviewViewDate = reviewViewDate;
	}

	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	public String getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}

	public String getShowCode() {
		return showCode;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

	public int getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewSight=" + reviewSight + ", reviewComfort=" + reviewComfort
				+ ", reviewLegroom=" + reviewLegroom + ", reviewComment=" + reviewComment + ", reviewViewDate="
				+ reviewViewDate + ", reviewCreateDate=" + reviewCreateDate + ", seatCode=" + seatCode + ", showCode="
				+ showCode + ", reviewWriter=" + reviewWriter + "]";
	}

	

	
}
