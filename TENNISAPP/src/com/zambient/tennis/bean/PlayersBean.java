package com.zambient.tennis.bean;

import java.io.Serializable;

public class PlayersBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String  dateOfBirth;
	private String address;
	private String lavel;
	private String phone;
	private String email;
	private String pwd;
	private String repwd;
	private Long itaId; 
	private Long itaRank;
	private Long gender;
	private Long points;
	private Long rank;
	private Long age;
	private Long playerId;
	private String playerAge;
	private Long registeredBy;
	private Long paymentId;
	private Long playerId2;
	private String playerRegBy;
	private boolean selected;
	private Integer tournamentId;
	private Integer categoryId;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLavel() {
		return lavel;
	}
	public void setLavel(String lavel) {
		this.lavel = lavel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRepwd() {
		return repwd;
	}
	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}
	public Long getItaId() {
		return itaId;
	}
	public void setItaId(Long itaId) {
		this.itaId = itaId;
	}
	public Long getItaRank() {
		return itaRank;
	}
	public void setItaRank(Long itaRank) {
		this.itaRank = itaRank;
	}
	public Long getGender() {
		return gender;
	}
	public void setGender(Long gender) {
		this.gender = gender;
	}
	public Long getPoints() {
		return points;
	}
	public void setPoints(Long points) {
		this.points = points;
	}
	public Long getRank() {
		return rank;
	}
	public void setRank(Long rank) {
		this.rank = rank;
	}
	public Long getAge() {
		return age;
	}
	public void setAge(Long age) {
		this.age = age;
	}
	public Long getPlayerId() {
		return playerId;
	}
	public Long getPlayerId2() {
		return playerId2;
	}
	public void setPlayerId2(Long playerId2) {
		this.playerId2 = playerId2;
	}
	public void setPlayerId(Long playerId) {
		this.playerId = playerId;
	}
	public String getPlayerAge() {
		return playerAge;
	}
	public void setPlayerAge(String playerAge) {
		this.playerAge = playerAge;
	}
	public Long getRegisteredBy() {
		return registeredBy;
	}
	public void setRegisteredBy(Long registeredBy) {
		this.registeredBy = registeredBy;
	}
	public Long getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}
	public String getPlayerRegBy() {
		return playerRegBy;
	}
	public void setPlayerRegBy(String playerRegBy) {
		this.playerRegBy = playerRegBy;
	}
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	public Integer getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(Integer tournamentId) {
		this.tournamentId = tournamentId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	@Override
	public String toString() {
		return "PlayersBean [name=" + name + ", dateOfBirth=" + dateOfBirth + ", address=" + address + ", lavel="
				+ lavel + ", phone=" + phone + ", email=" + email + ", pwd=" + pwd + ", repwd=" + repwd + ", itaId="
				+ itaId + ", itaRank=" + itaRank + ", gender=" + gender + ", points=" + points + ", rank=" + rank
				+ ", age=" + age + ", playerId=" + playerId + ", playerAge=" + playerAge + ", registeredBy="
				+ registeredBy + ", paymentId=" + paymentId + ", playerId2=" + playerId2 + ", playerRegBy="
				+ playerRegBy + ", selected=" + selected + ", tournamentId=" + tournamentId + ", categoryId="
				+ categoryId + "]";
	}

	
	
}
