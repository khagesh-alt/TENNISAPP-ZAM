package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class VenueAndCourtBean implements Serializable{
	
	private int venueId;
	private String venueName;
	private String venueLocation;
	private int noOfCourts;
	private List<CourtBean> courts;
	private String mobile;
	private int light;
	private String email;
	
	public int getVenueId() {
		return venueId;
	}
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public String getVenueLocation() {
		return venueLocation;
	}
	public void setVenueLocation(String venueLocation) {
		this.venueLocation = venueLocation;
	}
	public int getNoOfCourts() {
		return noOfCourts;
	}
	public void setNoOfCourts(int noOfCourts) {
		this.noOfCourts = noOfCourts;
	}
	public List<CourtBean> getCourts() {
		return courts;
	}
	public void setCourts(List<CourtBean> courts) {
		this.courts = courts;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getLight() {
		return light;
	}
	public void setLight(int light) {
		this.light = light;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
	

}
