package com.medialounge.reevo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.medialounge.reevo.dto.MessageDTO;
import com.medialounge.reevo.form.MessageForm;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.MessageService;
import com.medialounge.reevo.service.UserService;
import com.medialounge.reevo.serviceImpl.UserServiceImpl;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
	@Autowired
	UserService userService;
	@Autowired
	MessageDTO messageDTO;
	@Autowired
	MonitorUtil monitorUtil;
// Vishal's Method for Meessages
	@RequestMapping(value = "/Messages", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String Messages(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpSession session) {
		//System.out.println("Messages");
		String userId = request.getParameter("userId");
		List users = new ArrayList();
		users = messageService.getUsers(userId);
		model.addAttribute("loginUser", userId);
		model.addAttribute("user", users);
		
		// monitor start
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if(newModuleId!=null) {
			monitorUtil.monitorPerModule(Integer.parseInt(userId), newModuleId, request, session);
		}
		// moitor end
		/*return "Messages";*/
		return "newMessage";

	}
	
	
	
	@RequestMapping(value = "/getMessagedFriend", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getMessagedFriend(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		//System.out.println("getMessagedFriend");
		String userId = request.getParameter("loginUser");
		List users = new ArrayList();
		users = messageService.getUsers(userId);
		model.addAttribute("loginUser", userId);
		model.addAttribute("user", users);
		return "messagesFriend";
	}
	
	@RequestMapping(value = "/getUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody List getUser(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
	//	System.out.println("getusers");
		String userId = request.getParameter("loginUser");
		List users = new ArrayList();
		users = messageService.getUsers(userId);
		model.addAttribute("loginUser", userId);
		model.addAttribute("user", users);
		request.setAttribute("user", users);
		return users;
	}

	@RequestMapping(value = "/getUserMessage123", method =RequestMethod.GET)
	public String getUserMessage(@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model, HttpServletRequest request,HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		try{
			//System.out.println("getUserMessage ==>" );
			String loginUser = request.getParameter("loginUser");
			String messageFrom = request.getParameter("messageFrom");
			Map messages = new HashMap();
			messages = messageService.listMessages(loginUser, messageFrom);
			model.addAttribute("mappedList", messages);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("messageFrom", messageFrom);
		}catch(Exception e){
			//System.out.println("getUserMessage Exception ==>" );
			e.printStackTrace();
		}
		
		return "chatMessages";
	}

	@RequestMapping(value = "/saveUserMessage", method = RequestMethod.GET)
	public @ResponseBody
	String saveUserMessage(
			@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model) {
		try {
			String message = "";
			//System.out.println("saveUserMessage");
			if (messageForm.getDescription().trim().equalsIgnoreCase("")) {
				//System.out.println("");
			} else {
				MessageDTO messageDto = new MessageDTO();
				BeanUtils.copyProperties(messageDto, messageForm);
				message = messageService.saveMessage(messageDto);
			}
			return message;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/*@RequestMapping(value = "/saveUserMessage", method = RequestMethod.GET)
	public String saveUserMessage(
			@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model) {
		try {
			String message = "";
			System.out.println("saveUserMessage");
			if (messageForm.getDescription().trim().equalsIgnoreCase("")) {
				System.out.println("");
			} else {
				MessageDTO messageDto = new MessageDTO();
				BeanUtils.copyProperties(messageDto, messageForm);
				messageService.saveMessage(messageDto);
				
			}
			return "forward";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}*/

	@RequestMapping(value = "/getFriendMessageCount", method = RequestMethod.GET)
	public @ResponseBody
	String getFriendMessageCount(
			@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		try {
		//	System.out.println("getFriendMessageCount");
			String userId = (String) request.getParameter("user");
			String loginUser = (String) request.getParameter("loginUser");
			String message = messageService.getFriendMessageCount(userId,
					loginUser);
			return message;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "/viewFrndMsg", method = RequestMethod.GET)
	public @ResponseBody
	String viewFrndMsg(
			@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		try {
			//System.out.println("viewFrndMsg");
			String messageTo = request.getParameter("loginUser");
			String messageFrom = request.getParameter("messageFrom");
			String message = messageService.viewFrndMsg(messageTo, messageFrom);
			return message;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "/userMessageCount", method = RequestMethod.GET)
	public @ResponseBody
	String userMessageCount(
			@ModelAttribute("messageForm") MessageForm messageForm,
			ModelMap model, HttpServletRequest request, HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		try {
			System.out.println("userMessageCount");
			String userId = (String) request.getParameter("loginUser");
			System.out.println(userId);
			String message = messageService.userMessageCount(userId);
			return message;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value = "/getFriendContactList", method =RequestMethod.GET)
	public String getFriendContactList(@ModelAttribute("userForm") UserForm userForm,
			ModelMap model, HttpServletRequest request,HttpServletResponse httpResponse) {
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
		httpResponse.setDateHeader("Expires", 0);
		try{
			System.out.println("getFriendContactList ==>" );
			String loginUser = request.getParameter("loginUser");
			List contacts = new ArrayList();
			int i = Integer.parseInt(loginUser);
			contacts = userService.getContacts(i);
			System.out.println();
			model.addAttribute("friendList", contacts);
			model.addAttribute("loginUser", loginUser);
		}catch(Exception e){
			System.out.println("getUserMessage Exception ==>" );
			e.printStackTrace();
		}
		
		return "friendListMessage";
	}

}
