package com.medialounge.reevo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerAdvice {

	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e, HttpServletRequest request) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("loginUser");
		mav.addObject("name", e.getClass().getSimpleName());
		mav.addObject("message", "Error Occured, Please Contact Administrator");

		return mav;
	}

}
