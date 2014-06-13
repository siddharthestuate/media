package com.medialounge.reevo.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.medialounge.reevo.dto.JobDTO;
import com.medialounge.reevo.dto.JobExchangeDto;
import com.medialounge.reevo.dto.JobFormDto;
import com.medialounge.reevo.dto.JobTypeDto;
import com.medialounge.reevo.dto.UploadDto;
import com.medialounge.reevo.entity.JobEntity;
import com.medialounge.reevo.entity.JobTypeEntity;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.form.JobForm;
import com.medialounge.reevo.service.JobService;
import com.medialounge.reevo.serviceImpl.MediaHelpler;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
//@SessionAttributes("userSession")
public class JobController {
	
	private static Logger logger = Logger.getLogger(JobController.class);

	@Autowired
	JobService jobService;
	@Autowired
	JobDTO jobDTO;
	
	
	@Autowired
	JobFormDto jobFormDto;
	
	@Autowired
	JobExchangeDto jobExchangeDto;
		
	@Autowired
	MediaHelpler mediaHelpler;
	
	@Autowired
	MonitorUtil monitorUtil;
	
	UploadDto uploadDto;

	@RequestMapping(value = "/jobHomePage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView jobHomePage(@ModelAttribute("jobName") JobForm jobForm,
			ModelMap model, HttpServletRequest request) {
		return new ModelAndView("jobHomePage");
	}

	@RequestMapping(value = "/getJobTypeList", method = RequestMethod.POST)
	public String getJobTypeList(@ModelAttribute("jobName") JobForm jobForm,
			ModelMap model) throws Exception {
		try {
			ArrayList<JobDTO> list = jobService.getAllJobType();
			model.addAttribute("JOBTYPE_LIST", list);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "getJobTypeList";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/postJob", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String postJob(@ModelAttribute("jobName") JobForm jobForm,
			ModelMap model) throws Exception {
		try {
			ArrayList<JobDTO> list = jobService.getAllJobType();
			model.addAttribute("JOBTYPE_LIST", list);
		} catch(Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "postJob";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/jobHome", method = RequestMethod.POST)
	public @ResponseBody String addJob(@ModelAttribute("jobName") JobForm jobForm, ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		
		String message = "";
		try {
			int jobTypeId = Integer.parseInt(request.getParameter("jobTypeId"));
			String jobTitle = request.getParameter("jobTitle");
			int experience = Integer.parseInt(request.getParameter("experience"));
			String priority = request.getParameter("priority");
			String description = request.getParameter("description");

			JobTypeEntity jobTypeEntity = new JobTypeEntity();
			jobTypeEntity.setJobTypeId(jobTypeId);

			JobDTO jobDTO = new JobDTO();
			jobDTO.setJobTypeEntity(jobTypeEntity);
			jobDTO.setJobTitle(jobTitle);
			jobDTO.setExperience(experience);
			jobDTO.setPriority(priority);
			jobDTO.setDescription(description);

			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			jobDTO.setUserId(userId);
			message = jobService.addJob(jobDTO);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return message;
	}

	/**
	 * [Sentence summarizing the method's purpose and functionality.] [Other
	 * comments describing preconditions, postconditions, algorithm notes, usage
	 * instructions, reminders, etc.]
	 * 
	 * @return [Description of return value]
	 * @exception [Name of exception class and description of the scenario]
	 * @see [String]
	 * @see [URL]
	 * @see [class name#method name]
	 **/
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getJobListByType", method = RequestMethod.POST)
	public String getJobListByType(@ModelAttribute("jobName") JobForm jobForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		try {
			int jobTypeId = Integer.parseInt(request.getParameter("jobType"));
			ArrayList<JobDTO> list = jobService.getJobListByType(jobTypeId);
			model.addAttribute("JOB_LIST", list);
			model.addAttribute("userName",request.getSession().getAttribute("userSession"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("exception");
		}
		return "getJobList";
	}
	
	
	/**
	 * This method is used to forward to featuredJob jsp page.
	 * 
	 * @return [featuredJob jsp page]
	 **/
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/featuredJob", method = { RequestMethod.GET,RequestMethod.POST })
	public String featuredJob(ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
		
		try {
			int userId = Integer.parseInt(request.getSession().getAttribute("userSessionId").toString());
			
			ArrayList<JobDTO> featuredJobList = jobService.getJobsForCurrentUser(userId);
			model.addAttribute("FEATURED_LIST", featuredJobList);    
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "featuredJob";
	}
	
	@RequestMapping(value = "/jobExachangeLoad", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String jobExachangeLoad(ModelMap model, HttpServletRequest request) {
		return "jobExachangeLoad";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getJobList", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView getJobList(@ModelAttribute("jobName") JobForm jobForm,
			ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
		
		try {
			
			int id = Integer.parseInt((String)request.getSession().getAttribute("userSessionId"));
			model.addAttribute("loginUser",request.getSession().getAttribute("userSession"));
			
			String type = request.getParameter("type");
			
			ArrayList<JobDTO> jobList = jobService.getAllJobsList(id, type);		
			model.addAttribute("JOB_LIST", jobList);
			
			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if(newModuleId!=null) {
				monitorUtil.monitorPerModule(id, newModuleId, request, session);
			}
			// moitor end
			
			model.addAttribute("TYPE", type);
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("exception");
		}
		return new ModelAndView("job", "model", model);
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getJobDetails", method = { RequestMethod.GET,RequestMethod.POST })
	public  ModelAndView getJobDetails(@ModelAttribute("jobName") JobForm jobForm ,ModelMap model, HttpServletRequest request,
				HttpSession session) throws Exception {
			ArrayList<JobDTO> jobDetailsArrayList=null;
			try {
				
				int jobId= Integer.parseInt(request.getParameter("jobId"));
				
				logger.info("/getJobDetails-jobId:"+jobId);
				
				jobDetailsArrayList = jobService.getJobDetails(jobId);
				
				model.addAttribute("JOB_DETAILS", jobDetailsArrayList);
				
				model.addAttribute("jobId",jobId);
				
			} catch (Exception e) {
				logger.error("EXCEPTION "+e);
				throw new Exception("Exception");
			}
			return new ModelAndView("jobFormPage", "model", model);
		}
	
	@RequestMapping(value = "/getJobForm", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView getJobForm(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		String str = "";
		try {
			str = (String) session.getAttribute("userSession");

			int jobId = (Integer.parseInt(request.getParameter("jobId")));
			String jobTitle = request.getParameter("jobTitle");
			String jobDesc = request.getParameter("jobDesc");
			
			model.addAttribute("jobId", jobId);
			model.addAttribute("jobTitle", jobTitle);
			model.addAttribute("jobDesc", jobDesc);

		} catch (Exception e) {

		}
		return new ModelAndView("jobFormPage", "model", model);
	}
	
		@ExceptionHandler(Exception.class)
		@RequestMapping(value = "/postJobFormDetails", method = {RequestMethod.POST, RequestMethod.GET })
	    public String postJobFormDetails(@ModelAttribute("jobForm") JobForm jobForm, ModelMap model,MultipartHttpServletRequest request, HttpSession session) throws Exception{

			String loginUser = null;
			try {
				
				loginUser = (String) session.getAttribute("userSession");
				int userId = Integer.parseInt((String) request.getSession().getAttribute("userSessionId"));
				
				List<MultipartFile> files;
				/*if (jobForm.getUploadFile().size() > 0) {*/
					try {
						
						files = new ArrayList<MultipartFile>();
						Iterator<String> itr =  request.getFileNames();		
						MultipartFile mpf = request.getFile(itr.next());
						files.add(mpf);
						uploadDto = mediaHelpler.uploadFiles(userId, files);
						jobFormDto.setDocsPath(uploadDto.getContentPath());
					} catch (Exception f) {
						f.printStackTrace();
						files = null;
					}
				/*}*/

				jobService.addJobFormDetails(userId,
					    Integer.parseInt(request.getParameter("jobId")),
					    request.getParameter("jobStatus"),
					    request.getParameter("skill"),
						jobFormDto.getDocsPath());

			} catch (Exception e) {
				e.printStackTrace();
				logger.error("EXCEPTION "+e);
				throw new Exception("Exception");
			}
			return "redirect:getJobList?type=postId";
		}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/PostedJobViewers", method = {RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getPostedJobs(ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		ArrayList<JobFormDto> postedJobsArr = new ArrayList<JobFormDto>();
		try {
			int jobId = Integer.parseInt(request.getParameter("jobId"));

			String jobTitle = request.getParameter("jobTitle");

			postedJobsArr = jobService.getAllPostedJobs(
					jobId, jobTitle);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("postedJobViewers", "userArrayList",
				postedJobsArr);
	}
	
	@RequestMapping(value = "/downloadDocuments", method = RequestMethod.GET)
	public void downloadDocuments(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {

		String docPath = request.getParameter("doc_path");
		try {
			mediaHelpler.downloadFiles(request, response, docPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getJobType", method = RequestMethod.GET)
	public String getJobType(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception{

		try {
			ArrayList<JobTypeDto> jobTypes = jobService.getJobTypeForAdmin();
			model.addAttribute("JOBTYPES", jobTypes);
			return "adminJobType";
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/deleteJobType", method = RequestMethod.GET)
	public String deleteJobType(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		try {
			String jobTypeId = request.getParameter("jobTypeId");
			ArrayList<JobTypeDto> jobTypes = jobService.deleteJobType(jobTypeId);
			model.addAttribute("JOBTYPES", jobTypes);
			return "adminJobType";
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addJobTypePage", method = RequestMethod.GET)
	public String addJobTypePage(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		try {
			ArrayList<JobTypeDto> jobTypes = jobService.getJobTypeForAdmin();
			model.addAttribute("JOBTYPES", jobTypes);
			return "addJobTypePage";
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addJobType", method = RequestMethod.GET)
	public String addJobType(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		try {
			String jobType = request.getParameter("jobType");
			JobTypeDto jobTypeDto = new JobTypeDto();
			jobTypeDto.setDescription(jobType);
			ArrayList<JobTypeDto> jobTypes = jobService.addJobType(jobTypeDto);
			model.addAttribute("JOBTYPES", jobTypes);
			return "adminJobType";
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/jobExchangeAssigned", method = {RequestMethod.GET, RequestMethod.POST}) 
	public @ResponseBody String jobExchangeAssigned(@ModelAttribute("jobName") JobForm jobForm, ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		
		String message = "";
		try {
			int userId = Integer.parseInt((String) request.getSession().getAttribute("userSessionId"));
			int jobId = Integer.parseInt((String) request.getParameter("job_id"));
			int assignee = Integer.parseInt((String) request.getParameter("assignee_id"));
			
			UserEntity userEntityAssinger = new UserEntity();
			userEntityAssinger.setUserId(userId);
			
			UserEntity userEntityAssingee = new UserEntity();
			userEntityAssingee.setUserId(assignee);
			
			jobExchangeDto = new JobExchangeDto();
			
			jobExchangeDto.setAssignerUserEntity(userEntityAssinger);
			
			jobExchangeDto.setAssigneeUserEntity(userEntityAssingee);
			
			JobEntity jobEntity = new JobEntity();
			jobEntity.setJobId(jobId);

			jobExchangeDto.setJobEntity(jobEntity);
			
			message = jobService.jobExchangeAssigned(jobExchangeDto);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return message;
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/jobExachangeMyJob", method = { RequestMethod.GET,RequestMethod.POST })
	public String jobExachangeMyJob(ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
		
		try {
			int userId = Integer.parseInt(request.getSession().getAttribute("userSessionId").toString());
			String type = request.getParameter("type");
			
			ArrayList<JobExchangeDto> jobExchangeDtos = jobService.jobExachangeMyJob(userId, type);
			
			model.addAttribute("JOB_EXCHNAGE_LIST", jobExchangeDtos);    
			model.addAttribute("TYPE", type);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "jobExchangeMyJob";
	}
}
