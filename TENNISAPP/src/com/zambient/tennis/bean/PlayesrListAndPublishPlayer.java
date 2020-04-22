package com.zambient.tennis.bean;

import java.io.Serializable;

public class PlayesrListAndPublishPlayer implements Serializable{
	
	
	private boolean isPlayersPublish;

	public boolean isPlayersPublish() {
		return isPlayersPublish;
	}

	public void setPlayersPublish(boolean isPlayersPublish) {
		this.isPlayersPublish = isPlayersPublish;
	}

	@Override
	public String toString() {
		return "PlayesrListAndPublishPlayer [isPlayersPublish=" + isPlayersPublish + "]";
	}

}
