package com.medialounge.reevo.dto;

import javax.persistence.Column;

public class JobTypeEntityDto {
	private int jobTypeId;
	private String description;
	public int getJobTypeId() {
		return jobTypeId;
	}
	public void setJobTypeId(int jobTypeId) {
		this.jobTypeId = jobTypeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
