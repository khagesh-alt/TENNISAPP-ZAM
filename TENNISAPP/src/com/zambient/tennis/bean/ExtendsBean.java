package com.zambient.tennis.bean;

import java.io.Serializable;

public class ExtendsBean implements Serializable{
	
	private Long tournamentid;
	private Long organiserid;
	private String regStartDate;
	private String regEndDate;
	private String tournamentStartDate;
	private String tournamentEndDate;
	public Long getTournamentid() {
		return tournamentid;
	}
	public void setTournamentid(Long tournamentid) {
		this.tournamentid = tournamentid;
	}
	public Long getOrganiserid() {
		return organiserid;
	}
	public void setOrganiserid(Long organiserid) {
		this.organiserid = organiserid;
	}
	public String getRegStartDate() {
		return regStartDate;
	}
	public void setRegStartDate(String regStartDate) {
		this.regStartDate = regStartDate;
	}
	public String getRegEndDate() {
		return regEndDate;
	}
	public void setRegEndDate(String regEndDate) {
		this.regEndDate = regEndDate;
	}
	public String getTournamentStartDate() {
		return tournamentStartDate;
	}
	public void setTournamentStartDate(String tournamentStartDate) {
		this.tournamentStartDate = tournamentStartDate;
	}
	public String getTournamentEndDate() {
		return tournamentEndDate;
	}
	public void setTournamentEndDate(String tournamentEndDate) {
		this.tournamentEndDate = tournamentEndDate;
	}

}
