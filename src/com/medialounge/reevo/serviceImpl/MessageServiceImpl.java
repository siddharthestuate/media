package com.medialounge.reevo.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.MessageDAO;
import com.medialounge.reevo.dto.MessageDTO;
import com.medialounge.reevo.service.MessageService;

@Service("messageService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDAO messageDao;

	@Override
	public List getUsers(String userId) {

		return messageDao.getUsers(userId);
	}

	@Override
	public Map listMessages(String loginUser, String messageFrom) {

		return messageDao.listMessages(loginUser, messageFrom);
	}

	@Override
	public String getFriendMessageCount(String userId, String loginUser) {

		return messageDao.getFriendMessageCount(userId, loginUser);
	}

	@Override
	public String viewFrndMsg(String messageTo, String messageFrom) {

		return messageDao.viewFrndMsg(messageTo, messageFrom);
	}

	@Override
	public String userMessageCount(String userId) {

		return messageDao.userMessageCount(userId);
	}

	/*@Override
	public void saveMessage(MessageDTO messageDto) {
		
		 messageDao.saveMessage(messageDto);
	}*/

	@Override
	public String saveMessage(MessageDTO messageDto) {

		return messageDao.saveMessage(messageDto);
	}
	
}
