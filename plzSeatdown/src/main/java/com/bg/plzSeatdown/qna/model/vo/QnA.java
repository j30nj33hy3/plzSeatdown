package com.bg.plzSeatdown.qna.model.vo;

import java.sql.Date;

public class QnA {
	private int qnaNo;
	private String qnaContent;
	private Date qnaCreateDate;
	private String qnaStatus;
	private int qnaWriter;
	
	public QnA() {}

	public QnA(int qnaNo, String qnaContent, Date qnaCreateDate, String qnaStatus, int qnaWriter) {
		super();
		this.qnaNo = qnaNo;
		this.qnaContent = qnaContent;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaStatus = qnaStatus;
		this.qnaWriter = qnaWriter;
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

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaContent=" + qnaContent + ", qnaCreateDate=" + qnaCreateDate
				+ ", qnaStatus=" + qnaStatus + ", qnaWriter=" + qnaWriter + "]";
	}
	
	
}
