package com.medialounge.reevo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medialounge.reevo.dto.FeedbackDto;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.FeedbackService;
import com.medialounge.reevo.service.MediaService;

@Controller
//@SessionAttributes("userSession")
public class FeedbackController {
	private static final Logger logger = Logger.getLogger(FeedbackController.class);
	@Autowired
	MediaService mediaService;
	@Autowired
	FeedbackService feedbackService;
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/mediaFeedBackHome", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mediaFeedBackHome(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception  {
		try{
			String mediaId = request.getParameter("mediaId");
			List<MediaDto> mediaDetails = new ArrayList<MediaDto>();
			
			mediaDetails = mediaService.getMediaDetails(Integer.parseInt(mediaId));
			model.addAttribute("mediaDetails",
					mediaDetails);
			model.addObject("mediaDetails",
					mediaDetails);
			ArrayList<FeedbackDto> previousFeedbackOfParticularMedia = feedbackService.getPreviousFeedback(Integer.parseInt(request.getParameter("mediaId")));
			
			model.addObject("previousFeedbackOfParticularMedia", previousFeedbackOfParticularMedia);
			model.addAttribute("previousFeedbackOfParticularMedia", previousFeedbackOfParticularMedia);
			
			 String uploadTime = mediaDetails.get(0).getCreated();//"2014-01-31 05:17:35.0";
			 SimpleDateFormat uploadedDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        Date uploadedDate = uploadedDateFormat.parse(uploadTime);
		        
		        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        Date currentDate = new Date();
		        
		        long milliSec1 = uploadedDate.getTime();
		        long milliSec2 = currentDate.getTime();
		        long timeDifInMilliSec;
		        if(milliSec1 >= milliSec2) {
		            timeDifInMilliSec = milliSec1 - milliSec2;
		        }
		        else {
		            timeDifInMilliSec = milliSec2 - milliSec1;
		        }
		 
		        long timeDifSeconds = timeDifInMilliSec / 1000;
		        long timeDifMinutes = timeDifInMilliSec / (60 * 1000);
		        long timeDifHours = timeDifInMilliSec / (60 * 60 * 1000);
		        long timeDifDays = timeDifInMilliSec / (24 * 60 * 60 * 1000);
		       
	        
	        if(timeDifDays > 1){
	        	model.addObject("timeSincePost", timeDifDays+" days ago");
				model.addAttribute("timeSincePost", timeDifDays+" days ago");
	        }else if(timeDifHours > 1){
	        	model.addObject("timeSincePost", timeDifHours+" hours ago");
				model.addAttribute("timeSincePost", timeDifHours+" hours ago");
	        }else if(timeDifMinutes > 1){
	        	model.addObject("timeSincePost", timeDifMinutes+" minutes ago");
				model.addAttribute("timeSincePost", timeDifMinutes+" minutes ago");
	        }else {
	        	model.addObject("timeSincePost", timeDifSeconds+" seconds ago");
				model.addAttribute("timeSincePost", timeDifSeconds+" seconds ago");
	        }
		
		}catch(Exception e){
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "mediaFeedBackHome";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/submitNewFeedBack", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String submitNewFeedBack(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		try{
			feedbackService.submitNewFeedBack(request.getParameter("color"),request.getParameter("keyword"),Integer.parseInt(request.getParameter("mediaId")),
				Integer.parseInt((String) request.getSession().getAttribute("userSessionId")),request.getParameter("description"));
		
			List<MediaDto> mediaDetails = new ArrayList<MediaDto>();
			mediaDetails = mediaService.getMediaDetails(Integer.parseInt(request.getParameter("mediaId")));
			model.addAttribute("mediaDetails",mediaDetails);
			model.addObject("mediaDetails",mediaDetails);
			ArrayList<FeedbackDto> previousFeedbackOfParticularMedia = feedbackService.getPreviousFeedback(Integer.parseInt(request.getParameter("mediaId")));
			model.addObject("previousFeedbackOfParticularMedia", previousFeedbackOfParticularMedia);
			model.addAttribute("previousFeedbackOfParticularMedia", previousFeedbackOfParticularMedia);
	        long milliSec1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse( mediaDetails.get(0).getCreated()).getTime();
	        long milliSec2 = new Date().getTime();
	        long timeDifInMilliSec;
	        if(milliSec1 >= milliSec2){
	            timeDifInMilliSec = milliSec1 - milliSec2;
	        }
	        else{
	            timeDifInMilliSec = milliSec2 - milliSec1;
	        }
	        long timeDifSeconds = timeDifInMilliSec / 1000;
	        long timeDifMinutes = timeDifInMilliSec / (60 * 1000);
	        long timeDifHours = timeDifInMilliSec / (60 * 60 * 1000);
	        long timeDifDays = timeDifInMilliSec / (24 * 60 * 60 * 1000);
        if(timeDifDays > 1){
        	model.addObject("timeSincePost", timeDifDays+" days ago");
			model.addAttribute("timeSincePost", timeDifDays+" days ago");
        }else if(timeDifHours > 1){
        	model.addObject("timeSincePost", timeDifHours+" hours ago");
			model.addAttribute("timeSincePost", timeDifHours+" hours ago");
        }else if(timeDifMinutes > 1){
        	model.addObject("timeSincePost", timeDifMinutes+" minutes ago");
			model.addAttribute("timeSincePost", timeDifMinutes+" minutes ago");
        }else {
        	model.addObject("timeSincePost", timeDifSeconds+" seconds ago");
			model.addAttribute("timeSincePost", timeDifSeconds+" seconds ago");
        }
        
		}catch(Exception e){
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return"updateMediaFeedbackHome";
		
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getMediaFeedbackDetails", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getMediaFeedbackDetails(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		
		try {
			ArrayList<FeedbackDto> allMediaFeedbackDetailsOfParticularUser = new ArrayList<FeedbackDto>();
			allMediaFeedbackDetailsOfParticularUser = feedbackService.getAllMediaFeedbackDetailsOfParticularUser(Integer.parseInt((String) request.getSession().getAttribute("userSessionId")));
			model.addObject("allMediaFeedbackDetailsOfParticularUser", allMediaFeedbackDetailsOfParticularUser);
			model.addAttribute("allMediaFeedbackDetailsOfParticularUser", allMediaFeedbackDetailsOfParticularUser);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "mediaFeedbackDetailsInner";
	}
}
