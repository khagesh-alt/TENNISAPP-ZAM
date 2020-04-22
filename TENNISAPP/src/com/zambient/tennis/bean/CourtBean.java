package com.zambient.tennis.bean;

import java.io.Serializable;

public class CourtBean implements Serializable{

	private int courtId;
	private String courtName;
	public int getCourtId() {
		return courtId;
	}
	public void setCourtId(int courtId) {
		this.courtId = courtId;
	}
	public String getCourtName() {
		return courtName;
	}
	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}
}
