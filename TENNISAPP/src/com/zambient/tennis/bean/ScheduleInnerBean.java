package com.zambient.tennis.bean;

import java.io.Serializable;

public class ScheduleInnerBean implements Serializable{
	private int matchId;
	private String matchType;
	private int matchRound;
	private String matchStatus;
	private String player1;
	private String player2;
	private String player3;
	private String player4;
	private String startTime;
	private String endTime;
	private String score;
	private String scheduleDate;
	private String court;
	private String loginPlayer;
	private String round;
	private boolean isbyMatch;
	private int winner;
	private int roundNo;
	private String categoryName;
	
	public int getMatchId() {
		return matchId;
	}
	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}
	public String getMatchType() {
		return matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}
	public int getMatchRound() {
		return matchRound;
	}
	public void setMatchRound(int matchRound) {
		this.matchRound = matchRound;
	}
	public String getMatchStatus() {
		return matchStatus;
	}
	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}
	public String getPlayer1() {
		return player1;
	}
	public void setPlayer1(String player1) {
		this.player1 = player1;
	}
	public String getPlayer2() {
		return player2;
	}
	public void setPlayer2(String player2) {
		this.player2 = player2;
	}
	public String getPlayer3() {
		return player3;
	}
	public void setPlayer3(String player3) {
		this.player3 = player3;
	}
	public String getPlayer4() {
		return player4;
	}
	public void setPlayer4(String player4) {
		this.player4 = player4;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getCourt() {
		return court;
	}
	public void setCourt(String court) {
		this.court = court;
	}
	public String getLoginPlayer() {
		return loginPlayer;
	}
	public void setLoginPlayer(String loginPlayer) {
		this.loginPlayer = loginPlayer;
	}
	public String getRound() {
		return round;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getWinner() {
		return winner;
	}
	public void setWinner(int winner) {
		this.winner = winner;
	}
	public boolean isIsbyMatch() {
		return isbyMatch;
	}
	public void setIsbyMatch(boolean isbyMatch) {
		this.isbyMatch = isbyMatch;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public int getRoundNo() {
		return roundNo;
	}
	public void setRoundNo(int roundNo) {
		this.roundNo = roundNo;
	}

}
