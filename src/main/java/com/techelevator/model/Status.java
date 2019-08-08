package com.techelevator.model;

import java.time.LocalDate;

public class Status {

	private long id;
	private LocalDate reportedOn;
	private LocalDate inspectedOn;
	private LocalDate repairedOn;
	private String rank;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public LocalDate getReportedOn() {
		return reportedOn;
	}

	public void setReportedOn(LocalDate reportedOn) {
		this.reportedOn = reportedOn;
	}

	public LocalDate getInspectedOn() {
		return inspectedOn;
	}

	public void setInspectedOn(LocalDate inspectedOn) {
		this.inspectedOn = inspectedOn;
	}

	public LocalDate getRepairedOn() {
		return repairedOn;
	}

	public void setRepairedOn(LocalDate repairedOn) {
		this.repairedOn = repairedOn;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}
}
