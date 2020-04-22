package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BuildSchedule implements Serializable{
	
	private int tournamentId;
	private int categoryId;
	private List<CourtBean> court;
	private List<DateBean> days;
	private List<MatchBean> matchs;
	public int getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(int tournamentId) {
		this.tournamentId = tournamentId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public List<CourtBean> getCourt() {
		return court;
	}
	public void setCourt(List<CourtBean> court) {
		this.court = court;
	}
	public List<DateBean> getDays() {
		return days;
	}
	public void setDays(List<DateBean> days) {
		this.days = days;
	}
	public List<MatchBean> getMatchs() {
		return matchs;
	}
	public void setMatchs(List<MatchBean> matchs) {
		this.matchs = matchs;
	}
}
