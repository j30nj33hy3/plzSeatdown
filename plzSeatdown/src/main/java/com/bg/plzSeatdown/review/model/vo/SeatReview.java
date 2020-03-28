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
	private String reviewImgPath;
	private int reviewWriter;
	private String memberNickname;
	private String memberId;
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
	private int likeCount;
	private int likeStatus; // 내가 해당 리뷰에 좋아요를 눌렀는지 확인 여부
	
	public SeatReview() {
		// TODO Auto-generated constructor stub
	}
	
	// 리뷰 전체 목록 출력하기 위해 파라미터로 사용됨 ( ReviewController의 selectAllReview)
	public SeatReview(int seatValue, int likeStatus) {
		super();
		this.seatValue = seatValue;
		this.likeStatus = likeStatus;
	}

	public SeatReview(int reviewNo, Date reviewCreateDt, Date reviewViewDt, int reviewSight, int reviewComfort,
			int reviewLegroom, double reviewRating, String reviewComment, String reviewImgPath, int reviewWriter,
			String memberNickname, String memberId, String profilePath, int seatCode, int seatValue, String seatFloor, String seatArea,
			String seatRow, String seatCol, String thCode, String thName, String showCode, String showTitle,
			int likeCount, int likeStatus) {
		super();
		this.reviewNo = reviewNo;
		this.reviewCreateDt = reviewCreateDt;
		this.reviewViewDt = reviewViewDt;
		this.reviewSight = reviewSight;
		this.reviewComfort = reviewComfort;
		this.reviewLegroom = reviewLegroom;
		this.reviewRating = reviewRating;
		this.reviewComment = reviewComment;
		this.reviewImgPath = reviewImgPath;
		this.reviewWriter = reviewWriter;
		this.memberNickname = memberNickname;
		this.memberId = memberId;
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
		this.likeCount = likeCount;
		this.likeStatus = likeStatus;
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

	public String getReviewImgPath() {
		return reviewImgPath;
	}

	public void setReviewImgPath(String reviewImgPath) {
		this.reviewImgPath = reviewImgPath;
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
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(int likeStatus) {
		this.likeStatus = likeStatus;
	}

	@Override
	public String toString() {
		return "SeatReview [reviewNo=" + reviewNo + ", reviewCreateDt=" + reviewCreateDt + ", reviewViewDt="
				+ reviewViewDt + ", reviewSight=" + reviewSight + ", reviewComfort=" + reviewComfort
				+ ", reviewLegroom=" + reviewLegroom + ", reviewRating=" + reviewRating + ", reviewComment="
				+ reviewComment + ", reviewImgPath=" + reviewImgPath + ", reviewWriter=" + reviewWriter
				+ ", memberNickname=" + memberNickname + ", memberId=" + memberId + ", profilePath=" + profilePath + ", seatCode=" + seatCode
				+ ", seatValue=" + seatValue + ", seatFloor=" + seatFloor + ", seatArea=" + seatArea + ", seatRow="
				+ seatRow + ", seatCol=" + seatCol + ", thCode=" + thCode + ", thName=" + thName + ", showCode="
				+ showCode + ", showTitle=" + showTitle + ", likeCount=" + likeCount + ", likeStatus=" + likeStatus
				+ "]";
	}

}
