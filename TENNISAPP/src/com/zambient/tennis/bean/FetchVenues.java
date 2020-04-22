package com.zambient.tennis.bean;

import java.io.Serializable;

public class FetchVenues implements Serializable{
	
	private int venueId;
	private String venueName;
	private String venueLocation;
	private int noOfCourts;
	private String contactMob;
	private String contactEmail;
	private String sportType;
	private int venuelight;
	
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
	
	public String getContactMob() {
		return contactMob;
	}
	public void setContactMob(String contactMob) {
		this.contactMob = contactMob;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getSportType() {
		return sportType;
	}
	public void setSportType(String sportType) {
		this.sportType = sportType;
	}
	public int getVenuelight() {
		return venuelight;
	}
	public void setVenuelight(int venuelight) {
		this.venuelight = venuelight;
	}

}
