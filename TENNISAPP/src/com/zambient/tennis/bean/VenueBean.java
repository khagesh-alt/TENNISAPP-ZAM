package com.zambient.tennis.bean;

import java.io.Serializable;

public class VenueBean implements Serializable{
	
	private String venue_name;
	private String venue_location;
	private Integer no_of_courts;
	private String contact_mob;
	private String contact_email;
	private String sport_type;
	private int venue_light;
	
	public String getVenue_name() {
		return venue_name;
	}
	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}
	public String getVenue_location() {
		return venue_location;
	}
	public void setVenue_location(String venue_location) {
		this.venue_location = venue_location;
	}
	public Integer getNo_of_courts() {
		return no_of_courts;
	}
	public void setNo_of_courts(Integer no_of_courts) {
		this.no_of_courts = no_of_courts;
	}
	public String getContact_mob() {
		return contact_mob;
	}
	public void setContact_mob(String contact_mob) {
		this.contact_mob = contact_mob;
	}
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	public String getSport_type() {
		return sport_type;
	}
	public void setSport_type(String sport_type) {
		this.sport_type = sport_type;
	}
	public int getVenue_light() {
		return venue_light;
	}
	public void setVenue_light(int venue_light) {
		this.venue_light = venue_light;
	}
}
