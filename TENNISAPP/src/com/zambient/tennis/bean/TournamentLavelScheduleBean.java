package com.zambient.tennis.bean;

import java.util.List;

public class TournamentLavelScheduleBean {
    
	private boolean conditionVal;
	private List<ScheduleInnerBean> scheduleList;
	public boolean isConditionVal() {
		return conditionVal;
	}
	public void setConditionVal(boolean conditionVal) {
		this.conditionVal = conditionVal;
	}
	public List<ScheduleInnerBean> getScheduleList() {
		return scheduleList;
	}
	public void setScheduleList(List<ScheduleInnerBean> scheduleList) {
		this.scheduleList = scheduleList;
	}
}
