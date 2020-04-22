package com.zambient.tennis.bean;

import java.io.Serializable;

public class OrganiserBean implements Serializable{
	private Long id;
	private String name;
	private String address;
	private String phone;
	private String mailId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	@Override
	public String toString() {
		return "OrganiserBean [id=" + id + ", name=" + name + ", address=" + address + ", phone=" + phone + ", mailId="
				+ mailId + "]";
	}

}
