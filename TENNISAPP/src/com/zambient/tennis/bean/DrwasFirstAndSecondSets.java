package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class DrwasFirstAndSecondSets implements Serializable{
	
	List<DrwasMatch> firstSet;
	List<DrwasMatch> secondSet;
	public List<DrwasMatch> getFirstSet() {
		return firstSet;
	}
	public void setFirstSet(List<DrwasMatch> firstSet) {
		this.firstSet = firstSet;
	}
	public List<DrwasMatch> getSecondSet() {
		return secondSet;
	}
	public void setSecondSet(List<DrwasMatch> secondSet) {
		this.secondSet = secondSet;
	}
	@Override
	public String toString() {
		return "DrwasFirstAndSecondSets [firstSet=" + firstSet + ", secondSet=" + secondSet + ", getFirstSet()="
				+ getFirstSet() + ", getSecondSet()=" + getSecondSet() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

}
