package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class MatchCategoryBean implements  Serializable{
	
	private int categoryId;
	private List<MatchBean> match;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public List<MatchBean> getMatch() {
		return match;
	}
	public void setMatch(List<MatchBean> match) {
		this.match = match;
	}

}
