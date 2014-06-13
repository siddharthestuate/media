package com.medialounge.reevo.service;

import java.util.ArrayList;

import com.medialounge.reevo.dto.FeedbackDto;

public interface FeedbackService {
	public void submitNewFeedBack(String color, String keyword, int mediaId,int userId,String description) throws Exception;
	public ArrayList<FeedbackDto> getPreviousFeedback(int mediaId) throws Exception;
	public ArrayList<FeedbackDto> getAllMediaFeedbackDetailsOfParticularUser(int userId) throws Exception;
}
