package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class TournamentCategoryBean implements Serializable{

	private int categoryId;
	private String categoryName;
	private int prizeMoney;
	private int tournamentFee;
	private int playerId;
	private String startDate;
	private String endDate;
	private List<PlayersBean> playerList;
	private String regStartDate;
	private String regEndDate;
	private Long matchType;
	private boolean drawsCreated;
	private boolean scheduleCreated;
	private boolean categoryGender;
	private boolean catAge;
	private boolean isDrawsActive;
	
	public Long getMatchType() {
		return matchType;
	}
	public void setMatchType(Long matchType) {
		this.matchType = matchType;
	}
	public int getTournamentFee() {
		return tournamentFee;
	}
	public void setTournamentFee(int tournamentFee) {
		this.tournamentFee = tournamentFee;
	}
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
	public int getPrizeMoney() {
		return prizeMoney;
	}
	public void setPrizeMoney(int prizeMoney) {
		this.prizeMoney = prizeMoney;
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
	public int getPlayerId() {
		return playerId;
	}
	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}
	public List<PlayersBean> getPlayerList() {
		return playerList;
	}
	public void setPlayerList(List<PlayersBean> playerList) {
		this.playerList = playerList;
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
	public boolean isDrawsCreated() {
		return drawsCreated;
	}
	public void setDrawsCreated(boolean drawsCreated) {
		this.drawsCreated = drawsCreated;
	}
	public boolean isScheduleCreated() {
		return scheduleCreated;
	}
	public void setScheduleCreated(boolean scheduleCreated) {
		this.scheduleCreated = scheduleCreated;
	}
	public boolean getCategoryGender() {
		return categoryGender;
	}
	public void setCategoryGender(boolean categoryGender) {
		this.categoryGender = categoryGender;
	}
	public boolean getCatAge() {
		return catAge;
	}
	public void setCatAge(boolean catAge) {
		this.catAge = catAge;
	}
	public boolean getIsDrawsActive() {
		return isDrawsActive;
	}
	public void setIsDrawsActive(boolean isDrawsActive) {
		this.isDrawsActive = isDrawsActive;
	}
}
