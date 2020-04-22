package com.zambient.tennis.bean;

import java.io.Serializable;

public class EnalbleButtonBean implements Serializable{
	
	private boolean isMatchStarted;
	private boolean isDrawsCreated;
	private boolean isScheduleCreated;
	public boolean isMatchStarted() {
		return isMatchStarted;
	}
	public void setMatchStarted(boolean isMatchStarted) {
		this.isMatchStarted = isMatchStarted;
	}
	public boolean isDrawsCreated() {
		return isDrawsCreated;
	}
	public void setDrawsCreated(boolean isDrawsCreated) {
		this.isDrawsCreated = isDrawsCreated;
	}
	public boolean isScheduleCreated() {
		return isScheduleCreated;
	}
	public void setScheduleCreated(boolean isScheduleCreated) {
		this.isScheduleCreated = isScheduleCreated;
	}

}
