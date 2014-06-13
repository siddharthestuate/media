package com.medialounge.reevo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.form.StatusForm;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.StatusService;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
public class StatusController {

	@Autowired
	StatusService statusService;
	@Autowired
	StatusDTO statusDTO;
	@Autowired
	MonitorUtil monitorUtil;
	
	/*@RequestMapping(value = "/getStatusPage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getStatusPage(@ModelAttribute("statusForm") StatusForm statusForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		String userId = (String)request.getParameter("loginUser");
		model.addAttribute("userId",userId);
		return "statusPage";
	}*/
	
	
	
	/*@RequestMapping(value = "/friendsStatus", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String friendsStatus(@ModelAttribute("statusForm") StatusForm statusForm,
			ModelMap model, HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		List<StatusDTO> statusList = new ArrayList<>();
		statusList = statusService.getStatus(userId);
		model.addAttribute("statusList", statusList);
		return "statusListPage";
	}*/
}
