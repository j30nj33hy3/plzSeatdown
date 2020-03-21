package com.bg.plzSeatdown.community.model.vo;

import java.sql.Timestamp;

public class Reply {

	private int replyNo;
	private String replyContent;
	private String replyStatus;
	private Timestamp replyModifyDate;
	private String replySecret;
	private int depth;
	private int parentNo;
	private int communityNo;
	private int replyWriter;
	private int replyGroup;
	private int communityWriter;
	private String memberNickname;
	private String profilePath;
	private int memberReporter;
	private String replyReportContent;
	private int reportCategory;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, String replyStatus, Timestamp replyModifyDate, String replySecret,
			int depth, int parentNo, int communityNo, int replyWriter, int replyGroup, int communityWriter,
			String memberNickname, String profilePath) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyStatus = replyStatus;
		this.replyModifyDate = replyModifyDate;
		this.replySecret = replySecret;
		this.depth = depth;
		this.parentNo = parentNo;
		this.communityNo = communityNo;
		this.replyWriter = replyWriter;
		this.replyGroup = replyGroup;
		this.communityWriter = communityWriter;
		this.memberNickname = memberNickname;
		this.profilePath = profilePath;
	}

	public Reply(int replyNo, String replyContent, String replyStatus, Timestamp replyModifyDate, String replySecret,
			int depth, int parentNo, int communityNo, int replyWriter, int replyGroup, int communityWriter,
			String memberNickname, String profilePath, int memberReporter, String replyReportContent,
			int reportCategory) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyStatus = replyStatus;
		this.replyModifyDate = replyModifyDate;
		this.replySecret = replySecret;
		this.depth = depth;
		this.parentNo = parentNo;
		this.communityNo = communityNo;
		this.replyWriter = replyWriter;
		this.replyGroup = replyGroup;
		this.communityWriter = communityWriter;
		this.memberNickname = memberNickname;
		this.profilePath = profilePath;
		this.memberReporter = memberReporter;
		this.replyReportContent = replyReportContent;
		this.reportCategory = reportCategory;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public Timestamp getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Timestamp replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplySecret() {
		return replySecret;
	}

	public void setReplySecret(String replySecret) {
		this.replySecret = replySecret;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public int getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public int getCommunityWriter() {
		return communityWriter;
	}

	public void setCommunityWriter(int communityWriter) {
		this.communityWriter = communityWriter;
	}

	public int getReplyGroup() {
		return replyGroup;
	}

	public void setReplyGroup(int replyGroup) {
		this.replyGroup = replyGroup;
	}

	
	public int getMemberReporter() {
		return memberReporter;
	}

	public void setMemberReporter(int memberReporter) {
		this.memberReporter = memberReporter;
	}

	public String getReplyReportContent() {
		return replyReportContent;
	}

	public void setReplyReportContent(String replyReportContent) {
		this.replyReportContent = replyReportContent;
	}

	public int getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(int reportCategory) {
		this.reportCategory = reportCategory;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyStatus=" + replyStatus
				+ ", replyModifyDate=" + replyModifyDate + ", replySecret=" + replySecret + ", depth=" + depth
				+ ", parentNo=" + parentNo + ", communityNo=" + communityNo + ", replyWriter=" + replyWriter
				+ ", replyGroup=" + replyGroup + ", communityWriter=" + communityWriter + ", memberNickname="
				+ memberNickname + ", profilePath=" + profilePath + ", memberReporter=" + memberReporter
				+ ", replyReportContent=" + replyReportContent + ", reportCategory=" + reportCategory + "]";
	}
	
}
