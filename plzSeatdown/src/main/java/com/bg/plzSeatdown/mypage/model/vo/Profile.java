
package com.bg.plzSeatdown.mypage.model.vo;

import java.sql.Date;

public class Profile {
	
	private int profileNo;
	private String profilePath;
	private Date uploadDate;
	private String profileStatus;
	private int memberNo;
	
	public Profile() {
	}
	
	
	
	public Profile(String profilePath) {
		super();
		this.profilePath = profilePath;
	}



	public Profile(int profileNo, String profilePath) {
		super();
		this.profileNo = profileNo;
		this.profilePath = profilePath;
	}



	public Profile(int profileNo, String profilePath, Date uploadDate, String profileStatus, int memberNo) {
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
		return "Profile [profileNo=" + profileNo + ", profilePath=" + profilePath + ", uploadDate=" + uploadDate
				+ ", profileStatus=" + profileStatus + ", memberNo=" + memberNo + "]";
	}
	
	
 
	
}


