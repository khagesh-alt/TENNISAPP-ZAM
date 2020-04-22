package com.zambient.tennis.bean;

import java.util.List;

public class RoundBean {

	private int round;
	private List<MatchCategoryBean> categories;
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public List<MatchCategoryBean> getCategories() {
		return categories;
	}
	public void setCategories(List<MatchCategoryBean> categories) {
		this.categories = categories;
	}
}
