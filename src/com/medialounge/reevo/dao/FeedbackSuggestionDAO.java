package com.medialounge.reevo.dao;

import java.util.List;
import java.util.Map;

public interface FeedbackSuggestionDAO {

	List getFdbSuggList(String loginUser) throws Exception;

	void saveSuggestion(String suggestionId, String feedback,String publish, String keyword) throws Exception;

	void ignoreSuggestion(String suggestionId) throws Exception;
	
	Map blossomSuggestion(String loginUser) throws Exception;

	List getReviewDetails(String reviewId) throws Exception;

	void publishReview(String reviewId) throws Exception;

}
