package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class RoundListWithMatchs implements Serializable{

	List<DrawsTeam> matchlist;
	

	public List<DrawsTeam> getMatchlist() {
		return matchlist;
	}

	public void setMatchlist(List<DrawsTeam> matchlist) {
		this.matchlist = matchlist;
	}
}
