package com.zambient.tennis.bean;

import java.io.Serializable;

public class DrawsPlayer implements Serializable{

	private Long playerId;
	private String name;
	private Long age;
	private String mobile;
	private Long rank;
	private Long categoryId;
	private Long tournamentId;
	private boolean booleanVal;
	private Long playerId2;
	private String name2;
	private String mobile2;
	private String team;
	private String matchType;
	private boolean isByMatch;
	
	public Long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(Long playerId) {
		this.playerId = playerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getAge() {
		return age;
	}
	public void setAge(Long age) {
		this.age = age;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Long getRank() {
		return rank;
	}
	public void setRank(Long rank) {
		this.rank = rank;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Long getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(Long tournamentId) {
		this.tournamentId = tournamentId;
	}
	public boolean isBooleanVal() {
		return booleanVal;
	}
	public void setBooleanVal(boolean booleanVal) {
		this.booleanVal = booleanVal;
	}
	public Long getPlayerId2() {
		return playerId2;
	}
	public void setPlayerId2(Long playerId2) {
		this.playerId2 = playerId2;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getMatchType() {
		return matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}
	public boolean isByMatch() {
		return isByMatch;
	}
	public void setByMatch(boolean isByMatch) {
		this.isByMatch = isByMatch;
	}
	@Override
	public String toString() {
		return "DrawsPlayer [playerId=" + playerId + ", name=" + name + ", age=" + age + ", mobile=" + mobile
				+ ", rank=" + rank + ", categoryId=" + categoryId + ", tournamentId=" + tournamentId + ", booleanVal="
				+ booleanVal + ", playerId2=" + playerId2 + ", name2=" + name2 + ", mobile2=" + mobile2 + ", team="
				+ team + ", matchType=" + matchType + ", isByMatch=" + isByMatch + "]";
	}
	
}
