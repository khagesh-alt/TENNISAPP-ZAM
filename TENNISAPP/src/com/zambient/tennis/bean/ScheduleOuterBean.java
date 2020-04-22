package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class ScheduleOuterBean implements Serializable{
	private String scheduleDate;
	private List<ScheduleInnerBean> scheduleInner;
	public String getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public List<ScheduleInnerBean> getScheduleInner() {
		return scheduleInner;
	}
	public void setScheduleInner(List<ScheduleInnerBean> scheduleInner) {
		this.scheduleInner = scheduleInner;
	}

}
