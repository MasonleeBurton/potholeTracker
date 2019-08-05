package com.techelevator.model.dao.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Address;
import com.techelevator.model.Pothole;
import com.techelevator.model.dao.PotholeDAO;

@Component
public class JDBCPotholeDAO implements PotholeDAO {

	JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCPotholeDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Pothole> getAll() {

		List<Pothole> potholes = new ArrayList<>();

		String sql = "SELECT * FROM pothole p " + "JOIN address a " + "ON a.address_id = p.address_id";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

		while (results.next()) {
			potholes.add(mapRowToPothole(results));
		}

		return potholes;
	}

	private Pothole mapRowToPothole(SqlRowSet results) {
		Pothole p = new Pothole();

		p.setId(results.getLong("p.id"));
		p.setCreatedOn(results.getDate("p.created_on").toLocalDate());
		p.setDescription(results.getString("p.description"));
		p.setLatitude(results.getString("p.latitude"));
		p.setLongitude(results.getString("p.longitude"));
		p.setSize(results.getString("p.size"));
		p.setAddress(mapRowToAddress(results));

		return p;
	}

	private Address mapRowToAddress(SqlRowSet results) {
		Address a = new Address();

		a.setId(results.getLong("a.address_id"));
		a.setAddressLine1(results.getString("a.address_line1"));
		a.setAddressLine2(results.getString("a.address_line2"));
		a.setZipCode(results.getInt("a.zip_code"));
		a.setCity(results.getString("a.city"));

		return a;
	}

	@Override
	public void create(Pothole pothole) {
		String sql = "INSERT INTO pothole (id, created_on, description, latitude, longitude, size) "
				+ "VALUES (DEFAULT, DEFAULT, ?, ?, ?, ?) " + "RETURNING id";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, pothole.getDescription(), pothole.getLatitude(), pothole.getLongitude(),
				pothole.getSize());
		
		pothole.setId(results.getLong("id"));
	}

}
