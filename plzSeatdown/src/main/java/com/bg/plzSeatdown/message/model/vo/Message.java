package com.bg.plzSeatdown.message.model.vo;

import java.sql.Date;

public class Message {

	private int messageNo;
	private int messageSenderNo;
	private int messageReceiverNo;
	private String messageContent;
	private Date messageDate;
	private String messageRead;
	private String senderNickname;
	private String receiverNickname;
	private String messageReceiveStatus;
	private String messageSendStatus;
	
	public Message() {		
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(int messageNo, int messageSenderNo, int messageReceiverNo, String messageContent, Date messageDate,
			String messageRead, String senderNickname, String receiverNickname, String messageReceiveStatus,
			String messageSendStatus) {
		super();
		this.messageNo = messageNo;
		this.messageSenderNo = messageSenderNo;
		this.messageReceiverNo = messageReceiverNo;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.messageRead = messageRead;
		this.senderNickname = senderNickname;
		this.receiverNickname = receiverNickname;
		this.messageReceiveStatus = messageReceiveStatus;
		this.messageSendStatus = messageSendStatus;
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

	public String getMessageReceiveStatus() {
		return messageReceiveStatus;
	}

	public void setMessageReceiveStatus(String messageReceiveStatus) {
		this.messageReceiveStatus = messageReceiveStatus;
	}

	public String getMessageSendStatus() {
		return messageSendStatus;
	}

	public void setMessageSendStatus(String messageSendStatus) {
		this.messageSendStatus = messageSendStatus;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageSenderNo=" + messageSenderNo + ", messageReceiverNo="
				+ messageReceiverNo + ", messageContent=" + messageContent + ", messageDate=" + messageDate
				+ ", messageRead=" + messageRead + ", senderNickname=" + senderNickname + ", receiverNickname="
				+ receiverNickname + ", messageReceiveStatus=" + messageReceiveStatus + ", messageSendStatus="
				+ messageSendStatus + "]";
	}
	
	
	
}
