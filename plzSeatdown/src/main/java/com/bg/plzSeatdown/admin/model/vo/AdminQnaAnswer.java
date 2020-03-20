package com.bg.plzSeatdown.admin.model.vo;

public class AdminQnaAnswer {
	private int qnaNo;
	private String qnaAnswer;
	public AdminQnaAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminQnaAnswer(int qnaNo, String qnaAnswer) {
		super();
		this.qnaNo = qnaNo;
		this.qnaAnswer = qnaAnswer;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	@Override
	public String toString() {
		return "AdminQnaAnswer [qnaNo=" + qnaNo + ", qnaAnswer=" + qnaAnswer + "]";
	}
	
	
}
