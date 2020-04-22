package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class FinalDrwasBean implements Serializable{
	
	List<RoundListWithMatchs> drwasList;
	private boolean isMatchStarted;
	private boolean isDrawsPublish;
	
	public boolean isMatchStarted() {
		return isMatchStarted;
	}
	public void setMatchStarted(boolean isMatchStarted) {
		this.isMatchStarted = isMatchStarted;
	}
	public List<RoundListWithMatchs> getDrwasList() {
		return drwasList;
	}
	public void setDrwasList(List<RoundListWithMatchs> drwasList) {
		this.drwasList = drwasList;
	}
	public boolean isDrawsPublish() {
		return isDrawsPublish;
	}
	public void setDrawsPublish(boolean isDrawsPublish) {
		this.isDrawsPublish = isDrawsPublish;
	}

}
