package com.bg.plzSeatdown.admin.model.vo;

import java.sql.Date;

public class AdminReview {

	private int reviewNo;
	private Date reviewCreateDate;
	private Date reviewViewDate;
	private int reviewSight;
	private int reviewcomfort;
	private int reviewLegroom;
	private String reviewComment;
	private String reviewStatus;
	private String memberNickname;
	private int reviewWriter;
	private int seatCode;
	
	public AdminReview() {}

	public AdminReview(int reviewNo, Date reviewCreateDate, Date reviewViewDate, int reviewSight, int reviewcomfort,
			int reviewLegroom, String reviewComment, String reviewStatus, String memberNickname, int reviewWriter, int seatCode) {
		super();
		this.reviewNo = reviewNo;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewViewDate = reviewViewDate;
		this.reviewSight = reviewSight;
		this.reviewcomfort = reviewcomfort;
		this.reviewLegroom = reviewLegroom;
		this.reviewComment = reviewComment;
		this.reviewStatus = reviewStatus;
		this.memberNickname = memberNickname;
		this.reviewWriter = reviewWriter;
		this.seatCode = seatCode;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	public Date getReviewViewDate() {
		return reviewViewDate;
	}

	public void setReviewViewDate(Date reviewViewDate) {
		this.reviewViewDate = reviewViewDate;
	}

	public int getReviewSight() {
		return reviewSight;
	}

	public void setReviewSight(int reviewSight) {
		this.reviewSight = reviewSight;
	}

	public int getReviewcomfort() {
		return reviewcomfort;
	}

	public void setReviewcomfort(int reviewcomfort) {
		this.reviewcomfort = reviewcomfort;
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

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	
	
	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public int getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public int getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}

	@Override
	public String toString() {
		return "AdminReview [reviewNo=" + reviewNo + ", reviewCreateDate=" + reviewCreateDate + ", reviewViewDate="
				+ reviewViewDate + ", reviewSight=" + reviewSight + ", reviewcomfort=" + reviewcomfort
				+ ", reviewLegroom=" + reviewLegroom + ", reviewComment=" + reviewComment + ", reviewStatus="
				+ reviewStatus + ", memberNickname=" + memberNickname + ", reviewWriter=" + reviewWriter + ", seatCode=" + seatCode + "]";
	}
	
	
}
