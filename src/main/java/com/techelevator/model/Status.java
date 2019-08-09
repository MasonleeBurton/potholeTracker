package com.techelevator.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Status {

	private DateTimeFormatter df = DateTimeFormatter.ofPattern("MM/dd/yyyy");
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

	public void setReportedOn(String date) {
		try {
			reportedOn = LocalDate.parse(date, df);
		} catch (Exception e) {
			try {
				reportedOn = LocalDate.parse(date);
			} catch (Exception a) {
				System.out.println(date);
				reportedOn = null;
			}
		}
	}

	public LocalDate getInspectedOn() {
		return inspectedOn;
	}

	public void setInspectedOn(String date) {
		try {
			inspectedOn = LocalDate.parse(date, df);
		} catch (Exception e) {
			try {
				inspectedOn = LocalDate.parse(date);
			} catch (Exception a) {
				System.out.println(date);
				inspectedOn = null;
			}
		}
	}

	public LocalDate getRepairedOn() {
		return repairedOn;
	}

	public void setRepairedOn(String date) {
		try {
			repairedOn = LocalDate.parse(date, df);
		} catch (Exception e) {
			try {
				repairedOn = LocalDate.parse(date);
			} catch (Exception a) {
				System.out.println(date);
				repairedOn = null;
			}
		}
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((inspectedOn == null) ? 0 : inspectedOn.hashCode());
		result = prime * result + ((rank == null) ? 0 : rank.hashCode());
		result = prime * result + ((repairedOn == null) ? 0 : repairedOn.hashCode());
		result = prime * result + ((reportedOn == null) ? 0 : reportedOn.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Status other = (Status) obj;
		if (id != other.id)
			return false;
		if (inspectedOn == null) {
			if (other.inspectedOn != null)
				return false;
		} else if (!inspectedOn.equals(other.inspectedOn))
			return false;
		if (rank == null) {
			if (other.rank != null)
				return false;
		} else if (!rank.equals(other.rank))
			return false;
		if (repairedOn == null) {
			if (other.repairedOn != null)
				return false;
		} else if (!repairedOn.equals(other.repairedOn))
			return false;
		if (reportedOn == null) {
			if (other.reportedOn != null)
				return false;
		} else if (!reportedOn.equals(other.reportedOn))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Status [id=" + id + ", reportedOn=" + reportedOn + ", inspectedOn=" + inspectedOn + ", repairedOn="
				+ repairedOn + ", rank=" + rank + "]";
	}
}