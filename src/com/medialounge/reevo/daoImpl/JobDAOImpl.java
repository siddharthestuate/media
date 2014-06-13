package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.JobDAO;
import com.medialounge.reevo.dto.JobDTO;
import com.medialounge.reevo.dto.JobExchangeDto;
import com.medialounge.reevo.dto.JobFormDto;
import com.medialounge.reevo.dto.JobTypeDto;
import com.medialounge.reevo.dto.SkillDTO;
import com.medialounge.reevo.entity.JobEntity;
import com.medialounge.reevo.entity.JobExchangeEntity;
import com.medialounge.reevo.entity.JobFormEntity;
import com.medialounge.reevo.entity.JobTypeEntity;
import com.medialounge.reevo.entity.SkillEntity;
import com.medialounge.reevo.entity.UserEntity;

/**
 * The <code>JobDAOImpl</code> class is a part of application programming
 * architecture which holds all the method Definitions which were defined in the
 * JobDAO interface.
 * 
 * @author Anirudhha
 * @Date: Dec 12 2013 12:20 PM
 * @version Revision: $1.1$. {@code} This code is copyright (c) 2013 Estuate
 *          Software Pvt. Ltd.
 **/

@Repository("jobDAO")
public class JobDAOImpl implements JobDAO {
	
	private static Logger logger = Logger.getLogger(JobDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public ArrayList<JobDTO> getAllJobsList(int userId, String type) throws Exception {
		ArrayList<JobDTO> list = new ArrayList<JobDTO>();
		try {
			JobDTO jobDTO = null;
			String hql = "";
			if (type.equals("postId")) {
				hql = "FROM com.medialounge.reevo.entity.JobEntity as j where j.userEntity.userId = "
						+ userId + " ORDER BY j.jobId DESC";
			} else if (type.equals("theBoard")) {
				hql = "FROM com.medialounge.reevo.entity.JobEntity as j where j.userEntity.userId != "
						+ userId + " ORDER BY j.jobId DESC";
			}

			List jobList = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			for (Iterator jobEntityIttr = jobList.iterator(); jobEntityIttr
					.hasNext();) {
				jobDTO = new JobDTO();
				BeanUtils.copyProperties(jobDTO,
						(JobEntity) jobEntityIttr.next());
				list.add(jobDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("exception");
		}
		return list;
	}

	public ArrayList<JobDTO> getAllJobType() throws Exception {
		ArrayList<JobDTO> list = new ArrayList<JobDTO>();
		try {
			JobDTO jobDTO = null;
			List jobList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.JobTypeEntity where deleted is null ORDER BY description ASC")
					.list();
			for (Iterator iterator = jobList.iterator(); iterator.hasNext();) {
				jobDTO = new JobDTO();
				JobTypeEntity job = (JobTypeEntity) iterator.next();
				jobDTO.setJobTypeId(job.getJobTypeId());
				jobDTO.setJobTypeDescription(job.getDescription());
				list.add(jobDTO);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return list;
	}

	public String addJob(JobDTO jobDTO) throws Exception {
		String msg = "Error in Job Add";
		try {
			JobEntity jobEntity = new JobEntity();

			BeanUtils.copyProperties(jobEntity, jobDTO);
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(jobDTO.getUserId());
			jobEntity.setUserEntity(userEntity);

			sessionFactory.getCurrentSession().save(jobEntity);
			msg = "Job Added Successfully";
		} catch (Exception e) {
			msg = "Error in Job Add";
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public ArrayList<JobDTO> getJobListByType(int jobTypeId)  throws Exception{
		ArrayList<JobDTO> list = new ArrayList<JobDTO>();
		try {
			JobDTO jobDTO = null;
			List jobList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.JobEntity as j WHERE j.jobTypeEntity.jobTypeId="
									+ jobTypeId + " ORDER BY j.jobId DESC")
					.list();

			for (Iterator jobEntityIttr = jobList.iterator(); jobEntityIttr
					.hasNext();) {
				jobDTO = new JobDTO();
				BeanUtils.copyProperties(jobDTO,
						(JobEntity) jobEntityIttr.next());
				list.add(jobDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("exception");
		}
		return list;

		/*
		 * ArrayList<JobDTO> list = new ArrayList<JobDTO>(); try { JobDTO jobDTO
		 * = null; List jobList = sessionFactory .getCurrentSession()
		 * .createQuery(
		 * "FROM com.medialounge.reevo.entity.JobEntity as j,  com.medialounge.reevo.entity.JobTypeEntity as jt "
		 * + "where j.jobTypeEntity = jt.jobTypeId AND jt.jobTypeId=" +
		 * jobTypeId + " ORDER BY j.jobId ASC") .list(); Iterator it =
		 * jobList.iterator(); while (it.hasNext()) { int i = 0; Object rows[] =
		 * (Object[]) it.next(); jobDTO = new JobDTO();
		 * jobDTO.setJobId(((JobEntity) rows[i]).getJobId());
		 * jobDTO.setJobTypeDescription(((JobEntity) rows[i])
		 * .getJobTypeEntity().getDescription());
		 * jobDTO.setUserName(((JobEntity) rows[i]).getUserName());
		 * jobDTO.setExperience(((JobEntity) rows[i]).getExperience());
		 * jobDTO.setPriority(((JobEntity) rows[i]).getPriority());
		 * jobDTO.setDescription(((JobEntity) rows[i]).getDescription());
		 * list.add(jobDTO); i++; } } catch (Exception e) { e.printStackTrace();
		 * } return list;
		 */}

	@Override
	public String addJobFormDetails(int userId, int jobId, String jobStatus,
			String skill, String docsPath) throws Exception {
		String msg = null;
		try {

			JobFormEntity jobFormEntity = new JobFormEntity();
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			JobEntity jobEntity = new JobEntity();
			jobEntity.setJobId(jobId);
			jobFormEntity.setDocsPath(docsPath);
			jobFormEntity.setJobId(jobEntity);
			jobFormEntity.setUserId(userEntity);
			jobFormEntity.setJobStatus(jobStatus);
			jobFormEntity.setSkill(skill);

			sessionFactory.getCurrentSession().save(jobFormEntity);
			msg = "success";
		} catch (Exception e) {
			msg = "fail";
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public ArrayList<JobFormDto> getAllPostedJobs(int jobId, String jobTitle) throws Exception {

		ArrayList<JobFormDto> jobformDTOArrraylist = null;
		try {
			String hqlQuery = "FROM com.medialounge.reevo.entity.JobFormEntity j  WHERE j.jobId.jobId= "
					+ jobId;
			@SuppressWarnings("unchecked")
			List<JobFormEntity> jobList = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).list();

			jobformDTOArrraylist = new ArrayList<JobFormDto>();
			for (JobFormEntity jobFormEntity : jobList) {
				JobFormDto jobformDTO = new JobFormDto();

				BeanUtils.copyProperties(jobformDTO, jobFormEntity);
				jobformDTOArrraylist.add(jobformDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return jobformDTOArrraylist;
	}

	@Override
	public String getJobApplyStatus(int jobId, String jobTitle, String loginUser) {

		String hqlQuery = "FROM com.medialounge.reevo.entity.JobFormEntity j  WHERE jobId= "
				+ jobId
				+ " ,jobTitle= \'"
				+ jobTitle
				+ "\'"
				+ "and responseFrom=\'" + loginUser + "\'";
		@SuppressWarnings("unchecked")
		List<JobFormEntity> jobList = sessionFactory.getCurrentSession()
				.createQuery(hqlQuery).list();
		int size = 0;
		String status = null;
		size = jobList.size();
		if (size > 0)
			status = "Applied";
		else
			status = " Not Applied";

		return status;
	}

	@Override
	public ArrayList<JobDTO> getJobDetails(int jobId) throws Exception {
		ArrayList<JobDTO> list = new ArrayList<JobDTO>();
		try {
			JobDTO jobDTO = null;
			String hqlQuery = "FROM com.medialounge.reevo.entity.JobEntity as j WHERE jobId="
					+ jobId;
			List<?> jobList = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).list();
			for (Iterator<?> jobEntityIttr = jobList.iterator(); jobEntityIttr
					.hasNext();) {
				jobDTO = new JobDTO();
				BeanUtils.copyProperties(jobDTO,
						(JobEntity) jobEntityIttr.next());

				list.add(jobDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return list;

	}

	@Override
	public ArrayList<JobDTO> getJobsForCurrentUser(int userId) throws Exception {
		ArrayList<JobDTO> jobsList = new ArrayList<JobDTO>();
		SkillDTO skillDTO2 = new SkillDTO();
		try {
			List skillEntityList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.SkillEntity as s "
									+ " WHERE s.userId.userId = " + userId
									+ " ORDER BY s.skillId DESC").list();

			for (Iterator<SkillEntity> skillEntityIttr = skillEntityList
					.iterator(); skillEntityIttr.hasNext();) {
				SkillDTO skillDto = new SkillDTO();
				BeanUtils.copyProperties(skillDto, skillEntityIttr.next());

				// for getting jobs for a job type
				List jobEntityList = sessionFactory
						.getCurrentSession()
						.createQuery(
								"FROM com.medialounge.reevo.entity.JobEntity as j "
										+ " WHERE j.jobTypeEntity.jobTypeId = "
										+ skillDto.getJobTypeId()
												.getJobTypeId()
										+ " and j.userEntity.userId !=" + userId
										+ " ORDER BY j.jobId DESC").list();

				for (Iterator<JobDTO> jobEntityIttr = jobEntityList.iterator(); jobEntityIttr
						.hasNext();) {
					JobDTO jobDTO = new JobDTO();
					BeanUtils.copyProperties(jobDTO, jobEntityIttr.next());

					jobsList.add(jobDTO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return jobsList;
	}

	@Override
	public ArrayList<JobTypeDto> getJobTypeForAdmin() throws Exception{

		ArrayList<JobTypeDto> jobTypeList = new ArrayList<JobTypeDto>();
		try {
			List<JobTypeEntity> jobTypeEntities = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.JobTypeEntity where deleted is null")
					.list();
			for (JobTypeEntity jobTypeEntity : jobTypeEntities) {
				JobTypeDto jobTypeDto = new JobTypeDto();
				BeanUtils.copyProperties(jobTypeDto, jobTypeEntity);
				jobTypeList.add(jobTypeDto);
			}

		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return jobTypeList;
	}

	@Override
	public ArrayList<JobTypeDto> deleteJobType(String jobTypeId) throws Exception{

		ArrayList<JobTypeDto> jobTypeList = new ArrayList<JobTypeDto>();
		try {
			String hql = "update com.medialounge.reevo.entity.JobTypeEntity set deleted = 'deleted' where jobTypeId= "
					+ jobTypeId;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
			List<JobTypeEntity> jobTypeEntities = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.JobTypeEntity where deleted is null")
					.list();
			for (JobTypeEntity jobTypeEntity : jobTypeEntities) {
				JobTypeDto jobTypeDto = new JobTypeDto();
				BeanUtils.copyProperties(jobTypeDto, jobTypeEntity);
				jobTypeList.add(jobTypeDto);
			}

		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return jobTypeList;
	}

	@Override
	public ArrayList<JobTypeDto> addJobType(JobTypeDto jobTypeDto) throws Exception{

		try {
			JobTypeEntity jobTypeEntity = new JobTypeEntity();
			BeanUtils.copyProperties(jobTypeEntity, jobTypeDto);
			sessionFactory.getCurrentSession().saveOrUpdate(jobTypeEntity);
			ArrayList<JobTypeDto> jobTypeList = new ArrayList<JobTypeDto>();
			List<JobTypeEntity> jobTypeEntities = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.JobTypeEntity where deleted is null")
					.list();
			for (JobTypeEntity jobTypeEntity1 : jobTypeEntities) {
				JobTypeDto jobTypeDto1 = new JobTypeDto();
				BeanUtils.copyProperties(jobTypeDto1, jobTypeEntity1);
				jobTypeList.add(jobTypeDto1);
			}
			return jobTypeList;
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@Override
	public String jobExchangeAssigned(JobExchangeDto jobExchangeDto) throws Exception {
		String msg = "";
		try {
			UserEntity assigner = new UserEntity();
			assigner.setUserId(jobExchangeDto.getAssignerUserEntity()
					.getUserId());

			UserEntity assignee = new UserEntity();
			assignee.setUserId(jobExchangeDto.getAssigneeUserEntity()
					.getUserId());

			JobEntity jobEntity = new JobEntity();
			jobEntity.setJobId(jobExchangeDto.getJobEntity().getJobId());

			JobExchangeEntity jobExchangeEntity = new JobExchangeEntity();
			jobExchangeEntity.setAssignerUserEntity(assigner);
			jobExchangeEntity.setAssigneeUserEntity(assignee);
			jobExchangeEntity.setJobEntity(jobEntity);

			sessionFactory.getCurrentSession().saveOrUpdate(jobExchangeEntity);
			msg = "Success";
		} catch (Exception e) {
			msg = "Failure";
			e.printStackTrace();
			throw new Exception("Exception");
		}

		return msg;
	}

	@Override
	public ArrayList<JobExchangeDto> jobExachangeMyJob(int userId, String type) throws Exception{
		ArrayList<JobExchangeDto> jobExchangeDtos = new ArrayList<JobExchangeDto>();
		JobExchangeDto JobExchangeDto;
		String hql = "";
		
		try {
			if(type.equals("exchangeMyJob")) {
				hql = "from JobExchangeEntity j where j.assigneeUserEntity.userId = "+userId; 
			} else if (type.equals("exchangeTheTable")) {
				hql = "from JobExchangeEntity j where j.assignerUserEntity.userId = "+userId;
			}
			/*hql = "from JobExchangeEntity j where j.assignerUserEntity.userId = "+userId; */
			List list = sessionFactory.getCurrentSession().createQuery(hql).list();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				JobExchangeEntity jobExchangeEntity = (JobExchangeEntity) iterator.next();
				JobExchangeDto = new JobExchangeDto();
				BeanUtils.copyProperties(JobExchangeDto, jobExchangeEntity);
				jobExchangeDtos.add(JobExchangeDto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return jobExchangeDtos;
	}

}
