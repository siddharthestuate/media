package com.medialounge.reevo.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.FeedbackDao;
import com.medialounge.reevo.dto.FeedbackDto;
import com.medialounge.reevo.service.FeedbackService;

@Service("feedbackService") 
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	FeedbackDao feedbackDao;
	
	
	@Override
	public void submitNewFeedBack(String color, String keyword, int mediaId,int userId,String description) throws Exception {
		// TODO Auto-generated method stub
		feedbackDao.submitNewFeedBack(color, keyword, mediaId,userId,description);
	}
	public ArrayList<FeedbackDto> getPreviousFeedback(int mediaId) throws Exception {
		return feedbackDao.getPreviousFeedback(mediaId);
	}
	public ArrayList<FeedbackDto> getAllMediaFeedbackDetailsOfParticularUser(int userId) throws Exception{
		return feedbackDao.getAllMediaFeedbackDetailsOfParticularUser(userId);
	}
}
