package com.bg.plzSeatdown.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickname;
	private String memberEmail;
	private String memberEmailCheck;
	private String memberPhone;
	private Date memberEnrollDate;
	private int memberReportCount;
	private String memberStatus;
	private String memberGrade;
	private String profilePath;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	
	public Member(String memberId, String memberName, String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
	}
	public Member(int memberNo, String memberId, String memberPwd, String memberNickname) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberNickname = memberNickname;
	}
	public Member(int memberNo, String memberId, String memberName, String memberNickname, String profilePath) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.profilePath = profilePath;
	}

	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberEmail = memberEmail;
	}

	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String memberEmail,
			String memberPhone) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
	}

	public Member(int memberNo, String memberId, String memberName, String memberNickname, String memberEmail,
			String memberEmailCheck, String memberPhone, Date memberEnrollDate, int memberReportCount,
			String memberStatus, String memberGrade) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberEmail = memberEmail;
		this.memberEmailCheck = memberEmailCheck;
		this.memberPhone = memberPhone;
		this.memberEnrollDate = memberEnrollDate;
		this.memberReportCount = memberReportCount;
		this.memberStatus = memberStatus;
		this.memberGrade = memberGrade;
	}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String memberEmail, String memberEmailCheck, String memberPhone, Date memberEnrollDate,
			int memberReportCount, String memberStatus, String memberGrade) {
		this(memberNo, memberId, memberName, memberNickname, memberEmail, memberEmailCheck, memberPhone, memberEnrollDate, memberReportCount, memberStatus, memberGrade);
		this.memberPwd = memberPwd;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberEmailCheck() {
		return memberEmailCheck;
	}

	public void setMemberEmailCheck(String memberEmailCheck) {
		this.memberEmailCheck = memberEmailCheck;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	public int getMemberReportCount() {
		return memberReportCount;
	}

	public void setMemberReportCount(int memberReportCount) {
		this.memberReportCount = memberReportCount;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	
	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberNickname=" + memberNickname + ", memberEmail=" + memberEmail
				+ ", memberEmailCheck=" + memberEmailCheck + ", memberPhone=" + memberPhone + ", memberEnrollDate="
				+ memberEnrollDate + ", memberReportCount=" + memberReportCount + ", memberStatus=" + memberStatus
				+ ", memberGrade=" + memberGrade + ", profilePath=" + profilePath + "]";
	}

	

	
	
	
}
