package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class MyTournaments implements Serializable{

	private Long tournamentId;
	private Long categoryId;
	private Long orgId;
	private String title;
	private String tournamentDate;
	private String startDate;
	private String endDate;
	private String categoryName;
	private String referee;
	private Long prizeMoney;
	private Long tournamentFee;
	private String bannerImage;
	private String venueName;
	private List<PlayersBean> playerBean;
	public List<PlayersBean> getPlayerBean() {
		return playerBean;
	}
	public void setPlayerBean(List<PlayersBean> playerBean) {
		this.playerBean = playerBean;
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
	private String location;
	
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
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTournamentDate() {
		return tournamentDate;
	}
	public void setTournamentDate(String tournamentDate) {
		this.tournamentDate = tournamentDate;
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
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getReferee() {
		return referee;
	}
	public void setReferee(String referee) {
		this.referee = referee;
	}
	public Long getPrizeMoney() {
		return prizeMoney;
	}
	public void setPrizeMoney(Long prizeMoney) {
		this.prizeMoney = prizeMoney;
	}
	public Long getTournamentFee() {
		return tournamentFee;
	}
	public void setTournamentFee(Long tournamentFee) {
		this.tournamentFee = tournamentFee;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	
}
