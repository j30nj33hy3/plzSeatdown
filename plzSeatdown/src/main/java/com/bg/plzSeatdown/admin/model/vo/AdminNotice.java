package com.bg.plzSeatdown.admin.model.vo;

import java.sql.Date;

public class AdminNotice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeWriter;
	private int noticeCount;
	private Date noticeCreateDate;
	private Date noticeModifyDate;
	private String noticeStatus;

	public AdminNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminNotice(int noticeNo, String noticeTitle, String noticeContent, int noticeWriter, int noticeCount,
			Date noticeCreateDate, Date noticeModifyDate, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeCount = noticeCount;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeModifyDate = noticeModifyDate;
		this.noticeStatus = noticeStatus;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public Date getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(Date noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public Date getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(Date noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "AdminNotice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeCount=" + noticeCount + ", noticeCreateDate="
				+ noticeCreateDate + ", noticeModifyDate=" + noticeModifyDate + ", noticeStatus=" + noticeStatus + "]";
	}
		
	
}
