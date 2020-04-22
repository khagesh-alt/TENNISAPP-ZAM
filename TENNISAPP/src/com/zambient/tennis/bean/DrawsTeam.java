package com.zambient.tennis.bean;

import java.io.Serializable;

public class DrawsTeam implements Serializable{
	private Long tournamentid;
	private Long categoryid;
	private String playerName1;
	private Long playerId1;
	private String playerName2;
	private Long playerId2;
	private Long round;
	private String status;
	private String matchtype;
	private String team1,team2;
	private boolean isByMatch;
	private String winner;
	private Long matchId;
	private String seeding1;
	private String seeding2;
	private Long aitaRank1;
	private Long aitaRank2;
	private Long winnerSeed;
	private Long winnerId;
	private String score;
	
	public Long getTournamentid() {
		return tournamentid;
	}
	public void setTournamentid(Long tournamentid) {
		this.tournamentid = tournamentid;
	}
	public Long getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(Long categoryid) {
		this.categoryid = categoryid;
	}
	public String getPlayerName1() {
		return playerName1;
	}
	public void setPlayerName1(String playerName1) {
		this.playerName1 = playerName1;
	}
	public Long getPlayerId1() {
		return playerId1;
	}
	public void setPlayerId1(Long playerId1) {
		this.playerId1 = playerId1;
	}
	public String getPlayerName2() {
		return playerName2;
	}
	public void setPlayerName2(String playerName2) {
		this.playerName2 = playerName2;
	}
	public Long getPlayerId2() {
		return playerId2;
	}
	public void setPlayerId2(Long playerId2) {
		this.playerId2 = playerId2;
	}
	public Long getRound() {
		return round;
	}
	public void setRound(Long round) {
		this.round = round;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMatchtype() {
		return matchtype;
	}
	public void setMatchtype(String matchtype) {
		this.matchtype = matchtype;
	}
	public String getTeam1() {
		return team1;
	}
	public void setTeam1(String team1) {
		this.team1 = team1;
	}
	public String getTeam2() {
		return team2;
	}
	public void setTeam2(String team2) {
		this.team2 = team2;
	}
	public boolean isByMatch() {
		return isByMatch;
	}
	public void setByMatch(boolean isByMatch) {
		this.isByMatch = isByMatch;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	public Long getMatchId() {
		return matchId;
	}
	public void setMatchId(Long matchId) {
		this.matchId = matchId;
	}
	public String getSeeding1() {
		return seeding1;
	}
	public void setSeeding1(String seeding1) {
		this.seeding1 = seeding1;
	}
	public String getSeeding2() {
		return seeding2;
	}
	public void setSeeding2(String seeding2) {
		this.seeding2 = seeding2;
	}
	public Long getAitaRank1() {
		return aitaRank1;
	}
	public void setAitaRank1(Long aitaRank1) {
		this.aitaRank1 = aitaRank1;
	}
	public Long getAitaRank2() {
		return aitaRank2;
	}
	public void setAitaRank2(Long aitaRank2) {
		this.aitaRank2 = aitaRank2;
	}
	public Long getWinnerSeed() {
		return winnerSeed;
	}
	public void setWinnerSeed(Long winnerSeed) {
		this.winnerSeed = winnerSeed;
	}
	public Long getWinnerId() {
		return winnerId;
	}
	public void setWinnerId(Long winnerId) {
		this.winnerId = winnerId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}

}
