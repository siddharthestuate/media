/**
 * @author Mahesh Nasana
 */

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
@Table(name = "jobform")
public class JobFormEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "jobform_id")
	private int jobFormId;
	
	@ManyToOne(targetEntity = JobEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "job_id")
	private JobEntity jobId;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userId;

	@Column(name = "skill")
	private String skill;

	@Column(name = "docs_path")
	private String docsPath;

	@Column(name = "job_status")
	private String jobStatus;
	

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public JobEntity getJobId() {
		return jobId;
	}

	public void setJobId(JobEntity jobId) {
		this.jobId = jobId;
	}

	
	public int getJobFormId() {
		return jobFormId;
	}

	public void setJobFormId(int jobFormId) {
		this.jobFormId = jobFormId;
	}

	
	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getDocsPath() {
		return docsPath;
	}

	public void setDocsPath(String docsPath) {
		this.docsPath = docsPath;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

}