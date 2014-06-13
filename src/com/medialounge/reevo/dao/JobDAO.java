package com.medialounge.reevo.dao;

import java.util.ArrayList;

import com.medialounge.reevo.dto.JobDTO;
import com.medialounge.reevo.dto.JobExchangeDto;
import com.medialounge.reevo.dto.JobFormDto;
import com.medialounge.reevo.dto.JobTypeDto;

public interface JobDAO {

	ArrayList<JobDTO> getAllJobsList(int userId, String type) throws Exception;

	ArrayList<JobDTO> getAllJobType() throws Exception;

	String addJob(JobDTO jobDTO) throws Exception;

	ArrayList<JobDTO> getJobListByType(int jobTypeId) throws Exception;

	ArrayList<JobDTO> getJobsForCurrentUser(int userId) throws Exception;

	String addJobFormDetails(int userId, int jobId, String jobStatus,
			String skill, String docPath) throws Exception;

	ArrayList<JobFormDto> getAllPostedJobs(int jobId, String jobTitle) throws Exception;

	String getJobApplyStatus(int jobId, String jobTitle, String loginUser);

	ArrayList<JobDTO> getJobDetails(int jobId) throws Exception;
	
	ArrayList<JobTypeDto> getJobTypeForAdmin() throws Exception;

	ArrayList<JobTypeDto> deleteJobType(String jobTypeId) throws Exception;

	ArrayList<JobTypeDto> addJobType(JobTypeDto jobTypeDto) throws Exception;

	String jobExchangeAssigned(JobExchangeDto jobExchangeDto) throws Exception;

	ArrayList<JobExchangeDto> jobExachangeMyJob(int userId, String type) throws Exception;

}
