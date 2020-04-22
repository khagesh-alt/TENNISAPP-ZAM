package com.zambient.tennis.bean;

import java.io.Serializable;

public class PaymentBean implements Serializable{
	private int categoryId;
	private int playerId;
	private int tournamentId;
	private String cardHolderName;
	private String cardNumber;
	private String cardType;
	private String transactionStatus;
	private int amount;
	
	public int getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(int tournamentId) {
		this.tournamentId = tournamentId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getPlayerId() {
		return playerId;
	}
	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "PaymentBean [categoryId=" + categoryId + ", playerId=" + playerId + ", tournamentId=" + tournamentId
				+ ", cardHolderName=" + cardHolderName + ", cardNumber=" + cardNumber + ", cardType=" + cardType
				+ ", transactionStatus=" + transactionStatus + ", amount=" + amount + "]";
	}

}
