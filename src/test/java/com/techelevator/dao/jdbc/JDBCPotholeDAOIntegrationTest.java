package com.techelevator.dao.jdbc;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.model.Address;
import com.techelevator.model.Pothole;
import com.techelevator.model.dao.PotholeDAO;
import com.techelevator.model.dao.jdbc.JDBCPotholeDAO;

public class JDBCPotholeDAOIntegrationTest extends DAOIntegrationTest {

	private PotholeDAO dao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setup() {
		jdbcTemplate = new JdbcTemplate(getDataSource());
		truncateTables();
		dao = new JDBCPotholeDAO(getDataSource());
	}
	
	@Test
	public void getAll() {
		// Database with no potholes returns no potholes
		Assert.assertEquals("Database with no potholes returns no potholes", 0, dao.getAll().size());
		
		// Add first test pothole
		Address address1 = createAddress(43200, "fake city", "123 fake st");
		Pothole pothole1 = createPothole("small", "pothole", "23.2", "23.1", address1);
		dao.create(pothole1);
		// Database with one pothole returns same pothole
		Assert.assertEquals("one pothole in db should return one pothole", 1, dao.getAll().size());
		Assert.assertEquals("one pothole in db returns same pothole", pothole1.getId(), dao.getAll().get(0).getId());
		
		// Add second test pothole
		Address address2 = createAddress(99999, "fake city 2", "524 fake st");
		Pothole pothole2 = createPothole("medium", "pothole", "23.2", "23.1", address2);
		dao.create(pothole2);
		// Database with two potholes returns two potholes
		Assert.assertEquals("two potholes in db should return two potholes", 2, dao.getAll().size());
	}
	
	private Address createAddress(int zipCode, String city, String addressLine1) {
		Address a = new Address();
		
		a.setZipCode(zipCode);
		a.setCity(city);
		a.setAddressLine1(addressLine1);
		
		return a;
	}

	private Pothole createPothole(String size, String description, String latitude, String longitude, Address address) {
		Pothole p = new Pothole();
		
		p.setSize(size);
		p.setDescription(description);
		p.setLatitude(latitude);
		p.setLongitude(longitude);
		p.setAddress(address);
		
		return p;
	}

	private void truncateTables() {
		String sql = "TRUNCATE pothole CASCADE; TRUNCATE address CASCADE";
		jdbcTemplate.update(sql);
	}
}
