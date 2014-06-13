package com.medialounge.reevo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.dto.UserFeedbackDTO;

/*
 *  @author Ramachandran R
 */

public interface MediaDao {

	public ArrayList<MediaDto> listOfMedias(MediaDto mediaDto) throws Exception;

	public ArrayList<MediaDto> listOfSocialMedias(MediaDto mediaDto) throws Exception;

	public String saveMedia(MediaDto mediaDto, int userId) throws Exception;

	public ArrayList<MediaDto> searchBasedOnMediaType(String mediaSearchKey,String type, int userId) throws Exception;

	//public ArrayList<MediaDto> addMediaComment(MediaDto mediaDto);

	//public List<MediaDto> listOfComments(List<MediaDto> mediaDtos);

	//public void addMediaAccessUser(MediaDto mediaDto);

	//public ArrayList<MediaDto> listOfAccessUser(MediaDto mediaDto);

	//public String checkNumber(String number);

	//public void savePaidContent(MediaDto mediaDto);

	public ArrayList<UserDto> getExpert(String userId);

	public boolean saveCommentsToExpert(UserDto userDto);

	public ArrayList<UserDto> viewCommantsList(String mediaId);

	public String saveUserComment(MediaReviewDTO mediaReviewDTO) throws Exception;

	public Map getSpotLightDetails(String userId) throws Exception;

	public List<UserDto> getExpertCommentsList(String mediaId, String expertType);

	public List<MediaDto> getListOfKeys(int userId) throws Exception;

	public ArrayList<UserFeedbackDTO> getFeedbackByMediaId(int mediaId);

	public String saveFeedback(UserFeedbackDTO feedbackDTO);

	public List<MediaDto> listOfMediasFMF(MediaDto mediaDto) throws Exception;

	public Map getCharts() throws Exception;

	public Map loadPopularVideos() throws Exception;

	public String mediasUpdateRating(int mediaId, int ratingCurrentValue,
			int countOfUsersRated, double ratingAverage) throws Exception ;

	public MediaDto mediasGetRating(String mediaId) throws Exception;

	public List<MediaDto> feedBackKeys(int mediaId);

	public int fmfActivation(int userId, int mediaId) throws Exception;

	public List<MediaDto> getMediaDetails(int mediaId) throws Exception;

	public ArrayList<MediaDto> listOfChart(MediaDto mediaDto) throws Exception;

}
