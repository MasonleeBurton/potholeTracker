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
import com.techelevator.model.Status;
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

		String sql = "SELECT * FROM pothole p " + "JOIN address a ON a.address_id = p.address_id "
				+ "JOIN status s ON s.status_id = p.status_id";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

		while (results.next()) {
			potholes.add(mapRowToPothole(results));
		}

		return potholes;
	}

	@Override
	public void updateStatus(Status status, long potholeId) {
		String sql = "UPDATE status s " + "SET reported_on = ?, inspected_on = ?, repaired_on = ?, rank = ? "
				+ "FROM pothole p " + "WHERE p.status_id = s.status_id " + "AND p.id = ?";
		jdbcTemplate.update(sql, status.getReportedOn(), status.getInspectedOn(), status.getRepairedOn(),
				status.getRank(), potholeId);
	}

	@Override
	public void delete(long potholeId) {
		Pothole p = getPotholeById(potholeId);

		String statusSql = "DELETE FROM status " + "WHERE status.status_id = ? ";
		jdbcTemplate.update(statusSql, p.getStatus().getId());

		String addressSql = "DELETE FROM address " + "WHERE address.address_id = ? ";
		jdbcTemplate.update(addressSql, p.getAddress().getId());
	}

	@Override
	public void create(Pothole pothole) {
		createAddress(pothole.getAddress());
		pothole.setStatus(new Status());
		createStatus(pothole.getStatus());

		String potholeSql = "INSERT INTO pothole (id, address_id, status_id, created_on, description, latitude, longitude, size) "
				+ "VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?) " + "RETURNING id";

		SqlRowSet potholeResults = jdbcTemplate.queryForRowSet(potholeSql, pothole.getAddress().getId(),
				pothole.getStatus().getId(), LocalDateTime.now(), pothole.getDescription(), pothole.getLatitude(),
				pothole.getLongitude(), pothole.getSize());
		potholeResults.next();
		pothole.setId(potholeResults.getLong("id"));
	}

	@Override
	public Pothole getPotholeById(long potholeId) {
		String sql = "SELECT * FROM pothole p " + "JOIN address a " + "ON a.address_id = p.address_id "
				+ "JOIN status s ON s.status_id = p.status_id " + "WHERE p.id = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, potholeId);
		if (results.next()) {
			return mapRowToPothole(results);
		}

		return null;
	}

	private void createStatus(Status status) {
		String statusSql = "INSERT INTO status (status_id) values (DEFAULT) " + "RETURNING status_id";
		SqlRowSet statusResults = jdbcTemplate.queryForRowSet(statusSql);
		statusResults.next();
		status.setId(statusResults.getLong("status_id"));
	}

	private void createAddress(Address address) {
		String addressSql = "INSERT INTO address (address_id, address_line_1, address_line_2, zip_code, city, state) "
				+ "VALUES (DEFAULT, ?, ?, ?, ?, ?) " + "RETURNING address_id";
		SqlRowSet addressResults = jdbcTemplate.queryForRowSet(addressSql, address.getAddressLine1(),
				address.getAddressLine2(), address.getZipCode(), address.getCity(), address.getState());
		addressResults.next();
		address.setId(addressResults.getLong("address_id"));
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
		p.setStatus(mapRowToStatus(results));

		return p;
	}

	private Address mapRowToAddress(SqlRowSet results) {
		Address a = new Address();

		a.setId(results.getLong("address_id"));
		a.setAddressLine1(results.getString("address_line_1"));
		a.setAddressLine2(results.getString("address_line_2"));
		a.setZipCode(results.getInt("zip_code"));
		a.setCity(results.getString("city"));
		a.setState(results.getString("state"));

		return a;
	}

	private Status mapRowToStatus(SqlRowSet results) {
		Status s = new Status();

		s.setId(results.getLong("status_id"));

		try {
			s.setReportedOn(results.getDate("reported_on").toLocalDate());
		} catch (Exception e) {

		}
		try {
			s.setInspectedOn(results.getDate("inspected_on").toLocalDate());
		} catch (Exception e) {

		}
		try {
			s.setRepairedOn(results.getDate("repaired_on").toLocalDate());
		} catch (Exception e) {

		}

		s.setRank(results.getString("rank"));

		return s;
	}
}
