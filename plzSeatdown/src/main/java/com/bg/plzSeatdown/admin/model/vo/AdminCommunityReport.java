package com.bg.plzSeatdown.admin.model.vo;

public class AdminCommunityReport {
	
	private int commReportNo;
	private String commReportContent;
	private int commNo;
	private int memberSuspector;
	private int memberReporter;
	private int reportCategoryCode;
	private String reportCategoryName;
	private char reportStatus;
	private String suspectorId;
	private String reporterId;
	
	public AdminCommunityReport() {}

	public AdminCommunityReport(int commReportNo, String commReportContent, int commNo, int memberSuspector,
			int memberReporter, int reportCategoryCode, String reportCategoryName, char reportStatus,
			String suspectorId, String reporterId) {
		super();
		this.commReportNo = commReportNo;
		this.commReportContent = commReportContent;
		this.commNo = commNo;
		this.memberSuspector = memberSuspector;
		this.memberReporter = memberReporter;
		this.reportCategoryCode = reportCategoryCode;
		this.reportCategoryName = reportCategoryName;
		this.reportStatus = reportStatus;
		this.suspectorId = suspectorId;
		this.reporterId = reporterId;
	}

	public int getCommReportNo() {
		return commReportNo;
	}

	public void setCommReportNo(int commReportNo) {
		this.commReportNo = commReportNo;
	}

	public String getCommReportContent() {
		return commReportContent;
	}

	public void setCommReportContent(String commReportContent) {
		this.commReportContent = commReportContent;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
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

	public int getReportCategoryCode() {
		return reportCategoryCode;
	}

	public void setReportCategoryCode(int reportCategoryCode) {
		this.reportCategoryCode = reportCategoryCode;
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
		return "AdminCommunityReport [commReportNo=" + commReportNo + ", commReportContent=" + commReportContent
				+ ", commNo=" + commNo + ", memberSuspector=" + memberSuspector + ", memberReporter=" + memberReporter
				+ ", reportCategoryCode=" + reportCategoryCode + ", reportCategoryName=" + reportCategoryName
				+ ", reportStatus=" + reportStatus + ", suspectorId=" + suspectorId + ", reporterId=" + reporterId
				+ "]";
	}
	
	

}