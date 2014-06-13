package com.medialounge.reevo.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medialounge.reevo.service.UserService;

@Service("monitorUtil")
public class MonitorUtil {
	
	@Autowired
	UserService userService;
	
	public void monitorPerModule(int userId, String newModuleId, HttpServletRequest request, HttpSession session) {
		String msg = "";
		int oldModuleId = 0;
		try {
			// getting current time
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = formatter.format(new Date()); 
			Date currnetDate = formatter.parse(date);
			// getting previous time
			Date startDate = (Date) request.getSession().getAttribute("PREVIOUS_START_DATE");
			if (startDate != null) {
				oldModuleId = Integer.parseInt((String) request.getSession().getAttribute("PREVIOUS_MODULE_ID"));
				// if same module clicked second time no need to update time
				if(oldModuleId != Integer.parseInt(newModuleId)) {
					msg = userService.getMonitorExistingUsers(userId, oldModuleId, startDate, currnetDate);
				}
			}
			// checking condition because if you click same module twice it should take first click start time
			if(oldModuleId != Integer.parseInt(newModuleId)) {
				// setting module id
				session.setAttribute("PREVIOUS_MODULE_ID", newModuleId);
				// setting current time
				session.setAttribute("PREVIOUS_START_DATE", currnetDate);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
