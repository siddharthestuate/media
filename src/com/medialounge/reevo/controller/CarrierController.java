package com.medialounge.reevo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.medialounge.reevo.dto.CarrierDTO;
import com.medialounge.reevo.form.CarrierForm;
import com.medialounge.reevo.service.CarrierService;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
public class CarrierController {

	@Autowired
	CarrierService carrierService;
	
	@Autowired
	MonitorUtil monitorUtil;
	
	@Autowired
	CarrierDTO carrierDTO;

	@RequestMapping(value = "/carrierHomePage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView carrierHomePage(
			@ModelAttribute("carrierName") CarrierForm carrierForm,
			ModelMap model, HttpServletRequest request, HttpSession session) {
		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		String newModuleId = request.getParameter("moduleId");
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}
		ArrayList<CarrierDTO> list = carrierService.getCarrierList();
		model.addAttribute("CARRIER_LIST", list);
		return new ModelAndView("carrierHomePage");
	}

	@RequestMapping(value = "/addCarrier", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addCarrier(
			@ModelAttribute("carrierName") CarrierForm carrierForm,
			ModelMap model) {
		return "addCarrier";
	}

	@RequestMapping(value = "/addCarrierPage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String addCarrierPage(ModelMap model, HttpServletRequest request) {
		String msg = "";
		try {
			String industry = request.getParameter("industry");
			String expertise = request.getParameter("expertise");
			int experience = Integer.parseInt(request
					.getParameter("experience"));
			long contact = Long.parseLong(request.getParameter("contact"));

			carrierDTO.setIndustry(industry);
			carrierDTO.setExperience(experience);
			carrierDTO.setExpertise(expertise);
			carrierDTO.setContact(contact);
			msg = carrierService.addCarrier(carrierDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
}
