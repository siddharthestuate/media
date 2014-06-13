package com.medialounge.reevo.form;

import java.util.ArrayList;
import java.util.List;

public class SkillForm {

	private int skillId;
	private int userId;
	private List<String> jobTypeId = new ArrayList<String>();
	private String jobTypeDescription;
	private List<String> skills = new ArrayList<String>();

	public int getSkillId() {
		return skillId;
	}

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getJobTypeDescription() {
		return jobTypeDescription;
	}

	public void setJobTypeDescription(String jobTypeDescription) {
		this.jobTypeDescription = jobTypeDescription;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public List<String> getJobTypeId() {
		return jobTypeId;
	}

	public void setJobTypeId(List<String> jobTypeId) {
		this.jobTypeId = jobTypeId;
	}

}
