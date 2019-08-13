package com.techelevator.model.dao;

import java.util.List;

import com.techelevator.model.User;

public interface UserDAO {

	public void saveUser(String userName, String password, String role);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

	public void updateRole(String userName, String role);


}
