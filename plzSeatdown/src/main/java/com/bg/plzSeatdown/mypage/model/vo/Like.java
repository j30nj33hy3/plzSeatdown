package com.bg.plzSeatdown.mypage.model.vo;

public class Like {

	public int memberNo;
	public int reviewNo;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int memberNo, int reviewNo) {
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
		return "Like [memberNo=" + memberNo + ", reviewNo=" + reviewNo + "]";
	}
	
	
	
}
