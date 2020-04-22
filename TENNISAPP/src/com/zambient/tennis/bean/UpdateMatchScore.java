package com.zambient.tennis.bean;

import java.io.Serializable;

public class UpdateMatchScore implements Serializable{
	
	private int matchid;
	private int tournamentid;
	private int categoryid;
	private String score;
	private String statues;
	private String winner;
	public int getMatchid() {
		return matchid;
	}
	public void setMatchid(int matchid) {
		this.matchid = matchid;
	}
	public int getTournamentid() {
		return tournamentid;
	}
	public void setTournamentid(int tournamentid) {
		this.tournamentid = tournamentid;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getStatues() {
		return statues;
	}
	public void setStatues(String statues) {
		this.statues = statues;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}

}
