package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class MatchTournamentCategoryBean implements Serializable{
	
	private int categoryId;
	private String categoryName;
	private String startDate;
	private String endDate;
	private Double tournamentFee;
	private Double prizeMoney;
	private int checkSchedule;
	
	private List<MatchRoundBean> matchRoundBean;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
	public List<MatchRoundBean> getMatchRoundBean() {
		return matchRoundBean;
	}
	public void setMatchRoundBean(List<MatchRoundBean> matchRoundBean) {
		this.matchRoundBean = matchRoundBean;
	}
	public Double getTournamentFee() {
		return tournamentFee;
	}
	public void setTournamentFee(Double tournamentFee) {
		this.tournamentFee = tournamentFee;
	}
	public Double getPrizeMoney() {
		return prizeMoney;
	}
	public void setPrizeMoney(Double prizeMoney) {
		this.prizeMoney = prizeMoney;
	}
	public int getCheckSchedule() {
		return checkSchedule;
	}
	public void setCheckSchedule(int checkSchedule) {
		this.checkSchedule = checkSchedule;
	}

}
