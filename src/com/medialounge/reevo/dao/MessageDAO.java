package com.medialounge.reevo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.medialounge.reevo.dto.MessageDTO;

public interface MessageDAO {

	public List getUsers(String userId);
	
	public Map listMessages(String loginUser, String messageFrom);
	
	public String getFriendMessageCount(String userId, String loginUser);
	
	public String viewFrndMsg(String messageTo, String messageFrom);
	
	public String userMessageCount(String userId);

	public String saveMessage(MessageDTO messageDto);

	public ArrayList<String> getSpotLightDetails(int userId);
	
	/*public void saveMessage(MessageDTO messageDto);*/
}
