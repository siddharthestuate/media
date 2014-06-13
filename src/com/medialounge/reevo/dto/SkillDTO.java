package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.JobTypeEntity;
import com.medialounge.reevo.entity.UserEntity;

@Component("SkillDTO")
public class SkillDTO {

	private int skillId;
	private UserEntity userId;
	private JobTypeEntity jobTypeId;
	private String skills;

	public int getSkillId() {
		return skillId;
	}

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public JobTypeEntity getJobTypeId() {
		return jobTypeId;
	}

	public void setJobTypeId(JobTypeEntity jobTypeId) {
		this.jobTypeId = jobTypeId;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

}
