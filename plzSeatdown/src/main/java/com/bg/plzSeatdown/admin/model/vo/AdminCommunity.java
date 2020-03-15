package com.bg.plzSeatdown.admin.model.vo;

import java.sql.Date;

public class AdminCommunity {

	private int communityNo;
	private String communityTitle;
	private String communityContent;
	private Date communityCreateDate;
	private Date communityModifyDate;
	private int communityCount;
	private String communityStatus;
	private int communityWriter;
	private String memberNickname;
	private int categoryCode;
	private String categoryName;
	
	public AdminCommunity() {}

	public AdminCommunity(int communityNo, String communityTitle, String communityContent, Date communityCreateDate,
			Date communityModifyDate, int communityCount, String communityStatus, int communityWriter,
			int categoryCode) {
		super();
		this.communityNo = communityNo;
		this.communityTitle = communityTitle;
		this.communityContent = communityContent;
		this.communityCreateDate = communityCreateDate;
		this.communityModifyDate = communityModifyDate;
		this.communityCount = communityCount;
		this.communityStatus = communityStatus;
		this.communityWriter = communityWriter;
		this.categoryCode = categoryCode;
	}

	public AdminCommunity(int communityNo, String communityTitle, String communityContent, Date communityCreateDate,
			Date communityModifyDate, int communityCount, String communityStatus, int communityWriter,
			String memberNickname, int categoryCode, String categoryName) {
		super();
		this.communityNo = communityNo;
		this.communityTitle = communityTitle;
		this.communityContent = communityContent;
		this.communityCreateDate = communityCreateDate;
		this.communityModifyDate = communityModifyDate;
		this.communityCount = communityCount;
		this.communityStatus = communityStatus;
		this.communityWriter = communityWriter;
		this.memberNickname = memberNickname;
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public String getCommunityTitle() {
		return communityTitle;
	}

	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public Date getCommunityCreateDate() {
		return communityCreateDate;
	}

	public void setCommunityCreateDate(Date communityCreateDate) {
		this.communityCreateDate = communityCreateDate;
	}

	public Date getCommunityModifyDate() {
		return communityModifyDate;
	}

	public void setCommunityModifyDate(Date communityModifyDate) {
		this.communityModifyDate = communityModifyDate;
	}

	public int getCommunityCount() {
		return communityCount;
	}

	public void setCommunityCount(int communityCount) {
		this.communityCount = communityCount;
	}

	public String getCommunityStatus() {
		return communityStatus;
	}

	public void setCommunityStatus(String communityStatus) {
		this.communityStatus = communityStatus;
	}

	public int getCommunityWriter() {
		return communityWriter;
	}

	public void setCommunityWriter(int communityWriter) {
		this.communityWriter = communityWriter;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Community [communityNo=" + communityNo + ", communityTitle=" + communityTitle + ", communityContent="
				+ communityContent + ", communityCreateDate=" + communityCreateDate + ", communityModifyDate="
				+ communityModifyDate + ", communityCount=" + communityCount + ", communityStatus=" + communityStatus
				+ ", communityWriter=" + communityWriter + ", memberNickname=" + memberNickname + ", categoryCode="
				+ categoryCode + ", categoryName=" + categoryName + "]";
	}
	
	
	
}
