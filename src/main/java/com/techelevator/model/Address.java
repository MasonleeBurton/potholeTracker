package com.techelevator.model;

import org.hibernate.validator.constraints.NotBlank;

public class Address {

	private long id;
	@NotBlank
	private int zipCode;
	@NotBlank
	private String city;
	@NotBlank
	private String addressLine1;
	private String addressLine2 = "";
	
	// getters and setters
	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
