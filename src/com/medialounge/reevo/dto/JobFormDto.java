package com.medialounge.reevo.dto;

import java.util.List;

import javax.persistence.Column;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.medialounge.reevo.entity.JobEntity;
import com.medialounge.reevo.entity.UserEntity;
@Component("jobFormDto")
public class JobFormDto {
	private int jobFormId;
	private JobEntity jobId;
	public JobEntity getJobId() {
		return jobId;
	}


	public void setJobId(JobEntity jobId) {
		this.jobId = jobId;
	}
	private UserEntity userId;
	public UserEntity getUserId() {
		return userId;
	}


	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}
	
	private String skill;
	private String docsPath;
	private String jobStatus;
	private List<MultipartFile> uploadFile;
	public int getJobFormId() {
		return jobFormId;
	}
	
	
	
	public String getSkill() {
		return skill;
	}
	public String getDocsPath() {
		return docsPath;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobFormId(int jobFormId) {
		this.jobFormId = jobFormId;
	}
	
	
	
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public void setDocsPath(String docsPath) {
		this.docsPath = docsPath;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}


	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

}
