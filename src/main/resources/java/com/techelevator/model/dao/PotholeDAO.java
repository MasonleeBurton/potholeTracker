package com.techelevator.model.dao;

import java.util.List;

import com.techelevator.model.Pothole;
import com.techelevator.model.Status;

public interface PotholeDAO {
	
	public List<Pothole> getAll();

	public void create(Pothole pothole);

	public void updateStatus(Status status, long potholeId);

	public void delete(long potholeId);

	Pothole getPotholeById(long potholeId);

}
