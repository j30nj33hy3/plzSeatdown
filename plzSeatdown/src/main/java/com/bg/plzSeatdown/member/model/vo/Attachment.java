package com.bg.plzSeatdown.member.model.vo;

import java.sql.Date;

public class Attachment {
	private int profileNo;
	private String profilePath;
	private Date uploadDate;
	private String profileStatus;
	private int memberNo;
	
	public Attachment() {
	}
	
	public Attachment(String profilePath) {
		super();
		this.profilePath = profilePath;
	}

	public Attachment(int profileNo, String profilePath, Date uploadDate, String profileStatus, int memberNo) {
		super();
		this.profileNo = profileNo;
		this.profilePath = profilePath;
		this.uploadDate = uploadDate;
		this.profileStatus = profileStatus;
		this.memberNo = memberNo;
	}

	
	public int getProfileNo() {
		return profileNo;
	}

	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getProfileStatus() {
		return profileStatus;
	}

	public void setProfileStatus(String profileStatus) {
		this.profileStatus = profileStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Attachment [profileNo=" + profileNo + ", profilePath=" + profilePath + ", uploadDate=" + uploadDate
				+ ", profileStatus=" + profileStatus + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
}
