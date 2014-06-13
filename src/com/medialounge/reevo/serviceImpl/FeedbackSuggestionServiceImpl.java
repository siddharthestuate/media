package com.medialounge.reevo.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.FeedbackSuggestionDAO;
import com.medialounge.reevo.service.FeedbackSuggestionService;

@Service("feedbackSuggestionService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class FeedbackSuggestionServiceImpl implements FeedbackSuggestionService {

	@Autowired
	FeedbackSuggestionDAO feedbackSuggestionDao;
	
	@Override
	public List getFdbSuggList(String loginUser) throws Exception {

		return feedbackSuggestionDao.getFdbSuggList(loginUser);
	}

	@Override
	public void saveSuggestion(String suggestionId, String feedback,String publish,String keyword) throws Exception{
		
		feedbackSuggestionDao.saveSuggestion(suggestionId,feedback,publish,keyword);
		
	}

	@Override
	public void ignoreSuggestion(String suggestionId) throws Exception{

		feedbackSuggestionDao.ignoreSuggestion(suggestionId);
	}

	@Override
	public Map blossomSuggestion(String loginUser) throws Exception {
		
		return feedbackSuggestionDao.blossomSuggestion(loginUser);
	}

	@Override
	public List getReviewDetails(String reviewId) throws Exception{
		
		return feedbackSuggestionDao.getReviewDetails(reviewId);
	}

	@Override
	public void publishReview(String reviewId) throws Exception{

		feedbackSuggestionDao.publishReview(reviewId);
	}

	
}
