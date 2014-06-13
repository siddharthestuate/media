package com.medialounge.reevo.dto;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.medialounge.reevo.entity.JobTypeEntity;
import com.medialounge.reevo.entity.UserEntity;

@Component("JobDTO")
public class JobDTO {

	private int jobId;
	private int jobTypeId;
	private String jobTypeDescription;
	private int experience;
	private String priority;
	private String description;
	private String userName;
	private String jobTitle;
	private UserEntity userEntity;
	private JobTypeEntity jobTypeEntity;
	private int userId;
	private String responseFrom;
	private String skill;
	private List<MultipartFile> uploadFile;
	private String docsPath;
	
	private String jobStatus;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public int getJobTypeId() {
		return jobTypeId;
	}

	public void setJobTypeId(int jobTypeId) {
		this.jobTypeId = jobTypeId;
	}

	public String getJobTypeDescription() {
		return jobTypeDescription;
	}

	public void setJobTypeDescription(String jobTypeDescription) {
		this.jobTypeDescription = jobTypeDescription;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	
	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public JobTypeEntity getJobTypeEntity() {
		return jobTypeEntity;
	}

	public void setJobTypeEntity(JobTypeEntity jobTypeEntity) {
		this.jobTypeEntity = jobTypeEntity;
	}

	public String getResponseFrom() {
		return responseFrom;
	}

	public void setResponseFrom(String responseFrom) {
		this.responseFrom = responseFrom;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
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
