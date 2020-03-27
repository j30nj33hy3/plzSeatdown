package com.bg.plzSeatdown.review.model.vo;

import java.sql.Date;

public class ReviewImage {
	
	private int reviewImageNo;
	private String reviewImagePath;
	private Date uploadDate;
	private String reviewImageStatus;
	private int imageType;
	private int reviewNo;
	
	public ReviewImage() {
		// TODO Auto-generated constructor stub
	}

	public ReviewImage(String reviewImagePath) {
		super();
		this.reviewImagePath = reviewImagePath;
	}
	
	public ReviewImage(int reviewImageNo, String reviewImagePath) {
		super();
		this.reviewImageNo = reviewImageNo;
		this.reviewImagePath = reviewImagePath;
	}

	public ReviewImage(int reviewImageNo, String reviewImagePath, Date uploadDate, String reviewImageStatus,
			int imageType, int reviewNo) {
		super();
		this.reviewImageNo = reviewImageNo;
		this.reviewImagePath = reviewImagePath;
		this.uploadDate = uploadDate;
		this.reviewImageStatus = reviewImageStatus;
		this.imageType = imageType;
		this.reviewNo = reviewNo;
	}

	public int getReviewImageNo() {
		return reviewImageNo;
	}

	public void setReviewImageNo(int reviewImageNo) {
		this.reviewImageNo = reviewImageNo;
	}

	public String getReviewImagePath() {
		return reviewImagePath;
	}

	public void setReviewImagePath(String reviewImagePath) {
		this.reviewImagePath = reviewImagePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getReviewImageStatus() {
		return reviewImageStatus;
	}

	public void setReviewImageStatus(String reviewImageStatus) {
		this.reviewImageStatus = reviewImageStatus;
	}

	public int getImageType() {
		return imageType;
	}

	public void setImageType(int imageType) {
		this.imageType = imageType;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewImage [reviewImageNo=" + reviewImageNo + ", reviewImagePath=" + reviewImagePath + ", uploadDate="
				+ uploadDate + ", reviewImageStatus=" + reviewImageStatus + ", imageType=" + imageType + ", reviewNo="
				+ reviewNo + "]";
	}
	
	
	

}
