package com.bg.plzSeatdown.review.model.vo;

public class ReviewReport {
	
	private int reviewReportNo;
	private String reportContent;
	private int reviewNo;
	private int memberSuspector;
	private int memberReporter;
	private int reportCategory;
	
	public ReviewReport() {
		super();
	}

	public ReviewReport(int reviewReportNo, String reportContent, int reviewNo, int memberSuspector, int memberReporter,
			int reportCategory) {
		super();
		this.reviewReportNo = reviewReportNo;
		this.reportContent = reportContent;
		this.reviewNo = reviewNo;
		this.memberSuspector = memberSuspector;
		this.memberReporter = memberReporter;
		this.reportCategory = reportCategory;
	}

	public int getReviewReportNo() {
		return reviewReportNo;
	}

	public void setReviewReportNo(int reviewReportNo) {
		this.reviewReportNo = reviewReportNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getMemberSuspector() {
		return memberSuspector;
	}

	public void setMemberSuspector(int memberSuspector) {
		this.memberSuspector = memberSuspector;
	}

	public int getMemberReporter() {
		return memberReporter;
	}

	public void setMemberReporter(int memberReporter) {
		this.memberReporter = memberReporter;
	}

	public int getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(int reportCategory) {
		this.reportCategory = reportCategory;
	}

	@Override
	public String toString() {
		return "ReviewReport [reviewReportNo=" + reviewReportNo + ", reportContent=" + reportContent + ", reviewNo="
				+ reviewNo + ", memberSuspector=" + memberSuspector + ", memberReporter=" + memberReporter
				+ ", reportCategory=" + reportCategory + "]";
	}
	
}
