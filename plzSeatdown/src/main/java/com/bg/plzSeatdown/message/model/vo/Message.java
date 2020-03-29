package com.bg.plzSeatdown.message.model.vo;

import java.sql.Date;

public class Message {

	private int messageNo;
	private int messageSenderNo;
	private int messageReceiverNo;
	private String messageContent;
	private Date messageDate;
	private String messageRead;
	private String messageStatus;
	private String senderNickname;
	private String receiverNickname;
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Message(int messageNo, int messageSenderNo, int messageReceiverNo, String messageContent, Date messageDate,
			String messageRead, String messageStatus, String senderNickname, String receiverNickname) {
		super();
		this.messageNo = messageNo;
		this.messageSenderNo = messageSenderNo;
		this.messageReceiverNo = messageReceiverNo;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.messageRead = messageRead;
		this.messageStatus = messageStatus;
		this.senderNickname = senderNickname;
		this.receiverNickname = receiverNickname;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getMessageSenderNo() {
		return messageSenderNo;
	}
	public void setMessageSenderNo(int messageSenderNo) {
		this.messageSenderNo = messageSenderNo;
	}
	public int getMessageReceiverNo() {
		return messageReceiverNo;
	}
	public void setMessageReceiverNo(int messageReceiverNo) {
		this.messageReceiverNo = messageReceiverNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageRead() {
		return messageRead;
	}
	public void setMessageRead(String messageRead) {
		this.messageRead = messageRead;
	}
	public String getMessageStatus() {
		return messageStatus;
	}
	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}
	public String getSenderNickname() {
		return senderNickname;
	}
	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}
	public String getReceiverNickname() {
		return receiverNickname;
	}
	public void setReceiverNickname(String receiverNickname) {
		this.receiverNickname = receiverNickname;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageSenderNo=" + messageSenderNo + ", messageReceiverNo="
				+ messageReceiverNo + ", messageContent=" + messageContent + ", messageDate=" + messageDate
				+ ", messageRead=" + messageRead + ", messageStatus=" + messageStatus + ", senderNickname="
				+ senderNickname + ", receiverNickname=" + receiverNickname + "]";
	}
	
}

