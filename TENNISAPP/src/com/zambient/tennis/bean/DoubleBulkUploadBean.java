package com.zambient.tennis.bean;

import java.util.List;

public class DoubleBulkUploadBean {
private static final long serialVersionUID = 1L;
	
	private Long tournamentId;
	private Long categoryId;
	private Long matchType;
	private Double entryFee;
	private List<DoublePlayersDetailsBean> playerList;
	public Long getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(Long tournamentId) {
		this.tournamentId = tournamentId;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Long getMatchType() {
		return matchType;
	}
	public void setMatchType(Long matchType) {
		this.matchType = matchType;
	}
	public Double getEntryFee() {
		return entryFee;
	}
	public void setEntryFee(Double entryFee) {
		this.entryFee = entryFee;
	}
	public List<DoublePlayersDetailsBean> getPlayerList() {
		return playerList;
	}
	public void setPlayerList(List<DoublePlayersDetailsBean> playerList) {
		this.playerList = playerList;
	}
	@Override
	public String toString() {
		return "DoubleBulkUploadBean [tournamentId=" + tournamentId + ", categoryId=" + categoryId + ", matchType="
				+ matchType + ", entryFee=" + entryFee + ", playerList=" + playerList + "]";
	}
	
	
}
