package com.medialounge.reevo.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.medialounge.reevo.entity.JobEntity;
import com.medialounge.reevo.entity.UserEntity;

/**
 * @author Ramachandran R
 * 
 */
@Component("JobExchangeDto")
public class JobExchangeDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int assinger;
	private int assingee;
	
	private UserEntity assignerUserEntity;
	private UserEntity assigneeUserEntity;
	private JobEntity jobEntity;
	public int getAssinger() {
		return assinger;
	}
	public void setAssinger(int assinger) {
		this.assinger = assinger;
	}
	public int getAssingee() {
		return assingee;
	}
	public void setAssingee(int assingee) {
		this.assingee = assingee;
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
