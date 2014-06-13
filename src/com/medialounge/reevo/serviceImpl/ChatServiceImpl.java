package com.medialounge.reevo.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.ChatDao;
import com.medialounge.reevo.dao.UserDao;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.service.ChatService;
import com.medialounge.reevo.service.UserService;
@Service("chatService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDao chatDao;
	@Override
	public ArrayList getPreviousChats(int loginUserId, int messengerUserId) throws Exception{
		// TODO Auto-generated method stub
		return chatDao.getPreviousChats( loginUserId,  messengerUserId);
	}
	@Override
	public ArrayList previousChatMessages(int userId,int chatUserId) throws Exception {
		// TODO Auto-generated method stub
		
		return chatDao.previousChatMessages(userId, chatUserId);
	}
	@Override
	public ArrayList sendChatMessage(int userId, int chatUserId, String chatMessageText) throws Exception {
		// TODO Auto-generated method stub
		return chatDao.sendChatMessage(userId, chatUserId,chatMessageText);
	}
	@Override
	public String getTotalUnreadChatMessageCount(int userId) throws Exception {
		// TODO Auto-generated method stub
		return chatDao.getTotalUnreadChatMessageCount( userId);
	}

	
}
