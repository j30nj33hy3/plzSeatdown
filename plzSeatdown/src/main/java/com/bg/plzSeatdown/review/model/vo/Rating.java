package com.bg.plzSeatdown.review.model.vo;

public class Rating {
	private String thCode;
	private int seatValue;
	private int rating;
	
	public Rating() {
		// TODO Auto-generated constructor stub
	}

	public Rating(String thCode, int seatValue, int rating) {
		super();
		this.thCode = thCode;
		this.seatValue = seatValue;
		this.rating = rating;
	}

	public String getThCode() {
		return thCode;
	}

	public void setThCode(String thCode) {
		this.thCode = thCode;
	}

	public int getSeatValue() {
		return seatValue;
	}

	public void setSeatValue(int seatValue) {
		this.seatValue = seatValue;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Rating [thCode=" + thCode + ", seatValue=" + seatValue + ", rating=" + rating + "]";
	}
	
	
}
