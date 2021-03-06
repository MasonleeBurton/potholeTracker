package com.techelevator.model;

import java.time.LocalDate;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

public class Pothole {

	private long id;
	
	@Valid
	private Address address;
	private Status status;
	@NotBlank(message = "Must have size.")
	private String size;
	private String description;
	private LocalDate createdOn;
	@NotBlank(message = "Must have a longitude.")
	private String longitude;
	@NotBlank(message = "Must have a latitude.")
	private String latitude;
	private boolean hasImage;
	private long userId;

	public boolean isHasImage() {
		return hasImage;
	}

	public void setHasImage(boolean hasImage) {
		this.hasImage = hasImage;
	}

	// getters and setters
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(LocalDate createdOn) {
		this.createdOn = createdOn;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
}