package com.medialounge.reevo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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

import com.medialounge.reevo.dto.ChatDto;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.ChatService;
import com.medialounge.reevo.service.UserService;
import com.medialounge.reevo.util.MonitorUtil;

@Controller
public class ChatController {
	
	private static final Logger logger = Logger.getLogger(ChatController.class);
	
	@Autowired
	UserService userService;
	@Autowired
	ChatService chatService;
	@Autowired
	MonitorUtil monitorUtil;

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/userChatHome", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String userChatHome(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
		
		try {
			
			ArrayList<UserDto> contactList = userService.getContacts(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")));

			ArrayList<UserDto> previousChatsUsers = new ArrayList<UserDto>();
			
			previousChatsUsers = chatService.getPreviousChats(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")), -1);

			model.addObject("contactList", contactList);
			model.addAttribute("contactLists", contactList);
			model.addObject("previousChatsUsers", previousChatsUsers);
			model.addAttribute("previousChatsUsers", previousChatsUsers);
			
			// monitor start
			int userId = Integer.parseInt((String) request.getSession().getAttribute("userSessionId"));
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if(newModuleId!=null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
				
		return "userChatHome";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getPreviousChatsMessages", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String getPreviousChats(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		
		try {
			
			ArrayList<UserDto> contactList = userService.getContacts(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")));
			ArrayList previousChatsUsers = null;

			ArrayList<ChatDto> previousChatMessagesOfPartciularUser = new ArrayList<ChatDto>();
			if (request.getParameter("chatUserId") != null
					&& request.getSession().getAttribute("userSessionId") != null) {
				
				previousChatMessagesOfPartciularUser = chatService
						.previousChatMessages(
								Integer.parseInt((String) request.getSession()
										.getAttribute("userSessionId")),
								Integer.parseInt(request.getParameter("chatUserId")));
				model.addAttribute("previousChatMessagesOfPartciularUser",
						previousChatMessagesOfPartciularUser);
				model.addObject("previousChatMessagesOfPartciularUser",
						previousChatMessagesOfPartciularUser);
			}
			
			previousChatsUsers = chatService.getPreviousChats(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")), Integer.parseInt(request
					.getParameter("chatUserId")));
			
			model.addObject("contactList", contactList);
			model.addAttribute("contactLists", contactList);
			model.addObject("previousChatsUsers", previousChatsUsers);
			model.addAttribute("previousChatsUsers", previousChatsUsers);
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}

		return "userChatHome";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/sendChatMessage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String sendChatMessage(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {

		ArrayList previousChatsUsers = null;
		try {
			
			ArrayList<ChatDto> previousChatMessagesOfPartciularUser = new ArrayList<ChatDto>();
			if (request.getParameter("chatUserId") != null
					&& request.getSession().getAttribute("userSessionId") != null) {
				chatService.sendChatMessage(Integer.parseInt((String) request
						.getSession().getAttribute("userSessionId")), Integer
						.parseInt(request.getParameter("chatUserId")), request
						.getParameter("chatMessageText"));
			}
			ArrayList<UserDto> contactList = userService.getContacts(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")));
			
			previousChatsUsers = chatService.getPreviousChats(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")), Integer.parseInt(request
					.getParameter("chatUserId")));
			
			model.addObject("contactList", contactList);
			model.addAttribute("contactLists", contactList);
			model.addObject("previousChatsUsers", previousChatsUsers);
			model.addAttribute("previousChatsUsers", previousChatsUsers);

			previousChatMessagesOfPartciularUser = chatService
					.previousChatMessages(Integer.parseInt((String) request
							.getSession().getAttribute("userSessionId")), Integer
							.parseInt(request.getParameter("chatUserId")));
			model.addAttribute("previousChatMessagesOfPartciularUser",
					previousChatMessagesOfPartciularUser);
			model.addObject("previousChatMessagesOfPartciularUser",
					previousChatMessagesOfPartciularUser);

			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "userChatHome";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getTotalUnreadChatMessageCount", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String getTotalUnreadChatMessageCount(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		// monitor start
		/*int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}*/
		// moitor end
		
		return chatService.getTotalUnreadChatMessageCount(Integer
				.parseInt((String) request.getSession().getAttribute(
						"userSessionId")));
	}

}
