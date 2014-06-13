package com.medialounge.reevo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medialounge.reevo.dto.FeedbackSuggestionDTO;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.form.FeedbackSuggestionForm;
import com.medialounge.reevo.service.FeedbackSuggestionService;
import com.medialounge.reevo.serviceImpl.MediaHelpler;


@Controller
public class FeedbackSuggestionController {
	
	private static final Logger logger = Logger.getLogger(FeedbackSuggestionController.class);
	
	@Autowired
	FeedbackSuggestionService feedbackSuggestionService;
	
	@Autowired
	FeedbackSuggestionDTO feedbackSuggestionDTO;
	
	@Autowired
	MediaHelpler mediaHelpler;
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/suggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  String suggestion(@ModelAttribute("feedbackForm") FeedbackSuggestionForm feedbackForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		try {
			String loginUser = request.getParameter("loginUser");
			BeanUtils.copyProperties(feedbackSuggestionDTO,feedbackForm);
			List suggestionList = new ArrayList();
			suggestionList = feedbackSuggestionService.getFdbSuggList(loginUser);
			model.addAttribute("suggestionList", suggestionList);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("exception");
		}
		return "newSuggestion";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String saveSuggestion(@ModelAttribute("feedbackForm") FeedbackSuggestionForm feedbackForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String suggestionId = request.getParameter("suggestionId");
			String feedback = request.getParameter("feedback");
			String publish = request.getParameter("publish");
			String keyword = request.getParameter("key_word");
			if(publish.equals("true")){
				publish = "Y";
				feedbackSuggestionService.saveSuggestion(suggestionId,feedback,publish,keyword);
			}
			else{
				publish = "N";
				feedbackSuggestionService.saveSuggestion(suggestionId,feedback,publish,keyword);
			}
			
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/ignoreSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String ignoreSuggestion(@ModelAttribute("feedbackForm") FeedbackSuggestionForm feedbackForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String suggestionId = request.getParameter("suggestionId");
			feedbackSuggestionService.ignoreSuggestion(suggestionId);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}
	
	@RequestMapping(value = "/downloadSuggestionFiles",method = {RequestMethod.GET, RequestMethod.POST})
	public String downloadSuggestionFiles(HttpServletRequest request, HttpServletResponse response)  {
		
		String mediaPath = request.getParameter("mediaPath");
		
		try {
			mediaHelpler.downloadFiles(request, response, mediaPath);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/blossomSuggestion", method = { RequestMethod.GET, RequestMethod.POST })
	public String blossomSuggestion(ModelMap model, HttpServletRequest request) throws Exception  {
		
		try {
			String loginUser = (String) request.getSession().getAttribute("userSessionId");
			Map blossom = new HashMap();
			blossom = feedbackSuggestionService.blossomSuggestion(loginUser);
			ArrayList<MediaDto> mediaListOfUser = new ArrayList<MediaDto>();
			ArrayList<MediaReviewDTO> reviewList = new ArrayList<MediaReviewDTO>();
			mediaListOfUser = (ArrayList<MediaDto>) blossom.get("MEDIA");
			reviewList = (ArrayList<MediaReviewDTO>) blossom.get("REVIEW");
			model.addAttribute("REVIEWLIST", reviewList);
			model.addAttribute("MEDIALIST", mediaListOfUser);
			model.addAttribute("LENGTH", reviewList.size());
		} catch(Exception e) {
			throw new Exception("this is io exception");
		}
		return "blossomHome";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/reviewSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String reviewSuggestion(ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String reviewId = request.getParameter("reviewId");
			List<MediaReviewDTO> suggestionList = new ArrayList<MediaReviewDTO>();
			suggestionList = feedbackSuggestionService.getReviewDetails(reviewId);
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			for (MediaReviewDTO mediaReviewDTO : suggestionList) {
				Date d = formatter.parse((mediaReviewDTO.getMediaId()).getCreated());
				long diffTime = date.getTime() - d.getTime();
				long sec = diffTime / 1000;
				if (sec > 60) {
					long min = sec / 60;
					if (min > 60) {
						long hr = min / 60;
						if (hr > 24) {
							long day = hr / 24;
							if (day > 30) {
								long month = day / 30;
								if (month > 12) {
									int yr = (int) (month / 12);
									String years = yr + " years ago";
									(mediaReviewDTO.getMediaId()).setCreated(years);
								} else {
									String months = month + " months ago";
									(mediaReviewDTO.getMediaId()).setCreated(months);
								}
							} else {
								String days = day + " days ago";
								(mediaReviewDTO.getMediaId()).setCreated(days);
							}
						} else {
							String hour = hr + " hour ago";
							(mediaReviewDTO.getMediaId()).setCreated(hour);
						}
					} else {
						String minute = min + " mins ago";
						(mediaReviewDTO.getMediaId()).setCreated(minute);
					}
				} else {
					String seconds = sec + " secs ago";
					(mediaReviewDTO.getMediaId()).setCreated(seconds);
				}
			}
			model.addAttribute("REVIEWDETAILS", suggestionList);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "reviewDetails";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/viewReview", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  String viewReview(ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String reviewId = request.getParameter("reviewId");
			List<MediaReviewDTO> suggestionList = new ArrayList<MediaReviewDTO>();
			suggestionList = feedbackSuggestionService.getReviewDetails(reviewId);
			model.addAttribute("REVIEWDETAILS", suggestionList);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "viewReviewDetails";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/publishReview", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody  String publishReview(ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String reviewId = request.getParameter("reviewId");
			feedbackSuggestionService.publishReview(reviewId);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}
}
