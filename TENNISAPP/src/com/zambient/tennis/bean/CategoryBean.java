package com.zambient.tennis.bean;

import java.io.Serializable;

public class CategoryBean implements Serializable{
	
	private int category_id;
	private String category_name;
	private String category_desc;
	private int category_age;
	private int category_gender;
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	public int getCategory_age() {
		return category_age;
	}
	public void setCategory_age(int category_age) {
		this.category_age = category_age;
	}
	public int getCategory_gender() {
		return category_gender;
	}
	public void setCategory_gender(int category_gender) {
		this.category_gender = category_gender;
	}
	@Override
	public String toString() {
		return "CategoryBean [category_id=" + category_id + ", category_name=" + category_name + ", category_desc="
				+ category_desc + ", category_age=" + category_age + ", category_gender=" + category_gender + "]";
	}

}
