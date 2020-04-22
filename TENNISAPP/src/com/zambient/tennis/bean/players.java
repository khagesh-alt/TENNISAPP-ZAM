package com.zambient.tennis.bean;

import java.io.Serializable;

public class players implements Serializable{
	
	private int player_id;
	private String player_name;
	private String player_add;
	private int player_age;
	private String player_lavel;
	private String player_phone;
	private String player_email;
	private String gender;
	private int player_itarank;
	private int player_points;
	private int player_ranks;
	
	public int getPlayer_id() {
		return player_id;
	}
	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}
	public String getPlayer_name() {
		return player_name;
	}
	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}
	public String getPlayer_add() {
		return player_add;
	}
	public void setPlayer_add(String player_add) {
		this.player_add = player_add;
	}
	public int getPlayer_age() {
		return player_age;
	}
	public void setPlayer_age(int player_age) {
		this.player_age = player_age;
	}
	public String getPlayer_lavel() {
		return player_lavel;
	}
	public void setPlayer_lavel(String player_lavel) {
		this.player_lavel = player_lavel;
	}
	public String getPlayer_phone() {
		return player_phone;
	}
	public void setPlayer_phone(String player_phone) {
		this.player_phone = player_phone;
	}
	public String getPlayer_email() {
		return player_email;
	}
	public void setPlayer_email(String player_email) {
		this.player_email = player_email;
	}
	public int getPlayer_itarank() {
		return player_itarank;
	}
	public void setPlayer_itarank(int player_itarank) {
		this.player_itarank = player_itarank;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPlayer_points() {
		return player_points;
	}
	public void setPlayer_points(int player_points) {
		this.player_points = player_points;
	}
	public int getPlayer_ranks() {
		return player_ranks;
	}
	public void setPlayer_ranks(int player_ranks) {
		this.player_ranks = player_ranks;
	}

}
