package com.bg.plzSeatdown.admin.model.vo;

public class AdminReviewReport {
	private int reviewReportNo;
	private String reviewReportContent;
	private int reviewNo;
	private int memberSuspector;
	private int memberReporter;
	private String reportCategoryName;
	private char reportStatus;
	private String suspectorId;
	private String reporterId;
	
	public AdminReviewReport() {}

	public AdminReviewReport(int reviewReportNo, String reviewReportContent, int reviewNo, int memberSuspector,
			int memberReporter, String reportCategoryName, char reportStatus, String suspectorId, String reporterId) {
		super();
		this.reviewReportNo = reviewReportNo;
		this.reviewReportContent = reviewReportContent;
		this.reviewNo = reviewNo;
		this.memberSuspector = memberSuspector;
		this.memberReporter = memberReporter;
		this.reportCategoryName = reportCategoryName;
		this.reportStatus = reportStatus;
		this.suspectorId = suspectorId;
		this.reporterId = reporterId;
	}

	public int getReviewReportNo() {
		return reviewReportNo;
	}

	public void setReviewReportNo(int reviewReportNo) {
		this.reviewReportNo = reviewReportNo;
	}

	public String getReviewReportContent() {
		return reviewReportContent;
	}

	public void setReviewReportContent(String reviewReportContent) {
		this.reviewReportContent = reviewReportContent;
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

	public String getReportCategoryName() {
		return reportCategoryName;
	}

	public void setReportCategoryName(String reportCategoryName) {
		this.reportCategoryName = reportCategoryName;
	}

	public char getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(char reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getSuspectorId() {
		return suspectorId;
	}

	public void setSuspectorId(String suspectorId) {
		this.suspectorId = suspectorId;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	@Override
	public String toString() {
		return "AdminReviewReport [reviewReportNo=" + reviewReportNo + ", reviewReportContent=" + reviewReportContent
				+ ", reviewNo=" + reviewNo + ", memberSuspector=" + memberSuspector + ", memberReporter="
				+ memberReporter + ", reportCategoryName=" + reportCategoryName + ", reportStatus=" + reportStatus
				+ ", suspectorId=" + suspectorId + ", reporterId=" + reporterId + "]";
	}

}
