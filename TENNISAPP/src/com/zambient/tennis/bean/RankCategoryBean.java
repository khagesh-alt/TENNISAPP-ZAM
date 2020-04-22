package com.zambient.tennis.bean;

import java.io.Serializable;

public class RankCategoryBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Long rankId;
	private String rankName;
	
	public Long getRankId() {
		return rankId;
	}
	public void setRankId(Long rankId) {
		this.rankId = rankId;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	@Override
	public String toString() {
		return "RankCategoryBean [rankId=" + rankId + ", rankName=" + rankName + "]";
	}
	
}
