package com.medialounge.reevo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("SkillEntity")
@Entity
@Table(name = "skills")
public class SkillEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "skill_id")
	private int skillId;
	
	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userId;
	
	@ManyToOne(targetEntity = JobTypeEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "job_type_id")
	private JobTypeEntity jobTypeId;
	
	@Column(name = "skills")
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
