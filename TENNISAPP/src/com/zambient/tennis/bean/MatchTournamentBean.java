package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class MatchTournamentBean implements Serializable{
	private int tournamentId;
	private String title;
	private int orgaizerId;
	private String venueName;
	private String location;
	private String organizerName;
	private List<MatchTournamentCategoryBean> matchTournamentCategoryBean;
	private String startDate;
	private String endDate;
	private int countdate;
	
	
	public int getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(int tournamentId) {
		this.tournamentId = tournamentId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOrgaizerId() {
		return orgaizerId;
	}
	public void setOrgaizerId(int orgaizerId) {
		this.orgaizerId = orgaizerId;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOrganizerName() {
		return organizerName;
	}
	public void setOrganizerName(String organizerName) {
		this.organizerName = organizerName;
	}
	public List<MatchTournamentCategoryBean> getMatchTournamentCategoryBean() {
		return matchTournamentCategoryBean;
	}
	public void setMatchTournamentCategoryBean(List<MatchTournamentCategoryBean> matchTournamentCategoryBean) {
		this.matchTournamentCategoryBean = matchTournamentCategoryBean;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getCountdate() {
		return countdate;
	}
	public void setCountdate(int countdate) {
		this.countdate = countdate;
	}
}
