package com.techelevator.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class User {
	
	@Email
	private String userName;
	
	@Size(min=7, message="Password too short, must be at least 10")
//	@Pattern.List({
//		@Pattern(regexp=".*[a-z].*", message="Must have a lower case"),
//		@Pattern(regexp=".*[A-Z].*", message="Must have a capital")
//	})
	@Pattern(regexp=".*[A-Z].*", message="Must have a capital")
	private String password;
	private String role;
	
	private String confirmPassword;
	private long userId;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
