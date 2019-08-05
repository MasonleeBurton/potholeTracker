package com.techelevator.model.dao;

import java.util.List;

import com.techelevator.model.Pothole;

public interface PotholeDAO {
	
	public List<Pothole> getAll();

	public void create(Pothole pothole);

}
