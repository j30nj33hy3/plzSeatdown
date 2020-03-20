package com.bg.plzSeatdown.mypage.model.vo;

import java.sql.Date;

public class ReviewImageEH {
	
	private int reviewImageNo;
	private String reviewImagePath;
	private Date uploadDate;
	private String reviewImageStatus;
	private String imageType;
	private int reviewNo;
	private String reviewWriter;
	
	public ReviewImageEH() {
		// TODO Auto-generated constructor stub
	}

	public ReviewImageEH(int reviewImageNo, String reviewImagePath, Date uploadDate, String reviewImageStatus,
			String imageType, int reviewNo, String reviewWriter) {
		super();
		this.reviewImageNo = reviewImageNo;
		this.reviewImagePath = reviewImagePath;
		this.uploadDate = uploadDate;
		this.reviewImageStatus = reviewImageStatus;
		this.imageType = imageType;
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
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

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	@Override
	public String toString() {
		return "ReviewImageEH [reviewImageNo=" + reviewImageNo + ", reviewImagePath=" + reviewImagePath
				+ ", uploadDate=" + uploadDate + ", reviewImageStatus=" + reviewImageStatus + ", imageType=" + imageType
				+ ", reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + "]";
	}

	
	

}
