package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

@Component("CarrierDTO")
public class CarrierDTO {
	private String industry;
	private String expertise;
	private long experience;
	private long contact;

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public long getExperience() {
		return experience;
	}

	public void setExperience(long experience) {
		this.experience = experience;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

}
