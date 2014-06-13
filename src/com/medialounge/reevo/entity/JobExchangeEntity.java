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
@Table(name = "job_exchange")
public class JobExchangeEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "job_exchange_id")
	private int jobExchangeId;
	
	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "assigner",referencedColumnName="user_id")
	private UserEntity assignerUserEntity;
	
	
	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "assignee",referencedColumnName="user_id")
	private UserEntity assigneeUserEntity;
	
	@ManyToOne(targetEntity = JobEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "job_id")
	private JobEntity jobEntity;

	public int getJobExchangeId() {
		return jobExchangeId;
	}

	public void setJobExchangeId(int jobExchangeId) {
		this.jobExchangeId = jobExchangeId;
	}

	public UserEntity getAssignerUserEntity() {
		return assignerUserEntity;
	}

	public void setAssignerUserEntity(UserEntity assignerUserEntity) {
		this.assignerUserEntity = assignerUserEntity;
	}

	public UserEntity getAssigneeUserEntity() {
		return assigneeUserEntity;
	}

	public void setAssigneeUserEntity(UserEntity assigneeUserEntity) {
		this.assigneeUserEntity = assigneeUserEntity;
	}

	public JobEntity getJobEntity() {
		return jobEntity;
	}

	public void setJobEntity(JobEntity jobEntity) {
		this.jobEntity = jobEntity;
	}
	
}