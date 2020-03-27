package com.bg.plzSeatdown.alarm.model.vo;

import java.sql.Date;

public class Alarm {

	private int alarmNo;
	private String alarmContent;
	private String alarmUrl;
	private Date alarmDate;
	private String alarmType;
	private String alarmStatus;
	private int alarmMemberNo;
	
	public Alarm() {}

	public Alarm(int alarmNo, String alarmContent, String alarmUrl, Date alarmDate, String alarmType,
			String alarmStatus, int alarmMemberNo) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContent = alarmContent;
		this.alarmUrl = alarmUrl;
		this.alarmDate = alarmDate;
		this.alarmType = alarmType;
		this.alarmStatus = alarmStatus;
		this.alarmMemberNo = alarmMemberNo;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public String getAlarmUrl() {
		return alarmUrl;
	}

	public void setAlarmUrl(String alarmUrl) {
		this.alarmUrl = alarmUrl;
	}

	public Date getAlarmDate() {
		return alarmDate;
	}

	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}

	public String getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}

	public String getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}

	public int getAlarmMemberNo() {
		return alarmMemberNo;
	}

	public void setAlarmMemberNo(int alarmMemberNo) {
		this.alarmMemberNo = alarmMemberNo;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContent=" + alarmContent + ", alarmUrl=" + alarmUrl
				+ ", alarmDate=" + alarmDate + ", alarmType=" + alarmType + ", alarmStatus=" + alarmStatus
				+ ", alarmMemberNo=" + alarmMemberNo + "]";
	}
	
}
