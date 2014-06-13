package com.medialounge.reevo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medialounge.reevo.dto.SuggestionDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.form.SuggestionForm;
import com.medialounge.reevo.service.SuggestionService;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
public class SuggestionController {

	private static Logger logger = Logger.getLogger(SuggestionController.class);
	static Log log = LogFactory.getLog(SuggestionController.class.getName());
	
	@Autowired
	SuggestionService suggestionService;
	
	@Autowired
	SuggestionDTO suggestionDTO;
	
	@Autowired
	MonitorUtil monitorUtil;


	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/adminFeedBackSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String adminFeedBackSuggestion(@ModelAttribute("suggestionForm") SuggestionForm suggestionForm,
			ModelMap model, HttpServletRequest request, HttpSession session) throws Exception{
		try {
			String type = request.getParameter("type");
			String message = request.getParameter("message");
			String fromUser = request.getParameter("loginUser");
			String toUser = request.getParameter("suggestionTo");
			suggestionDTO.setSuggestionTo(Integer.parseInt(toUser));
			suggestionDTO.setSuggestionType(type);
			suggestionDTO.setDescription(message);
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(Integer.parseInt(fromUser));
			suggestionDTO.setFromUser(userEntity);
			suggestionService.addSuggestion(suggestionDTO);
			
			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if(newModuleId!=null) {
				monitorUtil.monitorPerModule(Integer.parseInt(fromUser), newModuleId, request, session);
			}
			// moitor end
						
			return "success";
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getAdminSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  String getAdminSuggestion(@ModelAttribute("suggestionForm") SuggestionForm suggestionForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			ArrayList<SuggestionDTO> adminSuggestion = null;
			adminSuggestion = (ArrayList<SuggestionDTO>) suggestionService.getAdminSuggestion("1");
			model.addAttribute("adminSuggestion", adminSuggestion);
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "suggestionList";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/viewSuggestionDescription", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  String viewSuggestionDescription(@ModelAttribute("suggestionForm") SuggestionForm suggestionForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			
			String adminSuggestionId = (String) request.getParameter("adminsuggId");
			ArrayList<SuggestionDTO> viewSuggestionList = null;
			viewSuggestionList = (ArrayList<SuggestionDTO>) suggestionService.viewSuggestionDescription(adminSuggestionId);
			
			String userId = (String) request.getSession().getAttribute("userSessionId");
			ArrayList<UserDto> loginUserList = null;
			loginUserList = (ArrayList<UserDto>) suggestionService.getLoginUserDetails(userId);
			for (UserDto userDto : loginUserList) {
				for (SuggestionDTO suggestionDTO : viewSuggestionList) {
					 double earthRadius = 3958.75;
					 double dLat = Math.toRadians(userDto.getLatitude()-(suggestionDTO.getFromUser()).getLatitude());
					 double dLng = Math.toRadians(userDto.getLongitude()-(suggestionDTO.getFromUser()).getLongitude());
					 double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
				               Math.cos(Math.toRadians((suggestionDTO.getFromUser()).getLatitude())) * Math.cos(Math.toRadians(userDto.getLatitude())) *
				               Math.sin(dLng/2) * Math.sin(dLng/2);
					 double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
					 double dist = earthRadius * c;
   				     int meterConversion = 1609;
   				     long distance1 = (long) (dist * meterConversion);
   				     double d = (double)distance1/1000;
   				     String distance = d +"KM";
   				     model.addAttribute("DISTANCE", distance);
				}
			}
			
			model.addAttribute("VIEW_SUGGESTION", viewSuggestionList);
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "viewUserSuggestion";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/deleteAdminSuggestion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  String deleteAdminSuggestion(@ModelAttribute("suggestionForm") SuggestionForm suggestionForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			
			String adminSuggestionId = (String) request.getParameter("adminsuggId");
			suggestionService.deleteAdminSuggestion(adminSuggestionId);
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "forward:/getAdminSuggestion";
	}


}
