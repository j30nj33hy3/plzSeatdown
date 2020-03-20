package com.bg.plzSeatdown.admin.model.vo;

import java.sql.Date;

public class AdminQna{
	private int qnaNo;
	private String qnaContent;
	private Date qnaCreateDate;
	private String qnaStatus;
	private int qnaWriter;
	private String qnaAnswer;
	private String memberId;
	private String memberName;
	private String memberNickname;
	public AdminQna() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AdminQna(int qnaNo, String qnaContent, Date qnaCreateDate, String qnaStatus, int qnaWriter, String qnaAnswer,
			String memberId, String memberName, String memberNickname) {
		super();
		this.qnaNo = qnaNo;
		this.qnaContent = qnaContent;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaStatus = qnaStatus;
		this.qnaWriter = qnaWriter;
		this.qnaAnswer = qnaAnswer;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}
	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public int getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	@Override
	public String toString() {
		return "QnAEH [qnaNo=" + qnaNo + ", qnaContent=" + qnaContent + ", qnaCreateDate=" + qnaCreateDate
				+ ", qnaStatus=" + qnaStatus + ", qnaWriter=" + qnaWriter + ", qnaAnswer=" + qnaAnswer + ", memberId="
				+ memberId + ", memberName=" + memberName + ", memberNickname=" + memberNickname + "]";
	}
	
}