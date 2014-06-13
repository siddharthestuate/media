package com.medialounge.reevo.dao;

import java.util.ArrayList;

public interface ChatDao {
	public ArrayList getPreviousChats(int loginUserId, int messengerUserId) throws Exception;
	public ArrayList previousChatMessages(int userId,int chatUserId) throws Exception;
	public ArrayList sendChatMessage(int userId, int chatUserId, String chatMessageText) throws Exception;
	public String getTotalUnreadChatMessageCount(int userId) throws Exception;
}
