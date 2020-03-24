package com.bg.plzSeatdown.seat.model.vo;

public class Seat {
	private int seatCode;
	private int seatValue;
	private String seatFloor;
	private String seatArea;
	private String seatRow;
	private String seatCol;
	private String theaterCode;
	
	public Seat() {
		// TODO Auto-generated constructor stub
	}

	public Seat(String seatFloor, String theaterCode) {
		super();
		this.seatFloor = seatFloor;
		this.theaterCode = theaterCode;
	}
	
	public Seat(String seatFloor, String seatArea, String theaterCode) {
		super();
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.theaterCode = theaterCode;
	}

	public Seat(int seatValue, String seatFloor, String seatRow, String theaterCode) {
		super();
		this.seatValue = seatValue;
		this.seatFloor = seatFloor;
		this.seatRow = seatRow;
		this.theaterCode = theaterCode;
	}

	public Seat(String seatFloor, String seatArea, String seatRow, String theaterCode) {
		super();
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.seatRow = seatRow;
		this.theaterCode = theaterCode;
	}

	public Seat(int seatValue, String seatFloor, String seatRow, String seatCol, String theaterCode) {
		super();
		this.seatValue = seatValue;
		this.seatFloor = seatFloor;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.theaterCode = theaterCode;
	}

	public Seat(String seatFloor, String seatArea, String seatRow, String seatCol, String theaterCode) {
		super();
		this.seatFloor = seatFloor;
		this.seatArea = seatArea;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.theaterCode = theaterCode;
	}

	public Seat(int seatValue, String seatFloor, String seatArea, String seatRow, String seatCol, String theaterCode) {
		this(seatValue, seatFloor, seatRow, seatCol, theaterCode);
		this.seatArea = seatArea;

	}

	public Seat(int seatCode, int seatValue, String seatFloor, String seatArea, String seatRow, String seatCol,
			String theaterCode) {
		this(seatValue, seatFloor, seatArea, seatRow, seatCol, theaterCode);
		this.seatCode = seatCode;
	}

	public int getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}

	public int getSeatValue() {
		return seatValue;
	}

	public void setSeatValue(int seatValue) {
		this.seatValue = seatValue;
	}

	public String getSeatFloor() {
		return seatFloor;
	}

	public void setSeatFloor(String seatFloor) {
		this.seatFloor = seatFloor;
	}

	public String getSeatArea() {
		return seatArea;
	}

	public void setSeatArea(String seatArea) {
		this.seatArea = seatArea;
	}

	public String getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}

	public String getSeatCol() {
		return seatCol;
	}

	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}

	public String getTheaterCode() {
		return theaterCode;
	}

	public void setTheaterCode(String theaterCode) {
		this.theaterCode = theaterCode;
	}

	@Override
	public String toString() {
		return "Seat [seatCode=" + seatCode + ", seatValue=" + seatValue + ", seatFloor=" + seatFloor + ", seatArea="
				+ seatArea + ", seatRow=" + seatRow + ", seatCol=" + seatCol + ", theaterCode=" + theaterCode + "]";
	}
	
}
