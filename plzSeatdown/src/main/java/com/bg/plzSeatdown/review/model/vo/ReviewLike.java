package com.bg.plzSeatdown.review.model.vo;

public class ReviewLike {

	private int memberNo;
	private int reviewNo;
	
	public ReviewLike() {
		super();
	}

	public ReviewLike(int memberNo, int reviewNo) {
		super();
		this.memberNo = memberNo;
		this.reviewNo = reviewNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewLike [memberNo=" + memberNo + ", reviewNo=" + reviewNo + "]";
	}
	
}
