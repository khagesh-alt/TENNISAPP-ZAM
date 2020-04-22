package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class MatchRoundBean implements Serializable{
 private String round;
 private List<MatchBean> roundList;
public String getRound() {
	return round;
}
public void setRound(String round) {
	this.round = round;
}
public List<MatchBean> getRoundList() {
	return roundList;
}
public void setRoundList(List<MatchBean> roundList) {
	this.roundList = roundList;
}
}
