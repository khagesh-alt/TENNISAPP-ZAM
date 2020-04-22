package com.zambient.tennis.bean;

import java.io.Serializable;

public class PlayerUserBO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer playerId;
	private String name;
	private String phone;
	private Integer age;
	private String password;
	
	public Integer getPlayerId() {
		return playerId;
	}
	public void setPlayerId(Integer playerId) {
		this.playerId = playerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "PlayerUserBO [playerId=" + playerId + ", name=" + name + ", phone=" + phone + ", age=" + age
				+ ", password=" + password + "]";
	}
	

}
