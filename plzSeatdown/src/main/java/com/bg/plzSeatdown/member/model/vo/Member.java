package com.bg.plzSeatdown.member.model.vo;

import java.util.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberNM;
	private String memberNickNM;
	private String memberEmail;
	private String memberEmailCheck;
	private String memberPhone;
	private Date memberEnrollDT;
	private int memberReportCount;
	private String memberStatus;
	private String memberGrade;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	
	public Member(int memberNo, String memberId, String memberNM, String memberNickNM, String memberEmail,
			String memberEmailCheck, String memberPhone, Date memberEnrollDT, int memberReportCount,
			String memberStatus, String memberGrade) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberNM = memberNM;
		this.memberNickNM = memberNickNM;
		this.memberEmail = memberEmail;
		this.memberEmailCheck = memberEmailCheck;
		this.memberPhone = memberPhone;
		this.memberEnrollDT = memberEnrollDT;
		this.memberReportCount = memberReportCount;
		this.memberStatus = memberStatus;
		this.memberGrade = memberGrade;
	}

	public Member(int memberNo, String memberId, String memberPwd, String memberNM, String memberNickNM,
			String memberEmail, String memberEmailCheck, String memberPhone, Date memberEnrollDT, int memberReportCount,
			String memberStatus, String memberGrade) {
		this(memberNo, memberId, memberNM, memberNickNM, memberEmail, memberEmailCheck, memberPhone, memberEnrollDT, memberReportCount, memberStatus, memberGrade);
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

	public String getMemberNM() {
		return memberNM;
	}

	public void setMemberNM(String memberNM) {
		this.memberNM = memberNM;
	}

	public String getMemberNickNM() {
		return memberNickNM;
	}

	public void setMemberNickNM(String memberNickNM) {
		this.memberNickNM = memberNickNM;
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

	public Date getMemberEnrollDT() {
		return memberEnrollDT;
	}

	public void setMemberEnrollDT(Date memberEnrollDT) {
		this.memberEnrollDT = memberEnrollDT;
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

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberNM="
				+ memberNM + ", memberNickNM=" + memberNickNM + ", memberEmail=" + memberEmail + ", memberEmailCheck="
				+ memberEmailCheck + ", memberPhone=" + memberPhone + ", memberEnrollDT=" + memberEnrollDT
				+ ", memberReportCount=" + memberReportCount + ", memberStatus=" + memberStatus + ", memberGrade="
				+ memberGrade + "]";
	}
	
}
