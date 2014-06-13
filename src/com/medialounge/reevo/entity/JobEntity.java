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

@Entity
@Table(name = "job")
public class JobEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "job_id")
	private int jobId;

	@ManyToOne(targetEntity = JobTypeEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "job_type_id")
	private JobTypeEntity jobTypeEntity;

	@Column(name = "experience")
	private int experience;
	@Column(name = "priority")
	private String priority;
	@Column(name = "description")
	private String description;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;
	
	@Column(name = "user_name")
	private String userName;

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	@Column(name = "job_title")
	private String jobTitle;

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public JobTypeEntity getJobTypeEntity() {
		return jobTypeEntity;
	}

	public void setJobTypeEntity(JobTypeEntity jobTypeEntity) {
		this.jobTypeEntity = jobTypeEntity;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

}
