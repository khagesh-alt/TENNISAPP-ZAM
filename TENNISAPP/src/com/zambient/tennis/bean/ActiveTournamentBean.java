package com.zambient.tennis.bean;

import java.io.Serializable;

public class ActiveTournamentBean implements Serializable{
	
	private Long tournamentid;
	private String title;
	private String status;
	private boolean active;
	private String orgName;
	
	public Long getTournamentid() {
		return tournamentid;
	}
	public void setTournamentid(Long tournamentid) {
		this.tournamentid = tournamentid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

}
