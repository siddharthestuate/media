package com.medialounge.reevo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.filter.AnnotationTypeFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.medialounge.reevo.entity.TimeSpendsEntity;
/**
 * 
 * @author Ramachandran R
 *
 */
public class GenericInterceptor implements HandlerInterceptor  {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String userId = (String) request.getSession().getAttribute("userSessionId");
		//System.out.println("URI ==> "+request.getRequestURI() + "  ==> " + request.getRequestURL());
		if(userId == null) {
			//System.out.println("login Page " +userId);
			//response.sendRedirect("/MediaLounge/homePage");
		} else {
			//System.out.println("home Page "+userId);
			//response.sendRedirect("newHomePage");
		}
		

		String name = handler.getClass().getName();
		String className = name.substring(name.lastIndexOf(".") + 1);		
		//System.out.println("------------> "+className); //access to the controller class
		
		/*try {

			TimeSpendsEntity entity = new TimeSpendsEntity();
			entity.setValue("hello");
			
			if (className.equalsIgnoreCase("MediaController")) {
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
			} else if (className.equalsIgnoreCase("JobController")) {
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
			} else if (className.equalsIgnoreCase("UserController")) {
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
			} else if (className.equalsIgnoreCase("CarrierController")) {
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
			}		
			
		} catch(Exception e) {
			e.printStackTrace();
		}*/
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("Post-handle");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//System.out.println("After completion handle");
	}
}
