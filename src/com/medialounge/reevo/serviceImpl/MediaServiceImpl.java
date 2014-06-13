package com.medialounge.reevo.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.MediaDao;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.dto.UserFeedbackDTO;
import com.medialounge.reevo.service.MediaService;
import com.medialounge.reevo.util.MediaLoungeConstant;

/**
 * @author Ramachandran R
 * 
 */
@Service("mediaService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class MediaServiceImpl implements MediaService {

	@Autowired
	private MediaDao mediaDao;
	
	public ArrayList<MediaDto> listOfMedias(MediaDto mediaDto) throws Exception {
		
		ArrayList<MediaDto> mediaDaos = new ArrayList<MediaDto>();
		String type = mediaDto.getType();
		if (type.equals(MediaLoungeConstant.MY_FEED) || type.equals(MediaLoungeConstant.MEGA_FEED)
				|| type.equals(MediaLoungeConstant.ARCHIVE)) {
			mediaDaos = mediaDao.listOfMedias(mediaDto);
		}
		if (type.equals(MediaLoungeConstant.SOCIAL_FEED)) {
			mediaDaos = mediaDao.listOfSocialMedias(mediaDto);
		}
		if (type.equals(MediaLoungeConstant.CHART)) {
			mediaDaos = mediaDao.listOfChart(mediaDto);
		}
		return mediaDaos;
	}

	public String saveMedia(MediaDto mediaDto, int userId) throws Exception {
		return mediaDao.saveMedia(mediaDto, userId);
	}

	public ArrayList<MediaDto> searchBasedOnMediaType(String mediaSearchKey,
			String type, int userId) throws Exception {
		ArrayList<MediaDto> mediaDaos = new ArrayList<MediaDto>();
		ArrayList<MediaDto> mediaDaosList = new ArrayList<MediaDto>();
		MediaDto mDto = null;
		mediaDaos = mediaDao.searchBasedOnMediaType(mediaSearchKey, type,
				userId);

		for (MediaDto dto : mediaDaos) {
			try {
				mDto = new MediaDto();
				SimpleDateFormat format = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String dateInString = dto.getCreated();
				Date createdDate = format.parse(dateInString);

				Date currentDate = new Date();
				long diff = currentDate.getTime() - createdDate.getTime();
				long diffMinutes = diff / (60 * 1000);
				String result = "";
				if (diffMinutes > 60) {
					long hr = diffMinutes / 60;
					if (hr > 24) {
						long day = hr / 24;
						if (day > 30) {
							long month = day / 30;
							if (month > 12) {
								int yr = (int) (month / 12);
								String years = yr + " years ago";
								result = years;
							} else {
								String months = month + " months ago";
								result = months;
							}
						} else {
							String days = day + " days ago";
							result = days;
						}
					} else {
						String hour = hr + " hour ago";
						result = hour;
					}
				} else {
					String minute = diffMinutes + " mins ago";
					result = minute;
				}
				dto.setCreated(result);
				BeanUtils.copyProperties(mDto, dto);
				mediaDaosList.add(mDto);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mediaDaosList;
	}

	/*public ArrayList<MediaDto> addMediaComment(MediaDto mediaDto) {
		return mediaDao.addMediaComment(mediaDto);
	}*/

	/*public List<MediaDto> listOfComments(List<MediaDto> mediaDtos) {
		return mediaDao.listOfComments(mediaDtos);
	}*/

	/*public void addMediaAccessUser(MediaDto mediaDto) {
		mediaDao.addMediaAccessUser(mediaDto);
	}*/

	/*public ArrayList<MediaDto> listOfAccessUser(MediaDto mediaDto) {
		return mediaDao.listOfAccessUser(mediaDto);
	}*/

	/*public String checkNumber(String name) {
		return mediaDao.checkNumber(name);
	}*/

	/*public void savePaidContent(MediaDto mediaDto) {
		mediaDao.savePaidContent(mediaDto);
	}*/

	/*
	 * public ArrayList<MediaDto> listofSocialMediaContents(String userId){
	 * return mediaDao.listofSocialMediaContents(userId); }
	 */

	public ArrayList<UserDto> getExpert(String userId) {
		return mediaDao.getExpert(userId);
	}

	public boolean saveCommentsToExpert(UserDto userDto) {
		return mediaDao.saveCommentsToExpert(userDto);
	}

	public ArrayList<UserDto> viewCommantsList(String mediaId) {
		return mediaDao.viewCommantsList(mediaId);
	}

	@Override
	public String saveUserComment(MediaReviewDTO mediaReviewDTO) throws Exception{
		return mediaDao.saveUserComment(mediaReviewDTO);
	}

	@Override
	public Map getSpotLightDetails(String userId) throws Exception{
		return mediaDao.getSpotLightDetails(userId);
	}

	@Override
	public List<UserDto> getExpertCommentsList(String mediaId, String expertType) {
		return mediaDao.getExpertCommentsList(mediaId, expertType);
	}

	@Override
	public ArrayList<UserFeedbackDTO> getFeedbackByMediaId(int mediaId) {
		return mediaDao.getFeedbackByMediaId(mediaId);
	}

	@Override
	public String saveFeedback(UserFeedbackDTO feedbackDTO) {
		return mediaDao.saveFeedback(feedbackDTO);
	}

	@Override
	public List<MediaDto> listOfMediasFMF(MediaDto mediaDto) throws Exception {
		return mediaDao.listOfMediasFMF(mediaDto);
	}

	@Override
	public Map getCharts() throws Exception{

		return mediaDao.getCharts();
	}

	@Override
	public Map loadPopularVideos() throws Exception{

		return mediaDao.loadPopularVideos();
	}

	@Override
	public String mediasUpdateRating(int mediaId, int ratingCurrentValue,
			int countOfUsersRated, double ratingAverage) throws Exception {

		return mediaDao.mediasUpdateRating(mediaId, ratingCurrentValue,
				countOfUsersRated, ratingAverage);
	}

	@Override
	public MediaDto mediasGetRating(String mediaId) throws Exception {
		return mediaDao.mediasGetRating(mediaId);
	}

	@Override
	public List<MediaDto> getListOfKeys(int userId) throws Exception {
		return mediaDao.getListOfKeys(userId);
	}

	@Override
	public List<MediaDto> feedBackKeys(int mediaId) {
		return mediaDao.feedBackKeys(mediaId);
	}

	@Override
	public int fmfActivation(int userId, int mediaId) throws Exception {
		return mediaDao.fmfActivation(userId, mediaId);
	}

	public List<MediaDto> getMediaDetails(int mediaId) throws Exception {
		return mediaDao.getMediaDetails(mediaId);
	}
}
