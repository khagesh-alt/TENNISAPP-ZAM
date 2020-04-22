package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class DrwasMatch implements Serializable{

	List<DrawsPlayer> match;

	public List<DrawsPlayer> getMatch() {
		return match;
	}

	public void setMatch(List<DrawsPlayer> match) {
		this.match = match;
	}

	@Override
	public String toString() {
		return "DrwasMatch [match=" + match + "]";
	}
	
}
