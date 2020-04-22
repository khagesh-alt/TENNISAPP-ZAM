package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class TournamentList implements Serializable{
	
	private int tournamentId;
	private String title;
	private int orgaizerId;
	private String venueName;
	private String location;
	private String date;
	private String organizerName;
	private String phone;
	private String altPhone;
	private String email;
	private String bannerImage;
	private String refereeName;
	private String tournamentStartDate;
	private String tournamentEndDate;
	private String regStartDate;
	private String regEndDate;
	private boolean conditionVal;
	private String active;
	private String tStartDate;
	private String tEndDate;
	private String rStartDate;
	private String rEndDate;
	private List<TournamentCategoryBean> categoryList;
	private boolean isLive;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOrganizerName() {
		return organizerName;
	}
	public void setOrganizerName(String organizerName) {
		this.organizerName = organizerName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAltPhone() {
		return altPhone;
	}
	public void setAltPhone(String altPhone) {
		this.altPhone = altPhone;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public String getRefereeName() {
		return refereeName;
	}
	public void setRefereeName(String refereeName) {
		this.refereeName = refereeName;
	}
	public List<TournamentCategoryBean> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<TournamentCategoryBean> categoryList) {
		this.categoryList = categoryList;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getOrgaizerId() {
		return orgaizerId;
	}
	public void setOrgaizerId(int orgaizerId) {
		this.orgaizerId = orgaizerId;
	}
	public String getTournamentStartDate() {
		return tournamentStartDate;
	}
	public void setTournamentStartDate(String tournamentStartDate) {
		this.tournamentStartDate = tournamentStartDate;
	}
	public String getTournamentEndDate() {
		return tournamentEndDate;
	}
	public void setTournamentEndDate(String tournamentEndDate) {
		this.tournamentEndDate = tournamentEndDate;
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
	public boolean isConditionVal() {
		return conditionVal;
	}
	public void setConditionVal(boolean conditionVal) {
		this.conditionVal = conditionVal;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String gettStartDate() {
		return tStartDate;
	}
	public void settStartDate(String tStartDate) {
		this.tStartDate = tStartDate;
	}
	public String gettEndDate() {
		return tEndDate;
	}
	public void settEndDate(String tEndDate) {
		this.tEndDate = tEndDate;
	}
	public String getrStartDate() {
		return rStartDate;
	}
	public void setrStartDate(String rStartDate) {
		this.rStartDate = rStartDate;
	}
	public String getrEndDate() {
		return rEndDate;
	}
	public void setrEndDate(String rEndDate) {
		this.rEndDate = rEndDate;
	}
	public boolean isLive() {
		return isLive;
	}
	public void setLive(boolean isLive) {
		this.isLive = isLive;
	}
	

}
