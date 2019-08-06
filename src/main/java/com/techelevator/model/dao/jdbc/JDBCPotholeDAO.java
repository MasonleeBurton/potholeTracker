package com.techelevator.model.dao.jdbc;

import java.time.LocalDateTime;
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

	@Override
	public void create(Pothole pothole) {
		String addressSql = "INSERT INTO address (address_id, address_line_1, address_line_2, zip_code, city) "
				+ "VALUES (DEFAULT, ?, ?, ?, ?) " + "RETURNING address_id";
		Address address = pothole.getAddress();
		SqlRowSet addressResults = jdbcTemplate.queryForRowSet(addressSql, address.getAddressLine1(),
				address.getAddressLine2(), address.getZipCode(), address.getCity());
		addressResults.next();
		address.setId(addressResults.getLong("address_id"));

		String potholeSql = "INSERT INTO pothole (id, address_id, created_on, description, latitude, longitude, size) "
				+ "VALUES (DEFAULT, ?, ?, ?, ?, ?, ?) " + "RETURNING id";

		SqlRowSet potholeResults = jdbcTemplate.queryForRowSet(potholeSql, pothole.getAddress().getId(), LocalDateTime.now(),
				pothole.getDescription(), pothole.getLatitude(), pothole.getLongitude(), pothole.getSize());
		potholeResults.next();
		pothole.setId(potholeResults.getLong("id"));
	}

	private Pothole mapRowToPothole(SqlRowSet results) {
		Pothole p = new Pothole();

		p.setId(results.getLong("id"));
		p.setCreatedOn(results.getDate("created_on").toLocalDate());
		p.setDescription(results.getString("description"));
		p.setLatitude(results.getString("latitude"));
		p.setLongitude(results.getString("longitude"));
		p.setSize(results.getString("size"));
		p.setAddress(mapRowToAddress(results));

		return p;
	}

	private Address mapRowToAddress(SqlRowSet results) {
		Address a = new Address();

		a.setId(results.getLong("address_id"));
		a.setAddressLine1(results.getString("address_line_1"));
		a.setAddressLine2(results.getString("address_line_2"));
		a.setZipCode(results.getInt("zip_code"));
		a.setCity(results.getString("city"));

		return a;
	}
}
