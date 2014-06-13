package com.medialounge.reevo.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.JobDAO;
import com.medialounge.reevo.dto.JobDTO;
import com.medialounge.reevo.dto.JobExchangeDto;
import com.medialounge.reevo.dto.JobFormDto;
import com.medialounge.reevo.dto.JobTypeDto;
import com.medialounge.reevo.service.JobService;

@Service("jobService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class JobServiceImpl implements JobService {

	@Autowired
	JobDAO jobDAO;

	@Override
	public ArrayList<JobDTO> getAllJobsList(int userId, String type) throws Exception {
		return jobDAO.getAllJobsList(userId, type);
	}

	@Override
	public ArrayList<JobDTO> getAllJobType() throws Exception {
		return jobDAO.getAllJobType();
	}

	@Override
	public String addJob(JobDTO jobDTO) throws Exception {
		return jobDAO.addJob(jobDTO);
	}

	@Override
	public ArrayList<JobDTO> getJobListByType(int jobTypeId) throws Exception {
		return jobDAO.getJobListByType(jobTypeId);
	}

	@Override
	public String addJobFormDetails(int userId, int jobId, String jobStatus,
			String skill, String docPath)  throws Exception{
		return jobDAO.addJobFormDetails(userId, jobId, jobStatus, skill,
				docPath);
	}

	@Override
	public ArrayList<JobFormDto> getAllPostedJobs(int jobId, String jobTitle) throws Exception {
		return jobDAO.getAllPostedJobs(jobId, jobTitle);
	}

	@Override
	public String getJobApplyStatus(int jobId, String jobTitle, String loginUser) {
		return jobDAO.getJobApplyStatus(jobId, jobTitle, loginUser);
	}

	@Override
	public ArrayList<JobDTO> getJobsForCurrentUser(int userId) throws Exception {
		return jobDAO.getJobsForCurrentUser(userId);
	}

	@Override
	public ArrayList<JobDTO> getJobDetails(int jobId) throws Exception {
		return jobDAO.getJobDetails(jobId);
	}

	@Override
	public ArrayList<JobTypeDto> getJobTypeForAdmin() throws Exception{

		return jobDAO.getJobTypeForAdmin();
	}

	@Override
	public ArrayList<JobTypeDto> deleteJobType(String jobTypeId) throws Exception{

		return jobDAO.deleteJobType(jobTypeId);
	}

	@Override
	public ArrayList<JobTypeDto> addJobType(JobTypeDto jobTypeDto) throws Exception{

		return jobDAO.addJobType(jobTypeDto);
	}

	@Override
	public String jobExchangeAssigned(JobExchangeDto jobExchangeDto) throws Exception {
		return jobDAO.jobExchangeAssigned(jobExchangeDto);
	}

	@Override
	public ArrayList<JobExchangeDto> jobExachangeMyJob(int userId, String type) throws Exception {
		return jobDAO.jobExachangeMyJob(userId, type);
	}

}
